import 'package:brunstadtv_app/helpers/markdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../l10n/app_localizations.dart';
import 'package:markdown/markdown.dart' as md;

const ellipsis = '…';

class CollapsableMarkdown extends StatefulWidget {
  final String text;
  final int? maxLines;
  final String? expandLinkText;
  final String? collapseLinkText;
  final TextStyle? style;

  const CollapsableMarkdown({
    super.key,
    required this.text,
    this.maxLines,
    this.expandLinkText,
    this.collapseLinkText,
    this.style,
  });

  @override
  State<CollapsableMarkdown> createState() => _CollapsableMarkdownState();
}

class _CollapsableMarkdownState extends State<CollapsableMarkdown> {
  bool collapsed = true;

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      collapsed = true;
    }
  }

  void toggleCollapsed() {
    setState(() => collapsed = !collapsed);
  }

  Size getTextSpanSize(TextSpan textSpan, double maxWidth) {
    final textPainter = TextPainter(text: textSpan, textDirection: Directionality.of(context));
    textPainter.layout(maxWidth: maxWidth);
    final textSpanSize = textPainter.size;
    textPainter.dispose();
    return textSpanSize;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final markdownStyle = getMarkdownStyleSheet(context);
        markdownBuilder(String data) => MarkdownBody(
              data: data,
              onTapLink: (text, href, title) {
                if (href == null) return;
                if (href == '#toggle-collapsed') {
                  return toggleCollapsed();
                }
                launchUrlString(href, mode: LaunchMode.externalApplication);
              },
              styleSheet: markdownStyle,
            );

        final markdownDocument = md.Document();
        final nodes = markdownDocument.parse(widget.text);
        final containsMarkdown =
            nodes.isNotEmpty && nodes.any((node) => node is md.Element && (node.children == null || node.children!.any((el) => el is! md.Text)));

        final markdownStripped = nodes.map((node) => node.textContent.replaceAll('\n', '')).join('\n\n');

        final showMoreMarkdown = '[${S.of(context).showMore}](#toggle-collapsed)';
        final showLessMarkdown = '[${S.of(context).showLess}](#toggle-collapsed)';
        final showMoreSize = getTextSpanSize(
          TextSpan(text: '$ellipsis ${S.of(context).showMore} ', style: markdownStyle.p),
          constraints.maxWidth,
        );

        final textSpan = TextSpan(text: markdownStripped.replaceAll('\n\n', '\n'), style: markdownStyle.p);
        final textPainter = TextPainter(text: textSpan, maxLines: widget.maxLines, textDirection: Directionality.of(context));
        textPainter.layout(maxWidth: constraints.maxWidth);
        final textSize = textPainter.size;

        if (widget.maxLines == null || !textPainter.didExceedMaxLines) {
          return markdownBuilder(widget.text);
        }

        final textTruncatePosition = textPainter.getPositionForOffset(Offset(constraints.maxWidth - showMoreSize.width, textSize.height));
        final textTruncateIndex = textPainter.getOffsetBefore(textTruncatePosition.offset);

        textPainter.dispose();

        if (!containsMarkdown) {
          return collapsed
              ? markdownBuilder('${widget.text.substring(0, textTruncateIndex)}$ellipsis  $showMoreMarkdown')
              : markdownBuilder('${widget.text}  $showLessMarkdown');
        }

        return collapsed
            ? markdownBuilder('${markdownStripped.substring(0, textTruncateIndex)}$ellipsis  $showMoreMarkdown')
            : markdownBuilder('${widget.text}  $showLessMarkdown');
      },
    );
  }
}
