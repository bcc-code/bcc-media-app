import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../graphql/queries/page.graphql.dart';
import '../helpers/btv_colors.dart';
import '../helpers/utils.dart';
import '../helpers/btv_buttons.dart';

class FeaturedSection extends StatelessWidget {
  final Fragment$Section$$FeaturedSection data;

  const FeaturedSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      const marginX = 2.0;
      final viewportFraction =
          (constraints.maxWidth - (32 - 2 * marginX)) / constraints.maxWidth;
      final sectionItems = data.items.items;
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SizedBox(
          height: 323,
          child: PageView.builder(
            physics: const _CustomPageViewScrollPhysics(),
            controller: PageController(viewportFraction: viewportFraction),
            itemCount: sectionItems.length,
            itemBuilder: (context, index) {
              final sectionItem = sectionItems[index % sectionItems.length];
              return _FeaturedItem(
                sectionItem: sectionItem,
                margin: const EdgeInsets.symmetric(horizontal: marginX),
              );
            },
          ),
        ),
      );
    });
  }
}

class _FeaturedItem extends StatelessWidget {
  final Fragment$Section$$FeaturedSection$items$items sectionItem;
  final EdgeInsetsGeometry? margin;

  const _FeaturedItem({
    required this.sectionItem,
    this.margin = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => handleSectionItemClick(context, sectionItem.item),
      child: Container(
        margin: margin,
        height: double.infinity,
        child: Stack(children: [
          _GradientImage(image: sectionItem.image),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: 12, right: 18, bottom: 18, left: 18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    BtvColors.background1.withOpacity(0),
                    BtvColors.background1,
                  ],
                  stops: const [0, 0.36],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      sectionItem.title,
                      textAlign: TextAlign.center,
                      style: BtvTextStyles.title1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      sectionItem.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          BtvTextStyles.body2.copyWith(color: BtvColors.label2),
                    ),
                  ),
                  false
                      ? BtvButton.smallRed(
                          imagePath: 'assets/icons/Play.png',
                          labelText: 'Live',
                          onPressed: () {},
                        )
                      : BtvButton.smallSecondary(
                          imagePath: 'assets/icons/Play.png',
                          labelText: 'Watch now',
                          onPressed: () {
                            var episodeItem = sectionItem.item.asOrNull<
                                Fragment$Section$$FeaturedSection$items$items$item$$Episode>();
                            var showItem = sectionItem.item.asOrNull<
                                Fragment$Section$$FeaturedSection$items$items$item$$Show>();
                            if (episodeItem != null) {
                              context.router.navigate(EpisodeScreenRoute(
                                  episodeId: episodeItem.id));
                            } else if (showItem != null) {
                              context.router.navigate(EpisodeScreenRoute(
                                  episodeId: showItem.defaultEpisode.id));
                            }
                          },
                        ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _GradientImage extends StatelessWidget {
  final String? image;
  final height = 290.0;

  const _GradientImage({this.image});

  @override
  Widget build(BuildContext context) {
    //TODO: use fadeinimage instead
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: BtvColors.background2,
        image: image != null
            ? DecorationImage(
                fit: BoxFit.cover,
                image: cacheOptimizedImage(
                    context: context, imageUrl: image!, height: height),
              )
            : null,
      ),
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            BtvColors.background1.withOpacity(0.23),
            const Color.fromRGBO(26, 37, 53, 0),
            BtvColors.background1,
          ],
          stops: [0, 0.5, 1],
        ),
      ),
    );
  }
}

class _CustomPageViewScrollPhysics extends ScrollPhysics {
  const _CustomPageViewScrollPhysics({ScrollPhysics? parent})
      : super(parent: parent);

  @override
  _CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 50,
        stiffness: 10,
        damping: 2,
      );
}
