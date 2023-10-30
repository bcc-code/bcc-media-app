import 'dart:math';

import 'package:brunstadtv_app/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/design_system/design_system.dart';

Future<bool> checkParentalGate(BuildContext context) async {
  if (FlavorConfig.current.flavor != Flavor.kids) {
    return true;
  }
  final result = await showGeneralDialog<bool>(
    context: context,
    barrierDismissible: true,
    barrierLabel: S.of(context).close,
    pageBuilder: (context, prim, sec) => const ParentalGate(),
  );
  if (result == true) {
    return true;
  }
  return false;
}

class ParentalGate extends HookWidget {
  const ParentalGate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // random number between 1 and 100
    final number1 = useMemoized(() => Random().nextInt(10) + 1);
    final number2 = useMemoized(() => Random().nextInt(10) + 1);
    final correct = number1 * number2;
    final answerText = useTextEditingController();
    final animationController = useAnimationController();

    void checkAnswer() {
      if (answerText.value.text.trim().isNotEmpty && int.tryParse(answerText.value.text) == correct) {
        Navigator.pop(context, true);
      } else {
        animationController.forward(from: 0);
        answerText.clear();
      }
    }

    final design = DesignSystem.of(context);
    final bp = ResponsiveBreakpoints.of(context);
    final gapPadding = bp.smallerThan(TABLET) ? 20.0 : 40.0;
    final outerPadding = bp.smallerThan(TABLET) ? 28.0 : 40.0;
    return Animate(
      effects: [
        ScaleEffect(duration: 500.ms, curve: const ElasticOutCurve(0.8)),
        if (bp.smallerThan(TABLET)) const RotateEffect(begin: -0.2),
      ],
      child: Dialog(
        insetPadding: const EdgeInsets.all(16),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Animate(
          effects: const [ShakeEffect(hz: 5, duration: Duration(milliseconds: 400), curve: Curves.easeOut)],
          controller: animationController,
          autoPlay: false,
          child: Container(
            decoration: BoxDecoration(
              color: design.colors.background1,
              borderRadius: bp.smallerThan(TABLET) ? BorderRadius.circular(40) : BorderRadius.circular(56),
            ),
            padding: EdgeInsets.only(left: 32, right: 32, top: outerPadding, bottom: outerPadding),
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.of(context).askYourParents,
                  style: (bp.smallerThan(TABLET) ? design.textStyles.title2 : design.textStyles.headline3).copyWith(color: design.colors.label2),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '${S.of(context).whatIsMath} $number1 x $number2?',
                    style: (bp.smallerThan(TABLET) ? design.textStyles.headline3 : design.textStyles.headline1).copyWith(
                      color: design.colors.label1,
                    ),
                  ),
                ),
                SizedBox(height: gapPadding),
                TextField(
                  controller: answerText,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: design.inputDecorations.textFormField.copyWith(
                    hintText: S.of(context).answerLabel,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(55)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(55)),
                    ),
                    hintStyle: bp.smallerThan(TABLET) ? design.textStyles.body2 : null,
                    contentPadding: bp.smallerThan(TABLET) ? const EdgeInsets.all(12.0) : null,
                  ),
                  onSubmitted: (value) {
                    checkAnswer();
                  },
                ).animate(delay: 100.ms).shake(),
                SizedBox(height: gapPadding),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Builder(builder: (context) {
                        return design.buttons.responsive(
                          variant: ButtonVariant.secondary,
                          onPressed: () {
                            Future.delayed(100.ms, () {
                              Navigator.of(context).maybePop();
                            });
                          },
                          labelText: S.of(context).cancel,
                        );
                      }),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: design.buttons.responsive(
                        variant: ButtonVariant.primary,
                        onPressed: checkAnswer,
                        labelText: S.of(context).submit,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
