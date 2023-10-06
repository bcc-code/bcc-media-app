import 'package:brunstadtv_app/graphql/queries/page.graphql.dart';
import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:kids/components/page/sections/poster_section.dart';

class SectionRenderer extends StatelessWidget {
  const SectionRenderer({
    super.key,
    required this.section,
  });

  final Fragment$Section section;

  @override
  Widget build(BuildContext context) {
    final posterSection = section.asOrNull<Fragment$Section$$PosterSection>();
    if (posterSection != null) {
      return PosterSection(posterSection);
    }
    return const SizedBox.shrink();
  }
}
