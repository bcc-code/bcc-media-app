import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../graphql/client.dart';
import '../../graphql/queries/page.graphql.dart';
import '../icon_label_button.dart';
import 'featured_section.dart';
import 'icon_section.dart';
import 'poster_section.dart';
import 'default_section.dart';
import 'favourites.dart';
import 'error_message.dart';
import 'kids_bible_stories.dart';
import 'category_chips.dart';
import 'sample_data.dart';

class BccmPage extends ConsumerStatefulWidget {
  final String code;
  final String parentPageName;

  const BccmPage({
    super.key,
    required this.code,
    // this.appbarOffset = 0,
    required this.parentPageName,
  });

  @override
  ConsumerState<BccmPage> createState() => _BccmPageState();
}

class _BccmPageState extends ConsumerState<BccmPage> {
  final isLoading = false;
  final hasLoadingError = false;
  late Future<Query$Page$page?> resultFuture;

  @override
  void initState() {
    super.initState();

    final client = ref.read(gqlClientProvider);

    resultFuture = client
        .query$Page(
      Options$Query$Page(variables: Variables$Query$Page(code: widget.code)),
    )
        .then(
      (value) {
        if (value.hasException) {
          throw ErrorDescription(value.exception.toString());
        }
        return value.parsedData?.page;
      },
    ).catchError(
      (error) {
        print(error);
      },
    );
  }

  Widget getPage(Query$Page$page pageData) {
    final sectionItems = pageData.sections.items;

    return ListView.builder(
      padding: const EdgeInsets.only(top: 12),
      itemCount: sectionItems.length,
      itemBuilder: ((context, index) {
        if (sectionItems[index] is Fragment$Section$$IconSection) {
          return IconSection(
              sectionItems[index] as Fragment$Section$$IconSection);
        } else if (sectionItems[index] is Fragment$Section$$DefaultSection) {
          return DefaultSection(
              sectionItems[index] as Fragment$Section$$DefaultSection);
        } else if (sectionItems[index] is Fragment$Section$$PosterSection) {
          return PosterSection(
              sectionItems[index] as Fragment$Section$$PosterSection);
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
    return FutureBuilder(
      future: resultFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingContent;
        }
        if (snapshot.hasData) {
          return getPage(snapshot.data as Query$Page$page);
        } else if (snapshot.hasError) {
          print(snapshot.error.toString());
          return loadingError;
        }
        return loadingContent;
      },
    );

    // if (isLoading) {
    //   return loadingContent;
    // } else if (hasLoadingError) {
    //   return loadingError;
    // } else {
    //   return ListView(
    //     padding: const EdgeInsets.only(top: 12),
    //     children:
    //         // SizedBox(height: appbarOffset),
    //         (widget.code == 'frontpage'
    //                 ? frontPageSections
    //                 : exploreCategoriesSections)
    //             .map((section) {
    //       switch (section['type']) {
    //         case 'featured':
    //           return Featured(
    //               items: section['items'] as List<Map<String, dynamic>>);
    //         case 'explore_categories':
    //           return IconSection(data: section);
    //         case 'continue_watching':
    //           return ContinueWatching(data: section);
    //         case 'trending':
    //           return Trending(data: section);
    //         case 'favourites':
    //           return Favourites(data: section);
    //         case 'kids_bible_stories':
    //           return KidsBibleStories(data: section);
    //         case 'categories':
    //           return CategoryChips(
    //             data: section,
    //             parentPageName: widget.parentPageName,
    //           );
    //         case 'error':
    //           return ErrorMessage(data: section);
    //         default:
    //           return Container();
    //       }
    //     }).toList(),
    //   );
    // }
  }

  final loadingContent = Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: const CircularProgressIndicator(strokeWidth: 2),
      ),
      const Text(
        'Loading content',
        style: TextStyle(
          color: Color.fromRGBO(112, 124, 142, 1),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: const Text(
              'Check internet connection and try again',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(180, 192, 210, 1),
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          IconLabelButton.medium(labelText: 'Try again', onPressed: () {})
        ],
      ),
    ),
  );
}
