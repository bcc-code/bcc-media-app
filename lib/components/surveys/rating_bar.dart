import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helpers/ui/svg_icons.dart';
import '../../../theme/bccm_colors.dart';

class RatingBar extends StatefulWidget {
  final void Function(int)? onRatingChanged;
  const RatingBar({super.key, this.onRatingChanged});

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  int? curRating;

  void changeRating(rating) {
    setState(() => curRating = rating);
    if (widget.onRatingChanged != null) {
      widget.onRatingChanged!(rating);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      height: 60,
      child: Row(
        children: List.generate(5 * 2 - 1, (index) {
          if (index.isEven) {
            return Expanded(
              child: GestureDetector(
                onTap: () => changeRating(index),
                child: _RatingStar(curRating != null && index <= curRating!),
              ),
            );
          }
          return const SizedBox(width: 4);
        }),
      ),
    );
  }
}

class _RatingStar extends StatelessWidget {
  final bool isFilled;
  const _RatingStar(this.isFilled);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: isFilled ? BccmColors.tint1 : BccmColors.separatorOnLight,
      child: Center(
        child: SvgPicture.string(
          SvgIcons.feedbackStar,
          width: 32,
          height: 32,
          colorFilter: ColorFilter.mode(
            isFilled ? BccmColors.onTint : BccmColors.label2,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
