import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../graphql/queries/page.graphql.dart';
import '../helpers/ui/ui_utils.dart';

class MessageSection extends StatelessWidget {
  final Fragment$Section$$MessageSection section;

  const MessageSection(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    if (section.messages == null) {
      return const SizedBox.shrink();
    }
    return Column(
      children: section.messages!.map((messageData) {
        return Container(
          margin: messageData != section.messages!.last ? const EdgeInsets.only(bottom: 16) : null,
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
      margin: const EdgeInsets.symmetric(horizontal: kIsWeb ? 80 : 16),
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
