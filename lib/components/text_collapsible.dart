import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../l10n/app_localizations.dart';
import '../theme/bccm_colors.dart';

const ellipsis = '…';

class TextCollapsible extends StatefulWidget {
  final String text;
  final int? maxLines;
  final String? expandLinkText;
  final String? collapseLinkText;
  final TextStyle? style;

  const TextCollapsible({
    super.key,
    required this.text,
    this.maxLines,
    this.expandLinkText,
    this.collapseLinkText,
    this.style,
  });

  @override
  State<TextCollapsible> createState() => _TextCollapsibleState();
}

class _TextCollapsibleState extends State<TextCollapsible> {
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

  TextSpan getLinkTextSpan(String linkText) {
    return TextSpan(
      children: [
        const TextSpan(text: '  '),
        TextSpan(
          text: linkText,
          style: widget.style?.copyWith(color: BccmColors.tint1, decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()..onTap = toggleCollapsed,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final showMoreLinkSpan = getLinkTextSpan(widget.expandLinkText ?? S.of(context).showMore);
        final showMoreEllipsisSpan = TextSpan(children: [TextSpan(text: ellipsis, style: widget.style), showMoreLinkSpan]);
        final textPainter = TextPainter(text: showMoreEllipsisSpan, maxLines: widget.maxLines, textDirection: Directionality.of(context));
        textPainter.layout(maxWidth: constraints.maxWidth);
        final showMoreEllipsisSize = textPainter.size;

        final showLessLinkSpan = getLinkTextSpan(widget.collapseLinkText ?? S.of(context).showLess);

        final textSpan = TextSpan(text: widget.text, style: widget.style);
        textPainter.text = textSpan;
        textPainter.layout(maxWidth: constraints.maxWidth);
        final textSize = textPainter.size;

        if (widget.maxLines == null || !textPainter.didExceedMaxLines) {
          return RichText(text: textSpan);
        }

        final textTruncatePosition = textPainter.getPositionForOffset(Offset(textSize.width - showMoreEllipsisSize.width, textSize.height));
        final textTruncateIndex = textPainter.getOffsetBefore(textTruncatePosition.offset);

        return collapsed
            ? RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: '${widget.text.substring(0, textTruncateIndex)}$ellipsis', style: widget.style),
                    showMoreLinkSpan,
                  ],
                ),
                maxLines: widget.maxLines,
              )
            : RichText(text: TextSpan(children: [textSpan, showLessLinkSpan]));
      },
    );
  }
}
