import 'dart:math';

import 'package:brunstadtv_app/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../theme/design_system/design_system.dart';

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
        decoration: BoxDecoration(
          color: showErrorColor.value ? DesignSystem.of(context).colors.tint2 : DesignSystem.of(context).colors.background2,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(left: 32, right: 32, top: 40, bottom: 32),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Ask your parents', style: DesignSystem.of(context).textStyles.headline2),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('What is $number1 x $number2?',
                  style: DesignSystem.of(context).textStyles.body1.copyWith(color: DesignSystem.of(context).colors.label3)),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: answerText,
              keyboardType: TextInputType.number,
              decoration: DesignSystem.of(context).inputDecorations.textFormField.copyWith(
                    fillColor: DesignSystem.of(context).colors.separatorOnLight,
                    hintText: 'Answer',
                  ),
              onSubmitted: (value) {
                checkAnswer();
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              width: double.infinity,
              child: DesignSystem.of(context).buttons.largeSecondary(onPressed: checkAnswer, labelText: 'Check answer'),
            ),
          ],
        ),
      ),
    );
  }
}
