import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:bccm_core/platform.dart';
import 'package:bccm_core/design_system.dart';

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
        return Container(margin: messageData != section.messages!.last ? const EdgeInsets.only(bottom: 16) : null, child: _MessageItem(messageData));
      }).toList(),
    );
  }
}

class _MessageItem extends StatelessWidget {
  final Fragment$Section$$MessageSection$messages data;
  const _MessageItem(this.data);

  @override
  Widget build(BuildContext context) {
    if (data.content == '') {
      return const SizedBox.shrink();
    }
    final design = DesignSystem.of(context);
    final colors = design.colors.messages.forVariant(data.variant);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: colors.background,
        border: Border.all(color: colors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(data.variant.icon, color: colors.accent, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (data.title.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(data.title, style: design.textStyles.title3.copyWith(color: colors.text)),
                  ),
                MarkdownBody(
                  data: data.content,
                  onTapLink: (text, href, title) {
                    if (href == null) return;
                    launchUrlString(href, mode: LaunchMode.externalApplication);
                  },
                  styleSheet:
                      MarkdownStyleSheet.fromTheme(
                        Theme.of(context).copyWith(
                          textTheme: Theme.of(context).textTheme.apply(bodyColor: colors.text, displayColor: colors.text),
                        ),
                      ).copyWith(
                        a: design.textStyles.body2.copyWith(color: colors.accent, decoration: TextDecoration.underline),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension on DesignSystemMessageColors {
  MessageColors forVariant(Enum$MessageStyleVariant variant) {
    switch (variant) {
      case Enum$MessageStyleVariant.warning:
        return warning;
      case Enum$MessageStyleVariant.error:
        return error;
      case Enum$MessageStyleVariant.info:
      case Enum$MessageStyleVariant.$unknown:
        return info;
    }
  }
}

extension on Enum$MessageStyleVariant {
  IconData get icon {
    switch (this) {
      case Enum$MessageStyleVariant.warning:
        return Icons.warning_amber_rounded;
      case Enum$MessageStyleVariant.error:
        return Icons.cancel_outlined;
      case Enum$MessageStyleVariant.info:
      case Enum$MessageStyleVariant.$unknown:
        return Icons.info_outline;
    }
  }
}
