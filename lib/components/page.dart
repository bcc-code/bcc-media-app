import 'package:flutter/material.dart';

import '../graphql/queries/page.graphql.dart';
import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import 'icon_label_button.dart';
import 'featured_section.dart';
import 'default_grid_section.dart';
import 'poster_grid_section.dart';
import 'icon_section.dart';
import 'label_section.dart';
import 'poster_section.dart';
import 'default_section.dart';

class BccmPage extends StatelessWidget {
  final Future<Query$Page$page> pageFuture;

  BccmPage({
    super.key,
    required this.pageFuture,
  });

  Widget getPage(Query$Page$page pageData) {
    final sectionItems = pageData.sections.items;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: sectionItems.length,
      itemBuilder: ((context, index) {
        if (sectionItems[index] is Fragment$Section$$IconSection) {
          return IconSection(
              sectionItems[index] as Fragment$Section$$IconSection);
        } else if (sectionItems[index] is Fragment$Section$$LabelSection) {
          return LabelSection(
            sectionItems[index] as Fragment$Section$$LabelSection,
          );
        } else if (sectionItems[index] is Fragment$Section$$DefaultSection) {
          return DefaultSection(
              sectionItems[index] as Fragment$Section$$DefaultSection);
        } else if (sectionItems[index] is Fragment$Section$$PosterSection) {
          return PosterSection(
              sectionItems[index] as Fragment$Section$$PosterSection);
        } else if (sectionItems[index]
            is Fragment$Section$$DefaultGridSection) {
          return DefaultGridSection(
              sectionItems[index] as Fragment$Section$$DefaultGridSection);
        } else if (sectionItems[index] is Fragment$Section$$PosterGridSection) {
          return PosterGridSection(
              sectionItems[index] as Fragment$Section$$PosterGridSection);
        } else if (sectionItems[index] is Fragment$Section$$FeaturedSection) {
          return FeaturedSection(
              sectionItems[index] as Fragment$Section$$FeaturedSection);
        }
        return Container();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Query$Page$page>(
      future: pageFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingContent;
        }
        if (snapshot.hasData) {
          return getPage(snapshot.data!);
        } else if (snapshot.hasError) {
          return loadingError;
        }
        return loadingContent;
      },
    );
  }

  final loadingContent = Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: const CircularProgressIndicator(strokeWidth: 2),
      ),
      const Text(
        'Loading content',
        style: BtvTextStyles.body2,
      ),
    ]),
  );

  final loadingError = Center(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: const Text(
              "Couldn't load content",
              style: BtvTextStyles.title1,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Check internet connection and try again',
              textAlign: TextAlign.center,
              style: BtvTextStyles.body1.copyWith(color: BtvColors.label3),
            ),
          ),
          IconLabelButton.medium(labelText: 'Try again', onPressed: () {})
        ],
      ),
    ),
  );
}
