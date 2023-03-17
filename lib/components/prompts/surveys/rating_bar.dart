import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../helpers/ui/svg_icons.dart';
import '../../../../theme/bccm_colors.dart';

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
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => changeRating(index),
            child: RatingStar(curRating != null && index <= curRating!),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 4),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class RatingStar extends StatelessWidget {
  final bool isFilled;
  const RatingStar(this.isFilled, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
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
