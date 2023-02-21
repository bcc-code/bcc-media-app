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
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        padding: const EdgeInsets.only(left: 40.0, top: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: SingleChildScrollView(
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
                // Text(
                //   '${title}',
                //   style: BtvTextStyles.body1.copyWith(color: BtvColors.onTint),
                // ),
                SizedBox(
                  //for overflowing text

                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    // '${title}',
                    '${title} For example, to learn the size of the current media (e.g., the window containing your app), you can read the [MediaQueryData.size] property from the [MediaQueryData] returned by [MediaQuery.of]: MediaQuery.of(context).size.',
                    style: BtvTextStyles.body1.copyWith(color: BtvColors.onTint),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
