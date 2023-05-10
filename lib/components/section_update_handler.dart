import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../graphql/queries/page.graphql.dart';
import '../providers/section_updates.dart';
import '../providers/my_list_section_updates.dart';
import '../helpers/extensions.dart';
import 'section.dart';

class SectionUpdateHandler extends HookConsumerWidget {
  const SectionUpdateHandler({
    super.key,
    required this.section,
    this.extraItems,
  });

  final Fragment$Section section;
  final List<Fragment$ItemSectionItem>? extraItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updatedSection = useState(section);
    final isMyList = section.asOrNull<Fragment$ItemSection>()?.metadata?.myList == true;

    useEffect(() {
      updatedSection.value = section;
      return null;
    }, [section]);

    ref.listen<AsyncValue<Fragment$Section?>>(sectionUpdatesProvider(section.id), (prev, next) {
      final val = next.valueOrNull;
      if (val != null) updatedSection.value = val;
    });

    if (isMyList) {
      ref.listen<AsyncValue<Fragment$Section?>>(myListSectionUpdatesProvider(section.id), (pref, next) {
        final val = next.valueOrNull;
        if (val != null) updatedSection.value = val;
      });
    }

    return Section(section: updatedSection.value, extraItems: extraItems);
  }
}
