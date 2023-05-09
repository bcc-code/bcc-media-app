import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../graphql/queries/page.graphql.dart';
import '../providers/section_updates.dart';
import 'section.dart';

class SectionHandleUpdates extends HookConsumerWidget {
  const SectionHandleUpdates({
    super.key,
    required this.section,
    this.extraItems,
  });

  final Fragment$Section section;
  final List<Fragment$ItemSectionItem>? extraItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isMyList = section.asOrNull<Fragment$ItemSection>()?.metadata.myList == true
    final updatedSection = useState(section);

    useEffect(() {
      updatedSection.value = section;
      return null;
    }, [section]);

    final listenForUpdates = true || section is Fragment$Section$$MessageSection;
    if (listenForUpdates) {
      ref.listen<AsyncValue<Fragment$Section?>>(sectionUpdatesProvider(section.id), (prev, next) {
        final val = next.valueOrNull;
        if (val != null) updatedSection.value = val;
      });
    }

    return Section(section: updatedSection.value, extraItems: extraItems);
  }
}
