import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/settings.dart';
import '../../theme/design_system/design_system.dart';

class ExtraUsergroupsScreen extends HookConsumerWidget {
  const ExtraUsergroupsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final betaTesters = useState(ref.read(settingsProvider).isBetaTester ?? false);
    final extraUsergroups = useState([...ref.read(settingsProvider).extraUsergroups]);
    final textEditingController = useTextEditingController();

    void addFromTextField() {
      final list = [...ref.read(settingsProvider).extraUsergroups];
      list.add(textEditingController.value.text);
      extraUsergroups.value.add(textEditingController.value.text);
      ref.read(settingsProvider.notifier).updateExtraUsergroups(list);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Extra usergroups'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('Betatesters'),
              trailing: Switch.adaptive(
                value: betaTesters.value,
                onChanged: (val) {
                  betaTesters.value = val;
                  ref.read(settingsProvider.notifier).setBetaTester(val);
                },
              ),
            ),
            if (extraUsergroups.value.isNotEmpty)
              ...extraUsergroups.value.map(
                (e) => ListTile(
                  title: Text(e),
                  trailing: Switch.adaptive(
                    value: ref.read(settingsProvider).extraUsergroups.contains(e) == true,
                    onChanged: (val) {
                      final list = [...ref.read(settingsProvider).extraUsergroups];
                      if (val) {
                        list.add(e);
                      } else {
                        list.remove(e);
                      }
                      ref.read(settingsProvider.notifier).updateExtraUsergroups(list);
                    },
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textEditingController,
                      onFieldSubmitted: (_) => addFromTextField(),
                      decoration: DesignSystem.of(context).inputDecorations.textFormField.copyWith(hintText: 'Enter code...'),
                    ),
                  ),
                  IconButton(
                    onPressed: addFromTextField,
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
