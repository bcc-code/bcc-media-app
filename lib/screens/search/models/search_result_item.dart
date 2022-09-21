import 'package:flutter/scheduler.dart';

import '../../../graphql/queries/search.graphql.dart';

enum ResultType {
  show,
  season,
  episode,
}

class SearchResultItem {
  final String collection;
  final String id;
  final String? legacyID;
  final String title;
  final String? description;
  final String? image;
  final String? showTitle;
  final ResultType? type;

  SearchResultItem({
    required this.collection,
    required this.id,
    required this.title,
    this.legacyID,
    this.description,
    this.image,
    this.showTitle,
    this.type,
  });

  factory SearchResultItem.fromResult(Fragment$SearchResultItem result) {
    return SearchResultItem(
      collection: result.collection,
      id: result.id,
      title: result.title,
      legacyID: result.legacyID,
      description: result.description,
      image: result.image,
      showTitle: result is Fragment$SearchResultItem$$EpisodeSearchItem
          ? result.showTitle
          : null,
      type: getResultType(result.$__typename),
    );
  }

  static ResultType? getResultType(String type) {
    switch (type) {
      case 'ShowSearchItem':
        return ResultType.show;
      case 'SeasonSearchItem':
        return ResultType.season;
      case 'EpisodeSearchItem':
        return ResultType.episode;
      default:
        return null;
    }
  }
}
