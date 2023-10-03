import 'package:flutter/material.dart';

import '../../theme/design_system/design_system.dart';

import '../../l10n/app_localizations.dart';

class CustomSearchBar extends StatefulWidget {
  final Function onInputChange;
  final String? currentValue;
  final Function(bool) onFocusChanged;

  const CustomSearchBar({super.key, required this.onInputChange, required this.currentValue, required this.onFocusChanged});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _fieldController;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    _fieldController = TextEditingController(text: widget.currentValue);
    _fieldController.addListener(_onValueChange);
    focusNode = FocusNode();
  }

  @override
  void didUpdateWidget(CustomSearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If query param has changed
    if (widget.currentValue != _fieldController.value.text) {
      setState(() {
        _fieldController.value = TextEditingValue(
          text: widget.currentValue ?? '',
          selection: TextSelection.fromPosition(
            // Move cursor to the end
            TextPosition(offset: widget.currentValue?.length ?? 0),
          ),
        );
      });
    }
  }

  void _onValueChange() {
    if (_fieldController.text == widget.currentValue) {
      return;
    }
    widget.onInputChange(_fieldController.text);
  }

  void _onCleared() {
    _fieldController.clear();
    focusNode.requestFocus();
  }

  void _onCancelled() {
    _fieldController.clear();
    focusNode.unfocus();
  }

  @override
  void dispose() {
    _fieldController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(28)),
                color: DesignSystem.of(context).colors.background2,
              ),
              child: FocusScope(
                child: Focus(
                  onFocusChange: widget.onFocusChanged,
                  child: TextField(
                    controller: _fieldController,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 8, top: 1, bottom: 1, right: 10),
                        child: ImageIcon(
                          color: DesignSystem.of(context).colors.tint1,
                          const AssetImage('assets/icons/Search_Default.png', package: 'brunstadtv_app'),
                          size: 24,
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(minWidth: 0, maxHeight: 24),
                      suffixIcon: _fieldController.text != ''
                          ? Padding(
                              padding: const EdgeInsets.only(right: 12, left: 10),
                              child: InkWell(
                                onTap: () {
                                  _onCleared();
                                },
                                child: const ImageIcon(AssetImage('assets/icons/Cancel_Default.png', package: 'brunstadtv_app'), size: 16),
                              ),
                            )
                          : null,
                      suffixIconConstraints: const BoxConstraints(minWidth: 0, maxHeight: 24),
                      border: InputBorder.none,
                      hintText: S.of(context).search,
                      hintStyle: DesignSystem.of(context).textStyles.body2.copyWith(color: DesignSystem.of(context).colors.label4, height: 1.45),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_fieldController.value.text.isNotEmpty || focusNode.hasFocus)
            Container(
              margin: const EdgeInsets.only(left: 8, top: 0, right: 0, bottom: 0),
              child: TextButton(
                style: TextButton.styleFrom(
                  // splashFactory: NoSplash.splashFactory,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
                onPressed: _onCancelled,
                child: Text(
                  S.of(context).cancel,
                  style: DesignSystem.of(context).textStyles.button2,
                ),
              ),
            )
        ],
      ),
    );
  }
}
