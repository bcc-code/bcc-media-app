import 'package:flutter/material.dart';
import '../../components/option_list.dart';
import './app_language.dart';

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

  void _onSelectionChanged(String id) {
    setState(() {
      selected = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(13, 22, 35, 1),
        title: const Text('Video kvalitet'),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(6),
          child: Divider(
            color: Color.fromRGBO(204, 221, 255, 0.3),
            height: 1,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: OptionList(
          optionData: qualityList,
          currentSelection: selected,
          onSelectionChange: _onSelectionChanged,
        ),
      ),
    );
  }
}
