import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DialogOnWeb extends StatelessWidget {
  const DialogOnWeb({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return child;
    return Dialog(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 500,
          height: 800,
          child: child,
        ),
      ),
    );
  }
}
