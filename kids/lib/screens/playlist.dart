import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

@RoutePage<void>()
class PlaylistScreen extends HookWidget {
  const PlaylistScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final double basePadding = bp.smallerThan(TABLET) ? 24.0 : 48.0;
    final titleStyle = bp.smallerThan(TABLET) ? design.textStyles.headline3 : design.textStyles.headline2;
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
