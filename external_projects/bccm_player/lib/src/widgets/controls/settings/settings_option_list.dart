import 'package:flutter/material.dart';

import '../../../../theme/controls_theme_data.dart';

class SettingsOption<T> {
  final T id;
  final String label;
  final bool isSelected;

  const SettingsOption({
    required this.id,
    required this.label,
    this.isSelected = false,
  });
}

class SettingsOptionList extends StatelessWidget {
  const SettingsOptionList({
    super.key,
    required this.options,
    required this.controlsTheme,
  });

  final List<SettingsOption> options;
  final ControlsThemeData controlsTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: controlsTheme.settingsListBackgroundColor,
      child: ListView(
        shrinkWrap: true,
        children: [
          for (final option in options)
            ListTile(
              dense: true,
              onTap: () {
                // select this track
                Navigator.pop(context, option);
              },
              title: Text(option.label, style: controlsTheme.settingsListTextStyle),
              trailing: option.isSelected ? const Icon(Icons.check) : null,
            ),
        ],
      ),
    );
  }
}
