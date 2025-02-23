import 'package:bccm_core/platform.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ApiErrorCodes {
  ApiErrorCodes._();
  static const String noAccess = 'item/no-access';
  static const String notPublished = 'item/not-published';
  static const String notFound = 'item/not-found';

  static bool isNoAccess(OperationException? exception) {
    return exception?.graphqlErrors.any((e) => e.extensions?['code'] == noAccess) ?? false;
  }

  static bool isNotPublished(OperationException? exception) {
    return exception?.graphqlErrors.any((e) => e.extensions?['code'] == notPublished) ?? false;
  }

  static bool isNotFound(OperationException? exception) {
    return exception?.graphqlErrors.any((e) => e.extensions?['code'] == notFound) ?? false;
  }

  static bool isInaccessible(OperationException? exception) {
    return isNotFound(exception) || isNoAccess(exception) || isNotPublished(exception);
  }
}

class Api {
  final String? accessToken;
  final GraphQLClient gqlClient;

  Api({this.accessToken, required this.gqlClient});

  Future<Query$FetchEpisode$episode?> fetchEpisode(String id, {Input$EpisodeContext? context}) async {
    final result = await gqlClient.query$FetchEpisode(
      Options$Query$FetchEpisode(
        variables: Variables$Query$FetchEpisode(
          id: id,
          context: context,
          authenticated: accessToken != null,
        ),
      ),
    );
    if (result.exception != null) {
      throw result.exception!;
    }

    return result.parsedData?.episode;
  }

  Future<Query$GetSeasonEpisodes$season?> getSeasonEpisodes(String id) async {
    final result = await gqlClient.query$GetSeasonEpisodes(
      Options$Query$GetSeasonEpisodes(
        variables: Variables$Query$GetSeasonEpisodes(id: id),
      ),
    );
    if (result.hasException) {
      throw ErrorDescription(result.exception.toString());
    }

    return result.parsedData?.season;
  }

  Future<Query$GetEpisodeLessonProgress?> loadLessonProgressForEpisode(String id) async {
    final value = await gqlClient.query$GetEpisodeLessonProgress(
      Options$Query$GetEpisodeLessonProgress(
        variables: Variables$Query$GetEpisodeLessonProgress(
          id: id,
        ),
      ),
    );
    return value.parsedData;
  }

  Future<Query$Page$page> getPage(String code) async {
    return gqlClient
        .query$Page(
      Options$Query$Page(
        variables: Variables$Query$Page(code: code),
        errorPolicy: ErrorPolicy.all,
      ),
    )
        .then(
      (value) {
        if (value.exception != null) {
          throw value.exception!;
        }
        if (value.parsedData == null) {
          throw ErrorDescription("No data for page code: '$code'");
        }
        return value.parsedData!.page;
      },
    ).onError(
      (error, stackTrace) {
        Sentry.captureException(error, stackTrace: stackTrace);
        var message = error.asOrNull<ErrorDescription>();
        if (message != null) {
          debugPrint(message.value.toString());
        }
        return Future.error(error ?? ErrorHint('Unknown error'));
      },
    );
  }

  Future updateProgress({required String episodeId, required int? progress}) async {
    if (accessToken == null) return;
    return gqlClient
        .mutate$setEpisodeProgress(
          Options$Mutation$setEpisodeProgress(
            variables: Variables$Mutation$setEpisodeProgress(id: episodeId, progress: progress?.round()),
          ),
        )
        .then(
          (value) => debugPrint('set progress to: ${value.parsedData?.setEpisodeProgress.progress.toString()}'),
        );
  }

  Future<Query$CalendarDayEpisodeEntries$calendar?> getCalendarDayEpisodes(DateTime date) {
    return gqlClient
        .query$CalendarDayEpisodeEntries(
            Options$Query$CalendarDayEpisodeEntries(variables: Variables$Query$CalendarDayEpisodeEntries(date: getFormattedDateTime(date))))
        .then((result) {
      if (result.hasException) {
        throw result.exception!;
      }
      if (result.parsedData == null) {
        throw ErrorDescription('Calender data for today is null.');
      }
      return result.parsedData!.calendar;
    });
  }

  Future<List<Fragment$Prompt>> getPrompts() {
    return gqlClient.query$getPrompts().then((result) {
      if (result.hasException) {
        throw result.exception!;
      }
      if (result.parsedData == null) {
        throw ErrorDescription('Survey data is null.');
      }
      return result.parsedData!.prompts;
    });
  }

  Future<String> sendSurveyAnswerText(String id, String answer) {
    return gqlClient
        .mutate$answerSurveyQuestion(
            Options$Mutation$answerSurveyQuestion(variables: Variables$Mutation$answerSurveyQuestion(id: id, answer: answer)))
        .then(
      (result) {
        if (result.hasException) {
          throw result.exception!;
        }
        if (result.parsedData == null) {
          throw ErrorDescription('Survey submition result is null.');
        }
        return result.parsedData!.answerSurveyQuestion.id;
      },
    );
  }

  Future<String> sendSurveyAnswerRating(String id, int rating) {
    return sendSurveyAnswerText(id, rating.toString());
  }

  Future<String?> legacyIdLookup({
    int? legacyEpisodeId,
    int? legacyProgramId,
  }) async {
    assert(legacyEpisodeId != null || legacyProgramId != null, 'Either legacyEpisodeId or legacyProgramId must be set.');
    assert(legacyEpisodeId == null || legacyProgramId == null, "LegacyEpisodeId and legacyProgramId can't be set at the same time.");
    final variables = Variables$Query$legacyIDLookup(
      episodeId: legacyEpisodeId,
      programId: legacyProgramId,
    );
    final value = await gqlClient.query$legacyIDLookup(Options$Query$legacyIDLookup(variables: variables));
    if (value.hasException) {
      Sentry.captureException(value.exception, stackTrace: StackTrace.current);
      return null;
    }
    if (value.parsedData == null) {
      final legacyType = legacyEpisodeId != null ? 'episode' : 'program';
      final id = legacyEpisodeId ?? legacyProgramId;
      Sentry.captureException(Exception('Could not find new episode id from legacy $legacyType id: "$id"'), stackTrace: StackTrace.current);
      return null;
    }
    return value.parsedData!.legacyIDLookup.id;
  }
}

final apiProvider = Provider<Api>((ref) {
  return Api(accessToken: ref.watch(authStateProvider).auth0AccessToken, gqlClient: ref.watch(bccmGraphQLProvider));
});
