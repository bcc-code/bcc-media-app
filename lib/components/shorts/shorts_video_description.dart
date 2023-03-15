import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/theme/bccm_colors.dart';
import 'package:brunstadtv_app/theme/bccm_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoDescription extends StatelessWidget {
  const VideoDescription({
    Key? key,
    required this.episodeId,
    required this.title,
    this.duration,
  }) : super(key: key);

  final String episodeId;
  final String title;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -10,
      left: 0.0,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          await context.router.pushNamed('/embed/$episodeId?autoplay=true&t=${duration!.inSeconds.toString()}', includePrefixMatches: true);
          SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
        },
        child: Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          height: MediaQuery.of(context).size.height * 0.2,
          padding: const EdgeInsets.only(left: 30.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              title,
              style: BccmTextStyles.body1.copyWith(color: BccmColors.onTint),
            ),
          ),
        ),
      ),
    );
  }
}
