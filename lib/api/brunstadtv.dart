import 'dart:convert';

import 'package:brunstadtv_app/graphql/queries/calendar_episode_entries.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/page.graphql.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:brunstadtv_app/providers/auth_state.dart';
import 'package:collection/collection.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/season.graphql.dart';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;

import '../graphql/client.dart';
import '../graphql/queries/application.graphql.dart';
import '../graphql/queries/progress.graphql.dart';
import '../graphql/schema/items.graphql.dart';
import '../services/utils.dart';

class ApiErrorCodes {
  ApiErrorCodes._();
  static const String noAccess = 'item/no-access';
  static const String notPublished = 'item/not-published';
}

class Api {
  final String? accessToken;
  final GraphQLClient gqlClient;

  Api({this.accessToken, required this.gqlClient});

  Future<Query$FetchEpisode$episode?> fetchEpisode(String id) async {
    final result = await gqlClient.query$FetchEpisode(
      Options$Query$FetchEpisode(
        variables: Variables$Query$FetchEpisode(id: id),
      ),
    );
    if (result.exception != null) {
      throw result.exception!;
    }
    var episode = result.parsedData?.episode;
    if (episode == null) return null;

    return episode;
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
    var season = result.parsedData?.season;
    if (season == null) return null;

    return season;
  }

  Future<Query$Page$page> getPage(String code) async {
    return gqlClient
        .query$Page(
      Options$Query$Page(variables: Variables$Query$Page(code: code)),
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
        FirebaseCrashlytics.instance.recordError(error, stackTrace, reason: 'a non-fatal error');
        var message = error.asOrNull<ErrorDescription>();
        if (message != null) {
          debugPrint(message.value.toString());
        }
        return Future.error(error ?? ErrorHint('Unknown error'));
      },
    );
  }

  Future<Query$Application?> queryAppConfig() {
    return gqlClient.query$Application().then((value) {
      if (value.exception != null) {
        throw value.exception!;
      }
      if (value.parsedData == null) {
        throw ErrorDescription('App config data is null.');
      }
      return value.parsedData;
    });
  }

  Future<LivestreamUrl> fetchLiveUrl() async {
    var url = 'https://livestreamfunctions.brunstad.tv/api/urls/live';
    final response = await http.get(Uri.parse(url), headers: {'Authorization': 'Bearer $accessToken'});
    if (response.statusCode != 200) {
      return Future.error('statuscode ${response.statusCode}');
    }
    var body = jsonDecode(response.body);
    return LivestreamUrl.fromJson(body);
  }

  Future updateProgress({required String episodeId, required double? progress}) async {
    return gqlClient
        .mutate$setEpisodeProgress(Options$Mutation$setEpisodeProgress(
            variables: Variables$Mutation$setEpisodeProgress(id: episodeId, progress: progress?.finiteOrNull()?.round())))
        .then((value) => debugPrint('set progress to: ${value.parsedData?.setEpisodeProgress.progress.toString()}'));
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
}

final apiProvider = Provider<Api>((ref) {
  return Api(accessToken: ref.watch(authStateProvider).auth0AccessToken, gqlClient: ref.watch(gqlClientProvider));
});

class LivestreamUrl {
  final String streamUrl;
  final DateTime expiryTime;

  LivestreamUrl({required this.streamUrl, DateTime? expiryTime}) : expiryTime = (expiryTime ?? DateTime.now().add(const Duration(hours: 3)));

  factory LivestreamUrl.fromJson(Map<String, dynamic> json) {
    String streamUrl = json['url'];
    return LivestreamUrl(streamUrl: streamUrl, expiryTime: DateTime.tryParse(json['expiryTime']));
  }
}
