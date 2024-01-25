import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ForceNewApp extends HookWidget {
  const ForceNewApp({super.key});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    void onPressed() {
      openAppOrStore(packageName: kLivePackageName, iosStoreId: kLiveIosId);
    }

    final animControllers = useState<List<AnimationController>>([]);

    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 2 / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onPressed,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 48),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 8,
                    child: simpleFadeInImage(url: 'https://static.bcc.media/images/bcc-connect-live-banner.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  S.of(context).bccLiveForcedDescription2,
                  textAlign: TextAlign.center,
                  style: design.textStyles.body1.copyWith(color: design.colors.label2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 8.0),
                  child: DesignSystem.of(context).buttons.large(
                        autofocus: true,
                        variant: ButtonVariant.primary,
                        onPressed: () {
                          onPressed();
                        },
                        labelText: S.of(context).open,
                      ),
                ),
              ),
            ]
                .animate(autoPlay: true, onInit: (c) => animControllers.value.add(c), interval: 0.ms)
                .slideY(duration: 5000.ms, curve: Curves.easeOutExpo, begin: -0.2)
                .fade(duration: 3000.ms, curve: Curves.easeOutExpo),
          ),
        ),
      ),
    );
  }
}
