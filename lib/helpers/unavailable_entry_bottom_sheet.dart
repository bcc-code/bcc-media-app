import 'package:bccm_core/bccm_core.dart';
import 'package:bccm_core/design_system.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/menus/bottom_sheet_select.dart';
import '../components/menus/option_list.dart';

/// Shown when tapping a favorited entry whose item is no longer available.
/// Explains why the item can't be opened and offers to remove it from the list.
void showUnavailableEntryBottomSheet(BuildContext context, WidgetRef ref, {required String entryId, required void Function() onRemoved}) {
  HapticFeedback.mediumImpact();
  showModalBottomSheet(
    useRootNavigator: true,
    context: context,
    builder: (ctx) {
      final design = DesignSystem.of(ctx);
      return BottomSheetSelect(
        title: S.of(ctx).noLongerAvailable,
        description: Container(
          margin: const EdgeInsets.only(bottom: 24),
          child: Text(
            S.of(ctx).noLongerAvailableDescription,
            textAlign: TextAlign.center,
            style: design.textStyles.body2.copyWith(color: design.colors.label3),
          ),
        ),
        selectedId: '',
        showSelection: false,
        items: [
          Option(
            id: 'remove',
            title: S.of(ctx).removeFromFavorites,
            icon: Image.asset(width: 24, height: 24, 'assets/icons/Close.png', gaplessPlayback: true),
          ),
        ],
        onSelectionChanged: (id) async {
          if (id != 'remove') return;
          onRemoved();
          await ref
              .read(bccmGraphQLProvider)
              .mutate$removeEntryFromMyList(
                Options$Mutation$removeEntryFromMyList(variables: Variables$Mutation$removeEntryFromMyList(entryId: entryId)),
              );
          globalEventBus.fire(MyListChangedEvent());
        },
      );
    },
  );
}
