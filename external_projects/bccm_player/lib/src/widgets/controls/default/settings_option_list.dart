import 'package:flutter/material.dart';

import '../../../../theme/player_theme.dart';

class SettingsOption<T> {
  final T value;
  final String label;
  final bool isSelected;

  const SettingsOption({
    required this.value,
    required this.label,
    this.isSelected = false,
  });
}

Future<SettingsOption<T>?> showModalOptionList<T>({required BuildContext context, required List<SettingsOption<T>> options}) async {
  return await showModalBottomSheet<SettingsOption<T>>(
    context: context,
    isDismissible: true,
    builder: (context) => SettingsOptionList<T>(
      onSelect: (option) {
        // select this track
        Navigator.pop(context, option);
      },
      options: options,
    ),
  );
}

class SettingsOptionList<T> extends StatelessWidget {
  const SettingsOptionList({
    super.key,
    required this.options,
    required this.onSelect,
  });

  final List<SettingsOption<T>> options;

  final void Function(SettingsOption<T> value) onSelect;

  @override
  Widget build(BuildContext context) {
    final controlsTheme = PlayerTheme.safeOf(context).controls;
    return Container(
      color: controlsTheme?.settingsListBackgroundColor,
      child: ListView(
        shrinkWrap: true,
        children: [
          for (final option in options)
            ListTile(
              dense: true,
              onTap: () {
                onSelect(option);
              },
              title: Text(option.label, style: controlsTheme?.settingsListTextStyle),
              trailing: option.isSelected ? const Icon(Icons.check) : null,
            ),
        ],
      ),
    );
  }
}
