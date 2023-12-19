import 'package:bccm_core/api.dart';
import 'package:brunstadtv_app/providers/connectivity.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:brunstadtv_app/providers/graphql.dart';

class EpisodeAvailability {
  final String? errorCode;
  final DateTime? availableFrom;
  final DateTime? availableTo;

  const EpisodeAvailability({
    this.errorCode,
    this.availableFrom,
    this.availableTo,
  });
}

final episodeAvailabilityProvider = FutureProvider.family<EpisodeAvailability?, String>(
  (ref, episodeId) async {
    debugPrint('episodeAvailabilityProvider fetching for episodeId: $episodeId');
    if (ref.read(isOfflineProvider)) return null;
    final result = await ref.watch(gqlClientProvider).query$getEpisodeAvailability(
          Options$Query$getEpisodeAvailability(
            variables: Variables$Query$getEpisodeAvailability(episodeId: episodeId),
          ),
        );
    final errors = result.exception?.graphqlErrors;
    return EpisodeAvailability(
      errorCode: errors?.firstWhereOrNull((element) => element.extensions?['code'] != null)?.extensions?['code'] as String?,
      availableFrom: DateTime.tryParse(result.parsedData?.episode.availableFrom ?? ''),
      availableTo: DateTime.tryParse(result.parsedData?.episode.availableTo ?? ''),
    );
  },
);
