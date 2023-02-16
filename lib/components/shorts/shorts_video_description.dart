import 'package:brunstadtv_app/helpers/btv_colors.dart';
import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  const VideoDescription({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);

  final String id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120.0,
        padding: EdgeInsets.only(left: 20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${id}',
                style: BtvTextStyles.body1.copyWith(color: BtvColors.onTint),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                '${title}',
                style: BtvTextStyles.body1.copyWith(color: BtvColors.onTint),
              ),
              SizedBox(
                //for overflowing text
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  '${title}',
                  style: BtvTextStyles.body1.copyWith(color: BtvColors.onTint),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
