import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/device_info.dart';
import 'package:bccm_core/design_system.dart';

class DeviceInfoTable extends HookConsumerWidget {
  const DeviceInfoTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceInfo = ref.watch(contactDeviceInfoProvider).valueOrNull;

    final design = DesignSystem.of(context);

    return deviceInfo != null
        ? Column(
            children: deviceInfo
                .asLocalizedMap(context)
                .entries
                .map(
                  (entry) => entry.value != null
                      ? Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1, color: design.colors.separatorOnLight),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  entry.key,
                                  style: design.textStyles.body2,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  entry.value!,
                                  textAlign: TextAlign.right,
                                  style: design.textStyles.body2.copyWith(color: design.colors.label1),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                )
                .toList(),
          )
        : const SizedBox.shrink();
  }
}
