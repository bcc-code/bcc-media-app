import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/components/shorts/short_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage<void>()
class ShortsScreen extends HookConsumerWidget {
  const ShortsScreen({
    super.key,
    this.preventScroll = false,
  });

  final bool preventScroll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ShortScrollView(),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: SizedBox(
                height: 40,
                child: CustomBackButton(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
