import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/env/env.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/openapi.dart';

final bmmApiProvider = Provider<BmmApiWrapper>((ref) {
  return BmmApiWrapper(
    basePathOverride: 'https://bmm-api.brunstad.org',
    interceptors: [
      InterceptorsWrapper(onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer ${Env.bmmAuthToken}';
        options.headers['Accept-Language'] = [ref.read(settingsProvider).appLanguage.languageCode];
        options.headers['BMM-Version'] = '1.101.0';
        return handler.next(options);
      }),
    ],
  );
});

final bmmDiscoverProvider = FutureProvider((ref) {
  return ref.watch(bmmApiProvider).getDiscoverApi().discoverGet(
        age: 24,
        lang: LanguageEnum.en,
      );
});

final bmmDefaultPlaylistProvider = FutureProvider((ref) async {
  final playlistId = ref
      .watch(bmmDiscoverProvider)
      .asData
      ?.valueOrNull
      ?.data
      ?.firstWhere(
        (e) => e.oneOf.value is PlaylistModel,
      )
      .oneOf
      .value
      ?.asOrNull<PlaylistModel>();
  if (playlistId == null) return null;
  final res = await ref.watch(bmmApiProvider).getPlaylistApi().playlistIdTrackGet(
        id: playlistId.id,
      );
  return res.data;
});

class BmmApiWrapper extends Openapi {
  BmmApiWrapper({
    super.basePathOverride,
    super.interceptors,
  });

  String? protectedUrl(String? url) {
    if (url == null) return null;
    final uri = Uri.tryParse(url);
    return uri?.replace(queryParameters: {
      ...uri.queryParameters,
      'auth': 'Bearer ${Env.bmmAuthToken}',
    }).toString();
  }
}
