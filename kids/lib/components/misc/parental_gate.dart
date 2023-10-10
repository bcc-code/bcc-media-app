import 'dart:math';

import 'package:brunstadtv_app/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

Future<bool> checkParentalGate(BuildContext context) async {
  if (FlavorConfig.current.flavor != Flavor.kids) {
    return true;
  }
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => const ParentalGate(),
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
    final showErrorColor = useState(false);
    final isMounted = useIsMounted();

    void checkAnswer() {
      if (answerText.value.text.isNotEmpty && int.tryParse(answerText.value.text) == correct) {
        Navigator.pop(context, true);
      } else {
        showErrorColor.value = true;
        Future.delayed(const Duration(milliseconds: 500)).then((_) {
          if (!isMounted()) return;
          showErrorColor.value = false;
        });
        answerText.clear();
      }
    }

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      backgroundColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: showErrorColor.value ? DesignSystem.of(context).colors.tint2 : DesignSystem.of(context).colors.background2,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(left: 32, right: 32, top: 40, bottom: 32),
        width: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(S.of(context).askYourParents, style: DesignSystem.of(context).textStyles.headline2),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text('${S.of(context).whatIsMath} $number1 x $number2?',
                        style: DesignSystem.of(context).textStyles.body1.copyWith(color: DesignSystem.of(context).colors.label3)),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: answerText,
                    autofocus: false,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
                    decoration: DesignSystem.of(context).inputDecorations.textFormField.copyWith(
                          fillColor: DesignSystem.of(context).colors.separatorOnLight,
                          hintText: S.of(context).answerLabel,
                        ),
                    onSubmitted: (value) {
                      checkAnswer();
                    },
                  ),
                  /* const SizedBox(height: 24),
                  LayoutGrid(
                    columnSizes: [1.fr, 1.fr, 1.fr, 1.fr, 1.fr, 1.fr],
                    rowSizes: [auto, auto, auto],
                    rowGap: 8,
                    columnGap: 8,
                    children: List.generate(
                      10,
                      (i) => SizedBox(
                        width: double.infinity,
                        height: 28,
                        child: DesignSystem.of(context).buttons.small(
                              variant: ButtonVariant.secondary,
                              onPressed: () {
                                answerText.text += i.toString();
                              },
                              labelText: i.toString(),
                            ),
                      ),
                    ),
                  ), */
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    child: DesignSystem.of(context).buttons.large(
                          variant: ButtonVariant.secondary,
                          onPressed: checkAnswer,
                          labelText: S.of(context).checkAnswerButton,
                        ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: CloseButton(color: DesignSystem.of(context).colors.label1),
            ),
          ],
        ),
      ),
    );
  }
}
