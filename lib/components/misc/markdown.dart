import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

/// A non-scrolling widget that parses and displays Markdown.
///
/// Supports all GitHub Flavored Markdown from the
/// [specification](https://github.github.com/gfm/).
///
/// See also:
///
///  * [Markdown], which is a scrolling container of Markdown.
///  * <https://github.github.com/gfm/>
class CollapsibleMarkdown extends MarkdownWidget {
  /// Creates a non-scrolling widget that parses and displays Markdown.
  const CollapsibleMarkdown({
    super.key,
    required super.data,
    super.selectable,
    super.styleSheet,
    // TODO(stuartmorgan): Remove this once 3.0 is no longer part of the
    // legacy analysis matrix; it's a false positive there.
    // ignore: avoid_init_to_null
    super.styleSheetTheme = null,
    super.syntaxHighlighter,
    super.onTapLink,
    super.onTapText,
    super.imageDirectory,
    super.blockSyntaxes,
    super.inlineSyntaxes,
    super.extensionSet,
    super.imageBuilder,
    super.checkboxBuilder,
    super.bulletBuilder,
    super.builders,
    super.paddingBuilders,
    super.listItemCrossAxisAlignment,
    this.shrinkWrap = true,
    super.fitContent = true,
    super.softLineBreak,
  });

  /// If [shrinkWrap] is `true`, [CollapsibleMarkdown] will take the minimum height
  /// that wraps its content. Otherwise, [CollapsibleMarkdown] will expand to the
  /// maximum allowed height.
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context, List<Widget>? children) {
    if (children!.length == 1 && shrinkWrap) {
      return children.single;
    }

    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      crossAxisAlignment: fitContent ? CrossAxisAlignment.start : CrossAxisAlignment.stretch,
      children: children,
    );
  }
}
