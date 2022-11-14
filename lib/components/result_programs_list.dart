import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:brunstadtv_app/graphql/queries/search.graphql.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import 'horizontal_slider.dart';
import 'bordered_image_container.dart';

class ResultProgramsList extends StatelessWidget {
  final String title;
  final List<Fragment$SearchResultItem$$ShowSearchItem> items;

  const ResultProgramsList({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 12, right: 16, bottom: 8, left: 16),
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: BtvTextStyles.title2,
          ),
        ),
        HorizontalSlider(
          height: 140,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            var item = items[index];
            return _Program(item);
          },
        ),
      ],
    );
  }
}

class _Program extends StatefulWidget {
  final Fragment$SearchResultItem$$ShowSearchItem _item;

  const _Program(this._item);

  @override
  State<_Program> createState() => _ProgramState();
}

class _ProgramState extends State<_Program> {
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
                              child: Container(color: BtvColors.background1.withOpacity(0.5), child: const Center(child: LoadingIndicator()))),
                          error: (e) => const SizedBox.shrink(),
                          noData: () => const SizedBox.shrink(),
                          ready: (d) => const SizedBox.shrink()),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(widget._item.title, style: BtvTextStyles.caption1.copyWith(color: BtvColors.label1)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
