import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class AppBarWithScrollToTop extends StatelessWidget implements PreferredSizeWidget {
  final AppBar child;
  final ScrollController? scrollController;

  const AppBarWithScrollToTop({super.key, required this.child, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return child;
    }
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            bottom: false,
            top: true,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                scrollController?.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutExpo,
                );
              },
              child: Container(
                height: 8,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => child.preferredSize;
}
