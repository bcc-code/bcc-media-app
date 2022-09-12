import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function onModeChange;
  final Function onInputChange;

  const SearchBar({required this.onModeChange, required this.onInputChange});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _fieldController = TextEditingController();
  var _showClearButton = false;
  var _showCancelButton = false;

  @override
  void initState() {
    super.initState();
    _fieldController.addListener(onValueChange);
  }

  void onValueChange() {
    setState(() {
      widget.onInputChange(_fieldController.text);
      _showClearButton = _fieldController.text == '' ? false : true;
    });
  }

  void onCleared() {
    _fieldController.clear();
  }

  void onFocusChanged(focus) {
    if (focus) {
      widget.onModeChange(true);
      _showCancelButton = true;
    }
  }

  void onCancelled() {
    onCleared();
    FocusScope.of(context).unfocus();
    _showCancelButton = false;
    widget.onModeChange(false);
  }

  @override
  void dispose() {
    _fieldController.dispose();
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
                color: Color.fromARGB(255, 29, 40, 56),
              ),
              child: FocusScope(
                child: Focus(
                  onFocusChange: onFocusChanged,
                  child: TextField(
                    controller: _fieldController,
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
                      suffixIcon: _showClearButton
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(right: 12, left: 10),
                              child: InkWell(
                                onTap: () {
                                  onCleared();
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
                      hintStyle: const TextStyle(
                          color: Color.fromRGBO(112, 124, 142, 1),
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ),
          _showCancelButton
              ? Container(
                  margin: const EdgeInsets.only(
                      left: 8, top: 0, right: 0, bottom: 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      // splashFactory: NoSplash.splashFactory,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    onPressed: onCancelled,
                    child: const Text(
                      'Cancel',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
