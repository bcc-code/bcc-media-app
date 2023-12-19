import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/models/analytics/search_result_clicked.dart';
import 'package:brunstadtv_app/providers/analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bccm_core/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bccm_core/design_system.dart';

import '../../helpers/router/router_utils.dart';
import '../../providers/inherited_data.dart';
import '../misc/horizontal_slider.dart';
import '../thumbnails/misc/bordered_image_container.dart';

class ResultProgramsList extends ConsumerStatefulWidget {
  final String title;
  final List<Fragment$SearchResultItem$$ShowSearchItem> items;

  const ResultProgramsList({super.key, required this.title, required this.items});

  @override
  ConsumerState<ResultProgramsList> createState() => _ResultProgramsListState();
}

class _ResultProgramsListState extends ConsumerState<ResultProgramsList> {
  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = kIsWeb ? 80 : 16;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 12, bottom: 8, right: horizontalPadding, left: horizontalPadding),
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(
            widget.title,
            style: DesignSystem.of(context).textStyles.title2,
          ),
        ),
        HorizontalSlider(
          height: 140,
          padding: const EdgeInsets.only(bottom: 8, left: horizontalPadding, right: horizontalPadding),
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, int index) {
            var item = widget.items[index];
            return InheritedData<SearchItemAnalytics>(
              inheritedData: SearchItemAnalytics(position: index, type: item.$__typename, id: item.id, group: 'shows'),
              child: (context) => _Program(item),
            );
          },
        ),
      ],
    );
  }
}

class _Program extends ConsumerStatefulWidget {
  final Fragment$SearchResultItem$$ShowSearchItem _item;

  const _Program(this._item);

  @override
  ConsumerState<_Program> createState() => _ProgramState();
}

class _ProgramState extends ConsumerState<_Program> {
  static const _slideWidth = 140.0;
  Future? navigationFuture;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() {
              navigationFuture = navigateToShowWithoutEpisodeId(context, widget._item.id);
              ref.read(analyticsProvider).searchResultClicked(context);
            });
          },
          child: SizedBox(
            width: _slideWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: BorderedImageContainer(imageUrl: widget._item.image),
                    ),
                    if (navigationFuture != null)
                      simpleFutureBuilder(
                          future: navigationFuture!,
                          loading: () => Positioned.fill(
                              child: Container(
                                  color: DesignSystem.of(context).colors.background1.withOpacity(0.5),
                                  child: const Center(child: LoadingIndicator()))),
                          error: (e) => const SizedBox.shrink(),
                          noData: () => const SizedBox.shrink(),
                          ready: (d) => const SizedBox.shrink()),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(widget._item.title,
                      style: DesignSystem.of(context).textStyles.caption1.copyWith(color: DesignSystem.of(context).colors.label1)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
