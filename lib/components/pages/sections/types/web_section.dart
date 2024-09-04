import 'package:brunstadtv_app/helpers/main_js_channel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shimmer/shimmer.dart';
import 'package:universal_io/io.dart';

import 'package:bccm_core/platform.dart';
import 'package:bccm_core/design_system.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget _heightOrAspectRatio({double? height, required double aspectRatio, required Widget child}) {
  if (height != null) {
    return ConstrainedBox(constraints: BoxConstraints.loose(Size.fromHeight(height)), child: child);
  } else if (aspectRatio != 0) {
    return AspectRatio(aspectRatio: aspectRatio, child: child);
  } else {
    return const SizedBox.shrink();
  }
}

class WebSection extends HookWidget {
  final Fragment$Section$$WebSection data;

  const WebSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final loadFuture = useState<Future<void>?>(null);
    final loadSnapshot = useFuture(loadFuture.value);
    final loading = loadSnapshot.connectionState == ConnectionState.waiting;

    final uri = useMemoized(() => Uri.tryParse(data.url), [data.url]);
    final manager = useWebViewManager(uri, setup: (manager) {
      MainJsChannel.register(context, manager, enableAuth: false);
    });

    final design = DesignSystem.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: _heightOrAspectRatio(
          height: data.height?.toDouble(),
          aspectRatio: data.widthRatio,
          child: Stack(
            children: [
              if (manager != null) WebViewWidget(controller: manager.controller),
              Positioned.fill(
                child: IgnorePointer(
                  ignoring: !loading,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,
                    child: loading && !Platform.isAndroid
                        ? Shimmer.fromColors(
                            period: const Duration(milliseconds: 1000),
                            baseColor: design.colors.background1,
                            highlightColor: design.colors.background2,
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: design.colors.background2),
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
