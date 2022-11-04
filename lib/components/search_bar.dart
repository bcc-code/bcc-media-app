import 'package:flutter/material.dart';

import '../helpers/btv_colors.dart';
import '../helpers/btv_typography.dart';

class SearchBar extends StatefulWidget {
  final Function onModeChange;
  final Function onInputChange;
  String? initialQuery;

  SearchBar({
    super.key,
    required this.onModeChange,
    required this.onInputChange,
    this.initialQuery,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _fieldController;
  late FocusNode focusNode;
  var _inSearchMode = false;
  String? _prevValue;

  @override
  void initState() {
    super.initState();
    _fieldController = TextEditingController(text: widget.initialQuery);
    _fieldController.addListener(_onValueChange);
    focusNode = FocusNode();
    if (widget.initialQuery != null) {
      _prevValue = widget.initialQuery;
      _inSearchMode = true;
    }
  }

  @override
  void didUpdateWidget(SearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If query param has changed
    if (widget.initialQuery != null) {
      _fieldController = TextEditingController.fromValue(
        TextEditingValue(
          text: widget.initialQuery!,
          selection: TextSelection.fromPosition(
            // Move cursor to the end
            TextPosition(offset: widget.initialQuery!.length),
          ),
        ),
      );
      _fieldController.addListener(_onValueChange);
      _prevValue = widget.initialQuery;
      _inSearchMode = true;
      focusNode.unfocus();
    }
  }

  void _onValueChange() {
    /* Ignore event caused when focussing text field */
    if (_fieldController.text != _prevValue) {
      widget.onInputChange(_fieldController.text);
    }
    _prevValue = _fieldController.text;
  }

  void _onCleared() {
    _fieldController.clear();
    focusNode.requestFocus();
  }

  void _onFocusChanged(focus) {
    if (focus) {
      if (!_inSearchMode) {
        widget.onModeChange(true);
      }
      _inSearchMode = true;
    }
  }

  void _onCancelled() {
    _fieldController.clear();
    _inSearchMode = false;
    widget.onModeChange(false);
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
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 16, right: 16, bottom: 8, left: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                color: BtvColors.background2,
              ),
              child: FocusScope(
                child: Focus(
                  onFocusChange: _onFocusChanged,
                  child: TextField(
                    controller: _fieldController,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(
                            left: 8, top: 1, bottom: 1, right: 10),
                        child: ImageIcon(
                            AssetImage('assets/icons/Search_Default.png'),
                            size: 24),
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(minWidth: 0, maxHeight: 24),
                      suffixIcon: _fieldController.text != ''
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(right: 12, left: 10),
                              child: InkWell(
                                onTap: () {
                                  _onCleared();
                                },
                                child: const ImageIcon(
                                    AssetImage(
                                        'assets/icons/Cancel_Default.png'),
                                    size: 16),
                              ),
                            )
                          : null,
                      suffixIconConstraints:
                          const BoxConstraints(minWidth: 0, maxHeight: 24),
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: BtvTextStyles.body2
                          .copyWith(color: BtvColors.label4, height: 1.45),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_inSearchMode)
            Container(
              margin:
                  const EdgeInsets.only(left: 8, top: 0, right: 0, bottom: 0),
              child: TextButton(
                style: TextButton.styleFrom(
                  // splashFactory: NoSplash.splashFactory,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
                onPressed: _onCancelled,
                child: const Text(
                  'Cancel',
                  style: BtvTextStyles.button2,
                ),
              ),
            )
        ],
      ),
    );
  }
}
