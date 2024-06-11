import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/models/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/section_updates.dart';
import 'package:bccm_core/bccm_core.dart';

/// Handles updates for a section and its items
///
/// This widget listens to updates for:
///
/// - The section itself (realtime events)
/// - The progress of items in the section
/// - 'My list' changes
class SectionUpdateHandler extends HookConsumerWidget {
  const SectionUpdateHandler({
    super.key,
    required this.section,
    required this.builder,
    this.extraItems,
  });

  final Fragment$Section section;
  final List<Fragment$ItemSectionItem>? extraItems;
  final Widget Function(BuildContext context, Fragment$Section section, List<Fragment$ItemSectionItem>? extraItems) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updatedSection = useState(section);
    final isMounted = useIsMounted();
    final isMyList = updatedSection.value.asOrNull<Fragment$ItemSection>()?.metadata?.myList == true;

    useEffect(() {
      updatedSection.value = section;
      return null;
    }, [section]);

    void refreshSection() async {
      final response = await ref.watch(bccmGraphQLProvider).query$GetSection(
            Options$Query$GetSection(
              variables: Variables$Query$GetSection(
                id: section.id,
                timestamp: DateTime.now().toUtc().toIso8601String(),
              ),
              errorPolicy: ErrorPolicy.all,
            ),
          );
      final newSection = response.parsedData?.section;
      if (isMounted() && newSection != null) {
        updatedSection.value = newSection;
      }
    }

    if (isMyList) {
      ref.listen(
        myListChangedProvider,
        (prev, next) => refreshSection(),
      );
    }

    final itemSection = updatedSection.value.asOrNull<Fragment$ItemSection>();

    if (itemSection != null) {
      ref.listen(watchProgressUpdatedProvider, (prev, next) {
        final event = next.valueOrNull;
        if (event == null) return;
        if (itemSection.items.items.any((item) => item.id == event.episodeId)) {
          updatedSection.value = updateProgressForItemsInSection(updatedSection.value, event.episodeId, event.progress);
        }
      });
    }

    ref.listen(
      sectionUpdatesProvider(section.id),
      (prev, next) => refreshSection(),
    );

    return builder(context, updatedSection.value, extraItems);
  }
}
