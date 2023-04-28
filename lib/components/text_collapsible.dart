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
        final expandLinkSpan = getLinkTextSpan(widget.expandLinkText ?? S.of(context).showMore);
        final collapseLinkSpan = getLinkTextSpan(widget.collapseLinkText ?? S.of(context).showLess);

        final expandEllipsisSize = getTextSpanSize(
          TextSpan(children: [TextSpan(text: ellipsis, style: widget.style), expandLinkSpan]),
          constraints.maxWidth,
        );

        final textSpan = TextSpan(text: widget.text, style: widget.style);
        final textPainter = TextPainter(text: textSpan, maxLines: widget.maxLines, textDirection: Directionality.of(context));
        textPainter.layout(maxWidth: constraints.maxWidth);
        final textSize = textPainter.size;

        if (widget.maxLines == null || !textPainter.didExceedMaxLines) {
          return RichText(text: textSpan);
        }

        final textTruncatePosition = textPainter.getPositionForOffset(Offset(textSize.width - expandEllipsisSize.width, textSize.height));
        final textTruncateIndex = textPainter.getOffsetBefore(textTruncatePosition.offset);

        textPainter.dispose();

        return collapsed
            ? RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: '${widget.text.substring(0, textTruncateIndex)}$ellipsis', style: widget.style),
                    expandLinkSpan,
                  ],
                ),
                maxLines: widget.maxLines,
              )
            : RichText(text: TextSpan(children: [textSpan, collapseLinkSpan]));
      },
    );
  }
}
