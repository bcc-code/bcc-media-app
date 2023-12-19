import 'package:bccm_core/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:brunstadtv_app/providers/graphql.dart';
import '../../../helpers/event_bus.dart';
import '../../../models/events/my_list_changed.dart';
import '../../../providers/section_updates.dart';
import 'package:bccm_core/bccm_core.dart';
import 'section_renderer.dart';

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

    useEffect(
      () {
        if (!isMyList) return null;
        final subscription = globalEventBus.on<MyListChangedEvent>().listen((event) => refreshSection());
        return subscription.cancel;
      },
      // ignore: exhaustive_keys
      [isMyList],
    );

    ref.listen(sectionUpdatesProvider(section.id), (prev, next) => refreshSection());

    return SectionRenderer(section: updatedSection.value, extraItems: extraItems);
  }
}
