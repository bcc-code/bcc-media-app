import 'package:flutter/material.dart';
import '../../components/option_list.dart';
import '../../components/web/dialog_on_web.dart';
import '../../theme/design_system/design_system.dart';
import '../../l10n/app_localizations.dart';

class VideoQuality extends StatefulWidget {
  const VideoQuality({super.key});

  @override
  State<VideoQuality> createState() => _VideoQualityState();
}

class _VideoQualityState extends State<VideoQuality> {
  var qualityList = [
    Option(
      id: 'Automatisk',
      title: 'Automatisk',
      subTitle: '(720p)',
    ),
    Option(
      id: 'Low',
      title: 'Low',
      subTitle: '480p',
    ),
    Option(
      id: 'Medium',
      title: 'Medium',
      subTitle: '720p',
    ),
    Option(
      id: 'High',
      title: 'High',
      subTitle: '1080p',
    ),
  ];

  String selected = 'Medium';

  void _onSelectionChanged(String? id) {
    if (id == null) return;
    setState(() {
      selected = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DialogOnWeb(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: DesignSystem.of(context).colors.background1,
          title: Text(S.of(context).videoQuality),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(6),
            child: Divider(
              color: DesignSystem.of(context).colors.separatorOnLight.withOpacity(0.3),
              height: 1,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: OptionList(
              optionData: qualityList,
              currentSelection: selected,
              onSelectionChange: _onSelectionChanged,
            ),
          ),
        ),
      ),
    );
  }
}
