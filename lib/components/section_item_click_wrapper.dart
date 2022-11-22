import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../graphql/queries/page.graphql.dart';
import '../helpers/utils.dart';
import '../models/analytics/sections.dart';
import '../providers/inherited_data.dart';

class SectionItemClickWrapper extends StatelessWidget {
  const SectionItemClickWrapper({super.key, required this.item, required this.child, required this.analytics});

  final Fragment$ItemSectionItem$item item;
  final SectionItemAnalytics analytics;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InheritedData<SectionItemAnalytics>(
      inheritedData: analytics,
      child: (context) => GestureDetector(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            handleSectionItemClick(context, item);
          },
          child: child,
        ),
      ),
    );
  }
}
