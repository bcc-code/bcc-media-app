import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/providers/settings.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bmm_api/bmm_api.dart';

String _mapLanguage(String bccmLang) {
  if (bccmLang == 'no') {
    return 'nb';
  }

  return bccmLang;
}

final bmmApiProvider = Provider<BmmApiWrapper>((ref) {
  return BmmApiWrapper(
    basePathOverride: 'https://bmm-api.brunstad.org',
    getAuthToken: () => ref.read(authStateProvider).auth0AccessToken,
    interceptors: [
      InterceptorsWrapper(onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer ${ref.read(authStateProvider).auth0AccessToken}';
        options.headers['Accept-Language'] = [_mapLanguage(ref.read(settingsProvider).appLanguage.languageCode)];
        options.headers['BMM-Version'] = '1.101.0';
        return handler.next(options);
      }),
    ],
  );
});

final bmmDiscoverProvider = FutureProvider((ref) {
  final lang = _mapLanguage(ref.watch(settingsProvider.select((s) => s.appLanguage.languageCode)));
  final birthDate = ref.read(authStateProvider).user?.birthdate;
  final birthDay = birthDate != null ? DateTime.tryParse(birthDate) : null;
  final age = birthDay != null ? (DateTime.now().difference(birthDay).inDays / 365).floor() : null;

  return ref.watch(bmmApiProvider).getDiscoverApi().discoverGet(
        lang: LanguageEnum.valueOf(lang),
        theme: 'dark',
        age: age,
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

class BmmApiWrapper extends BmmApi {
  BmmApiWrapper({
    super.basePathOverride,
    super.interceptors,
    required this.getAuthToken,
  });

  final String? Function() getAuthToken;

  String? protectedUrl(String? url) {
    if (url == null) return null;
    final token = getAuthToken();
    if (token == null) return null;
    final uri = Uri.tryParse(url);
    return uri?.replace(queryParameters: {
      ...uri.queryParameters,
      'auth': 'Bearer ${getAuthToken()}',
    }).toString();
  }
}
