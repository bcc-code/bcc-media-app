import 'package:flutter/material.dart';
//listFrame.dart

class SettingList extends StatelessWidget {
  final List<Map<String, Object?>> _optionData;

  const SettingList(this._optionData);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border.symmetric(
            horizontal: BorderSide(
          width: 1,
          color: Color.fromRGBO(204, 221, 255, 0.1),
        )),
        color: Color.fromRGBO(29, 40, 56, 1),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _optionData.length,
        itemBuilder: (context, index) {
          final optionName = _optionData[index]['optionName'] as String;
          final currentSelection =
              _optionData[index]['currentSelection'] as String?;
          final onPressed = _optionData[index]['onPressed'] as VoidCallback;
          return _OptionButton(
            optionName: optionName,
            onPressed: onPressed,
            currentSelection: currentSelection,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            thickness: 1,
            indent: 16,
          );
        },
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String optionName;
  final String? currentSelection;
  final VoidCallback onPressed;

  const _OptionButton({
    required this.optionName,
    required this.onPressed,
    this.currentSelection,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromRGBO(29, 40, 56, 1),
          shape: const BeveledRectangleBorder(),
          padding: const EdgeInsets.only(left: 16, right: 16),
        ),
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                optionName,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(254, 254, 254, 1),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: Text(
                currentSelection ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(112, 124, 142, 1),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 13,
              color: Color.fromRGBO(112, 124, 142, 1),
            ),
          ],
        ),
      ),
    );
  }
}
