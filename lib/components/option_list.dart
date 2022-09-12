import 'package:flutter/material.dart';
import 'package:my_app/screens/profile/app_language.dart';

class OptionList extends StatelessWidget {
  final List<Option> optionData;
  final String currentSelection;
  final void Function(String) onSelectionChange;

  const OptionList({
    super.key,
    required this.optionData,
    required this.currentSelection,
    required this.onSelectionChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(29, 40, 56, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: optionData.length,
        itemBuilder: (context, index) {
          final option = optionData[index];
          return _option(option, currentSelection);
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

  SizedBox _option(Option option, String curSelect) {
    return SizedBox(
      child: InkWell(
        onTapDown: (e) {
          print('on Tap triggered');
          onSelectionChange(option.id);
        },
        child: Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(254, 254, 254, 1),
                      ),
                    ),
                    (option.subTitle != null)
                        ? Container(
                            margin: const EdgeInsets.only(top: 2),
                            child: Text(
                              option.subTitle as String,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(254, 254, 254, 1),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              if (curSelect.isNotEmpty && curSelect == option.id)
                Image.asset('assets/icons/Check_circle.png',
                    gaplessPlayback: true),
            ],
          ),
        ),
      ),
    );
  }
}
