import 'package:flutter/material.dart';

class OptionList extends StatelessWidget {
  final List<Option> optionData;
  final String currentSelection;
  final void Function(String) onSelectionChange;
  final EdgeInsetsGeometry margin;
  final bool enableDivider;

  const OptionList({
    super.key,
    required this.optionData,
    required this.currentSelection,
    required this.onSelectionChange,
    this.enableDivider = true,
    this.margin = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
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
          return Visibility(
            visible: enableDivider,
            child: const Divider(
              height: 1,
              thickness: 1,
              indent: 16,
            ),
          );
        },
      ),
    );
  }

  SizedBox _option(Option option, String curSelect) {
    return SizedBox(
      child: InkWell(
        onTapDown: (e) {
          onSelectionChange(option.id);
        },
        child: Container(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          constraints: const BoxConstraints(minHeight: 56),
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

class Option {
  final String id;
  final String title;
  String? subTitle;

  Option({
    required this.id,
    required this.title,
    this.subTitle,
  });
}
