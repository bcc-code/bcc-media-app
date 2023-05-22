import 'package:brunstadtv_app/graphql/queries/sections.graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../graphql/client.dart';
import '../../graphql/queries/page.graphql.dart';
import '../../helpers/event_bus.dart';
import '../../models/events/my_list_changed.dart';
import '../../providers/section_updates.dart';
import '../../helpers/extensions.dart';
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
    final isMounted = useIsMounted();
    final isMyList = updatedSection.value.asOrNull<Fragment$ItemSection>()?.metadata?.myList == true;

    useEffect(() {
      updatedSection.value = section;
      return null;
    }, [section]);

    void refreshSection() async {
      final response = await ref.watch(gqlClientProvider).query$GetSection(
            Options$Query$GetSection(
              variables: Variables$Query$GetSection(
                id: section.id,
                timestamp: DateTime.now().toIso8601String(),
              ),
            ),
          );
      final newSection = response.parsedData?.section;
      if (isMounted() && newSection != null) {
        updatedSection.value = newSection;
      }
    }

    useEffect(() {
      if (!isMyList) return null;
      final subscription = globalEventBus.on<MyListChangedEvent>().listen((event) => refreshSection());
      return subscription.cancel;
    }, [isMyList]);

    ref.listen(sectionUpdatesProvider(section.id), (prev, next) => refreshSection());

    return updatedSection.value.asOrNull<Fragment$ItemSection>()?.items.items.isEmpty == true
        ? const SizedBox.shrink()
        : Section(section: updatedSection.value, extraItems: extraItems);
  }
}
