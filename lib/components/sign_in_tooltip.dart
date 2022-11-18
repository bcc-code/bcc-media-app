import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';
import '../l10n/app_localizations.dart';
import 'Package:flutter/material.dart';

class SignInTooltip extends StatelessWidget {
  final VoidCallback onClose;
  const SignInTooltip({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 14,
            child: Container(
              decoration: BoxDecoration(
                color: BtvColors.tint1,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 4, bottom: 10, left: 12),
                    child: Text(
                      S.of(context).signInTooltip,
                      style: BtvTextStyles.body2.copyWith(color: BtvColors.label1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 12, bottom: 8),
                    child: IconButton(
                      icon: Image.asset('assets/icons/Close.png'),
                      constraints: const BoxConstraints(maxHeight: 24),
                      padding: EdgeInsets.zero,
                      onPressed: onClose,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 8,
            child: Transform.scale(
              scaleX: 0.8,
              child: const Icon(
                Icons.arrow_drop_up_sharp,
                color: BtvColors.tint1,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
