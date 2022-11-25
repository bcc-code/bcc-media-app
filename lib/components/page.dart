import 'package:brunstadtv_app/models/analytics/sections.dart';
import 'package:flutter/material.dart';

import '../graphql/queries/page.graphql.dart';
import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../l10n/app_localizations.dart';
import '../helpers/btv_buttons.dart';
import '../helpers/utils.dart';
import '../providers/inherited_data.dart';
import 'featured_section.dart';
import 'default_grid_section.dart';
import 'message_section.dart';
import 'poster_grid_section.dart';
import 'icon_section.dart';
import 'label_section.dart';
import 'poster_section.dart';
import 'default_section.dart';
import 'icon_grid_section.dart';
import 'list_section.dart';
import 'page_section.dart';
import 'web_section.dart';

class BccmPage extends StatefulWidget {
  final Future<Query$Page$page> pageFuture;
  final Future Function({bool? retry}) onRefresh;

  const BccmPage({
    super.key,
    required this.pageFuture,
    required this.onRefresh,
  });

  @override
  State<BccmPage> createState() => _BccmPageState();
}

class _BccmPageState extends State<BccmPage> {
  GlobalKey<State<FutureBuilder<Query$Page$page>>> futureBuilderKey = GlobalKey();

  Widget? _getSectionWidget(Fragment$Section s) {
    final iconSection = s.asOrNull<Fragment$Section$$IconSection>();
    if (iconSection != null) {
      return PageSection(title: iconSection.title, child: IconSection(iconSection));
    }
    final labelSection = s.asOrNull<Fragment$Section$$LabelSection>();
    if (labelSection != null) {
      return PageSection(title: labelSection.title, child: LabelSection(labelSection));
    }
    final defaultSection = s.asOrNull<Fragment$Section$$DefaultSection>();
    if (defaultSection != null) {
      return PageSection(title: defaultSection.title, child: DefaultSection(defaultSection));
    }
    final posterSection = s.asOrNull<Fragment$Section$$PosterSection>();
    if (posterSection != null) {
      return PageSection(title: posterSection.title, child: PosterSection(posterSection));
    }
    final defaultGridSection = s.asOrNull<Fragment$Section$$DefaultGridSection>();
    if (defaultGridSection != null) {
      return PageSection(title: defaultGridSection.title, child: DefaultGridSection(defaultGridSection));
    }
    final posterGridSection = s.asOrNull<Fragment$Section$$PosterGridSection>();
    if (posterGridSection != null) {
      return PageSection(title: posterGridSection.title, child: PosterGridSection(posterGridSection));
    }
    final featuredSection = s.asOrNull<Fragment$Section$$FeaturedSection>();
    if (featuredSection != null) {
      return PageSection(title: featuredSection.title, child: FeaturedSection(featuredSection));
    }
    final iconGridSection = s.asOrNull<Fragment$Section$$IconGridSection>();
    if (iconGridSection != null) {
      return PageSection(title: iconGridSection.title, child: IconGridSection(iconGridSection));
    }
    final listSection = s.asOrNull<Fragment$Section$$ListSection>();
    if (listSection != null) {
      return PageSection(title: listSection.title, child: ListSection(listSection));
    }
    final webSection = s.asOrNull<Fragment$Section$$WebSection>();
    if (webSection != null) {
      return PageSection(title: webSection.title, child: WebSection(webSection));
    }
    final messageSection = s.asOrNull<Fragment$Section$$MessageSection>();
    if (messageSection != null) {
      return Padding(padding: const EdgeInsets.only(top: 4), child: PageSection(title: messageSection.title, child: MessageSection(messageSection)));
    }
    return null;
  }

  Widget getPage(context, Query$Page$page pageData) {
    final sectionItems = pageData.sections.items.where((section) {
      if (section.asOrNull<Fragment$ItemSection>()?.items.items.isEmpty == true) {
        return false;
      }
      return true;
    }).toList();
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: mediaQueryData.copyWith(padding: mediaQueryData.padding.copyWith(bottom: mediaQueryData.padding.bottom + 32)),
      child: RefreshIndicator(
        edgeOffset: MediaQuery.of(context).padding.top,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        displacement: 40,
        onRefresh: () {
          setState(() {
            futureBuilderKey = GlobalKey();
          });
          return widget.onRefresh();
        },
        notificationPredicate: (notification) => true,
        child: ListView.builder(
          cacheExtent: 3000,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: sectionItems.length,
          itemBuilder: ((context, index) {
            var s = sectionItems[index];
            final widget = _getSectionWidget(s);
            if (widget != null) {
              return InheritedData<SectionAnalytics>(
                inheritedData: SectionAnalytics(id: s.id, position: index, type: s.$__typename, name: s.title),
                child: (context) => widget,
              );
            }
            return const SizedBox.shrink();
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Query$Page$page>(
      key: futureBuilderKey,
      future: widget.pageFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return getPage(context, snapshot.data!);
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return loadingError(context);
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return getLoadingContent(context);
        }
        return getLoadingContent(context);
      },
    );
  }

  getLoadingContent(context) => Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
          Text(
            S.of(context).loadingContent,
            style: BtvTextStyles.body2,
          ),
        ]),
      );

  Widget loadingError(BuildContext context) => Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  S.of(context).loadContentError,
                  style: BtvTextStyles.title1,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(
                  S.of(context).checkNetwork,
                  textAlign: TextAlign.center,
                  style: BtvTextStyles.body1.copyWith(color: BtvColors.label3),
                ),
              ),
              BtvButton.medium(
                labelText: S.of(context).tryAgainButton,
                onPressed: () {
                  setState(() {
                    futureBuilderKey = GlobalKey();
                  });
                  widget.onRefresh(retry: true);
                },
              )
            ],
          ),
        ),
      );
}
