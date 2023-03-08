import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helpers/ui/svg_icons.dart';
import '../../../theme/bccm_colors.dart';

class RatingStar extends StatelessWidget {
  final bool filled;
  const RatingStar(this.filled, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 60,
      color: filled ? BccmColors.tint1 : BccmColors.separatorOnLight,
      child: Center(
        child: SvgPicture.string(
          SvgIcons.feedbackStar,
          width: 32,
          height: 32,
          colorFilter: ColorFilter.mode(
            filled ? BccmColors.onTint : BccmColors.label2,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int rating;
  final void Function(int)? onRatingChanged;
  const RatingBar({super.key, this.rating = 0, this.onRatingChanged});

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
            onTap: () => onRatingChanged != null ? onRatingChanged!(index + 1) : null,
            child: RatingStar(index < rating),
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
