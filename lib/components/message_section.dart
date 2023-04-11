import 'package:brunstadtv_app/helpers/extensions.dart';
import 'package:brunstadtv_app/providers/section_updates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../graphql/queries/page.graphql.dart';
import '../helpers/ui/ui_utils.dart';

class MessageSection extends HookConsumerWidget {
  final Fragment$Section$$MessageSection section;

  const MessageSection(this.section, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updatedSection = useState(section);

    ref.listen<AsyncValue<Fragment$Section?>>(sectionUpdatesProvider(section.id), (prev, next) {
      final val = next.valueOrNull.asOrNull<Fragment$Section$$MessageSection>();
      if (val != null) updatedSection.value = val;
    });

    if (updatedSection.value.messages == null) {
      return const SizedBox.shrink();
    }
    return Column(
      children: updatedSection.value.messages!.map((messageData) {
        return Container(
          margin: messageData != updatedSection.value.messages!.last ? const EdgeInsets.only(bottom: 16) : null,
          child: _MessageItem(messageData),
        );
      }).toList(),
    );
  }
}

class _MessageItem extends StatelessWidget {
  final Fragment$Section$$MessageSection$messages data;
  const _MessageItem(this.data);

  @override
  Widget build(BuildContext context) {
    final borderColor = getColorFromHex(data.style.border);
    final textColor = getColorFromHex(data.style.text);
    if (data.content == '') {
      return const SizedBox.shrink();
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: getColorFromHex(data.style.background),
        border: borderColor != null ? Border.all(color: borderColor) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: MarkdownBody(
        data: data.content,
        styleSheet: MarkdownStyleSheet.fromTheme(
          Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor, displayColor: textColor),
          ),
        ),
      ),
    );
  }
}
