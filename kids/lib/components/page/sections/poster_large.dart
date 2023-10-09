import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/graphql/queries/page.graphql.dart';
import 'package:brunstadtv_app/helpers/images.dart';
import 'package:brunstadtv_app/helpers/misc.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids/components/buttons/button.dart';
import 'package:kids/helpers/router_utils.dart';
import 'package:kids/helpers/svg_icons.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class PosterLarge extends HookWidget {
  final Fragment$Section$$PosterSection$items$items item;
  const PosterLarge({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    final navigationFuture = useState<Future<void>?>(null);

    void onCardTapped() {
      handleSectionItemClick(context, item.item);
    }

    final bp = ResponsiveBreakpoints.of(context);

    return AspectRatio(
      aspectRatio: 392 / 582,
      child: Stack(
        children: [
          GestureDetector(
            onTap: onCardTapped,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: double.infinity,
                child: simpleFadeInImage(url: item.image!),
              ),
            ),
          ),
          Positioned(
            bottom: bp.smallerThan(TABLET) ? 16 : 40,
            right: bp.smallerThan(TABLET) ? 16 : 40,
            child: design.buttons.responsive(
              variant: ButtonVariant.secondary,
              onPressed: () {},
              labelText: '',
              image: SvgPicture.string(SvgIcons.play, colorFilter: ColorFilter.mode(design.colors.label1, BlendMode.srcIn)),
            ),
          ),
          if (navigationFuture.value != null)
            simpleFutureBuilder(
                future: navigationFuture.value!,
                loading: () => Positioned.fill(
                    child: Container(color: design.colors.background1.withOpacity(0.5), child: const Center(child: LoadingIndicator()))),
                error: (e) => const SizedBox.shrink(),
                noData: () => const SizedBox.shrink(),
                ready: (d) => const SizedBox.shrink()),
        ],
      ),
    );
  }
}
