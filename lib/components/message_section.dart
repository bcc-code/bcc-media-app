import 'package:brunstadtv_app/helpers/btv_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../graphql/queries/page.graphql.dart';
import '../services/utils.dart';

class MessageSection extends StatelessWidget {
  final Fragment$Section$$MessageSection data;

  const MessageSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    if (data.messages == null) {
      return const SizedBox.shrink();
    }
    return Column(
      children: data.messages!.map((messageData) {
        return Container(
          margin: messageData != data.messages!.last ? const EdgeInsets.only(bottom: 16) : null,
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
