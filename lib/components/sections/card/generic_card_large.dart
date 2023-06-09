import 'package:brunstadtv_app/helpers/ui/image.dart';
import 'package:flutter/material.dart';

import '../../../graphql/queries/page.graphql.dart';
import '../../../theme/design_system/design_system.dart';
import '../../../helpers/navigation/navigation_utils.dart';
import '../../../helpers/utils.dart';
import '../../../l10n/app_localizations.dart';
import '../../status_indicators/loading_indicator.dart';

class GenericCardLarge extends StatefulWidget {
  final Fragment$Section$$CardSection$items$items item;
  const GenericCardLarge({super.key, required this.item});

  @override
  State<GenericCardLarge> createState() => _GenericCardLargeState();
}

class _GenericCardLargeState extends State<GenericCardLarge> {
  Future? navigationFuture;

  String? get imageUrl => widget.item.image;

  void onCardTapped() {
    setState(() {
      navigationFuture = handleSectionItemClick(context, widget.item.item);
    });
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Stack(
      children: [
        GestureDetector(
          onTap: onCardTapped,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: imageUrl == null ? const SizedBox.shrink() : simpleFadeInImage(url: imageUrl!),
                ),
                Container(
                  color: design.colors.separatorOnLight,
                  padding: const EdgeInsets.all(18).copyWith(top: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.title,
                        textAlign: TextAlign.left,
                        style: design.textStyles.title1,
                      ),
                      if (widget.item.description.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            widget.item.description,
                            textAlign: TextAlign.left,
                            style: design.textStyles.body2.copyWith(color: design.colors.label2),
                          ),
                        ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        alignment: Alignment.centerRight,
                        child: design.buttons.smallSecondary(
                          onPressed: onCardTapped,
                          labelText: S.of(context).open,
                          image: Image.asset('assets/icons/Play.png'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (navigationFuture != null)
          simpleFutureBuilder(
              future: navigationFuture!,
              loading: () => Positioned.fill(
                  child: Container(color: design.colors.background1.withOpacity(0.5), child: const Center(child: LoadingIndicator()))),
              error: (e) => const SizedBox.shrink(),
              noData: () => const SizedBox.shrink(),
              ready: (d) => const SizedBox.shrink()),
      ],
    );
  }
}
