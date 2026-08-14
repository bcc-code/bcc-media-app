import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../helpers/insets.dart';
import '../../providers/feature_flags.dart';
import '../../providers/settings.dart';

/// Dev-only sheet showing auth/session/feature-flag/device state.
/// Opened from [DeveloperOptions].
void showTechnicalDetailsSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => const TechnicalDetailsSheet(),
  );
}

class TechnicalDetailsSheet extends ConsumerWidget {
  const TechnicalDetailsSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);
    final sections = _collectSections(ref);

    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * 0.9),
      decoration: BoxDecoration(
        color: design.colors.background1,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Padding(
        padding: screenInsets(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                height: 5,
                width: 40,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: design.colors.label4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 12, 12),
              child: Row(
                children: [
                  Expanded(child: Text('Technical details', style: design.textStyles.title3)),
                  _CopyAllButton(text: _asPlainText(sections)),
                ],
              ),
            ),
            Container(height: 1, color: design.colors.separatorOnLight),
            Flexible(
              child: SelectionArea(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
                  itemCount: sections.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 24),
                  itemBuilder: (context, index) => _Section(section: sections[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Data
// ---------------------------------------------------------------------------

class _Field {
  const _Field(this.label, this.value, {this.boolValue});

  final String label;

  /// Display and copy text. Null/empty renders as a dimmed placeholder.
  final String? value;

  /// When set, the row renders as a check/dash instead of text, and isn't copyable.
  final bool? boolValue;

  bool get hasValue => value != null && value!.isNotEmpty && value != 'null';
}

class _SectionData {
  const _SectionData(this.title, this.fields, {this.chips});

  final String title;
  final List<_Field> fields;

  /// Rendered as pills below the rows, e.g. feature flag variants.
  final List<String>? chips;
}

List<_SectionData> _collectSections(WidgetRef ref) {
  final auth = ref.watch(authStateProvider);
  final settings = ref.watch(settingsProvider);
  final fcmToken = ref.watch(notificationServiceProvider).asOrNull<FcmNotificationService>()?.fcmToken;
  final deviceInfo = ref.watch(contactDeviceInfoProvider).valueOrNull;

  final flagsJson = Map<String, dynamic>.from(ref.watch(featureFlagsProvider).toJson());
  final variants = (flagsJson.remove('variants') as List?)?.map((v) => v.toString()).toList() ?? const <String>[];

  return [
    _SectionData('Auth', [
      _Field('User', auth.user?.name),
      _Field('ID token', auth.idToken),
      _Field('Access token', auth.auth0AccessToken),
      _Field('Expires at', auth.expiresAt == null ? null : DateFormat('yyyy-MM-dd HH:mm').format(auth.expiresAt!.toLocal())),
    ]),
    _SectionData('Session', [
      _Field('Session id', settings.sessionId),
      _Field('Analytics id (private)', settings.analyticsId),
      _Field('FCM token', fcmToken ?? 'disabled'),
    ]),
    _SectionData('Feature flags', [
      for (final entry in flagsJson.entries)
        entry.value is bool ? _Field(entry.key, entry.value.toString(), boolValue: entry.value as bool) : _Field(entry.key, entry.value?.toString()),
    ], chips: variants),
    if (deviceInfo != null) _SectionData('Device', [for (final entry in deviceInfo.toMap().entries) _Field(entry.key, entry.value)]),
  ];
}

String _asPlainText(List<_SectionData> sections) {
  final buffer = StringBuffer();
  for (final section in sections) {
    buffer.writeln('== ${section.title.toUpperCase()} ==');
    for (final field in section.fields) {
      buffer.writeln('${field.label}: ${field.hasValue ? field.value : '-'}');
    }
    if (section.chips != null && section.chips!.isNotEmpty) {
      buffer.writeln('variants: ${section.chips!.join(', ')}');
    }
    buffer.writeln();
  }
  return buffer.toString().trim();
}

// ---------------------------------------------------------------------------
// UI
// ---------------------------------------------------------------------------

class _Section extends StatelessWidget {
  const _Section({required this.section});

  final _SectionData section;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(section.title.toUpperCase(), style: design.textStyles.caption2.copyWith(color: design.colors.label4, letterSpacing: 0.8)),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: design.colors.background2,
            child: Column(
              children: [
                for (var i = 0; i < section.fields.length; i++) ...[
                  if (i > 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(height: 1, color: design.colors.separatorOnLight),
                    ),
                  _DetailRow(field: section.fields[i]),
                ],
                if (section.chips != null && section.chips!.isNotEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(height: 1, color: design.colors.separatorOnLight),
                  ),
                  _Chips(title: 'variants', values: section.chips!),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// A single label/value row. Short values sit inline on the right, long ones
/// (tokens, ids) wrap onto their own lines below the label. Tapping copies.
class _DetailRow extends HookWidget {
  const _DetailRow({required this.field});

  final _Field field;

  static const _inlineMaxLength = 28;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final copied = useState(false);
    final copyable = field.boolValue == null && field.hasValue;
    final stacked = field.hasValue && field.value!.length > _inlineMaxLength;

    final labelStyle = design.textStyles.body2.copyWith(color: design.colors.label4);
    final valueStyle = field.hasValue
        ? design.textStyles.body2.copyWith(color: design.colors.label1)
        : design.textStyles.body2.copyWith(color: design.colors.label4);
    final valueText = field.hasValue ? field.value! : '—';

    void copy() async {
      if (!copyable) return;
      await Clipboard.setData(ClipboardData(text: field.value!));
      HapticFeedback.selectionClick();
      copied.value = true;
      await Future.delayed(const Duration(milliseconds: 1500));
      if (context.mounted) copied.value = false;
    }

    Widget trailing() {
      if (field.boolValue != null) {
        return Icon(
          field.boolValue! ? Icons.check_rounded : Icons.remove_rounded,
          size: 18,
          color: field.boolValue! ? design.colors.tint1 : design.colors.label4,
        );
      }
      if (!copyable) return const SizedBox.shrink();
      return Icon(
        copied.value ? Icons.check_rounded : Icons.copy_rounded,
        size: 16,
        color: copied.value ? design.colors.tint1 : design.colors.label4,
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: copy,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: const BoxConstraints(minHeight: 44),
        child: stacked
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(field.label, style: labelStyle)),
                      trailing(),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(valueText, style: valueStyle, maxLines: 3, overflow: TextOverflow.ellipsis),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text(field.label, style: labelStyle)),
                  const SizedBox(width: 12),
                  if (field.boolValue == null)
                    Flexible(
                      child: Text(valueText, style: valueStyle, textAlign: TextAlign.right, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                  if (copyable || field.boolValue != null) ...[const SizedBox(width: 8), trailing()],
                ],
              ),
      ),
    );
  }
}

class _Chips extends StatelessWidget {
  const _Chips({required this.title, required this.values});

  final String title;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: design.textStyles.body2.copyWith(color: design.colors.label4)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: values
                .map(
                  (value) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: design.colors.background1, borderRadius: BorderRadius.circular(100)),
                    child: Text(value, style: design.textStyles.caption2.copyWith(color: design.colors.label1)),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _CopyAllButton extends HookWidget {
  const _CopyAllButton({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final copied = useState(false);

    return TextButton.icon(
      onPressed: () async {
        await Clipboard.setData(ClipboardData(text: text));
        HapticFeedback.selectionClick();
        copied.value = true;
        await Future.delayed(const Duration(milliseconds: 1500));
        if (context.mounted) copied.value = false;
      },
      style: TextButton.styleFrom(
        backgroundColor: design.colors.separatorOnLight,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: Icon(copied.value ? Icons.check_rounded : Icons.copy_rounded, size: 15, color: copied.value ? design.colors.tint1 : design.colors.label1),
      label: Text(copied.value ? 'Copied' : 'Copy all', style: design.textStyles.button2.copyWith(color: design.colors.label1)),
    );
  }
}
