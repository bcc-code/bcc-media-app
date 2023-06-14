import 'package:brunstadtv_app/components/general_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/contact_support/contact_support_failure.dart';
import '../../components/contact_support/contact_support_sending_indicator.dart';
import '../../components/contact_support/contact_support_success.dart';
import '../../components/contact_support/device_info_table.dart';
import '../../components/web/dialog_on_web.dart';
import '../../graphql/client.dart';
import '../../graphql/queries/send_support_email.graphql.dart';
import '../../helpers/ui/btv_buttons.dart';
import '../../providers/device_info.dart';
import '../../theme/design_system/design_system.dart';

import '../../l10n/app_localizations.dart';

class ContactSupportScreen extends HookConsumerWidget {
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageController = useTextEditingController();
    final isOnInputPage = useState(true);
    final sendSupportEmailFuture = useState<Future<QueryResult>?>(null);
    final sendSupportEmailSnapshot = useFuture(sendSupportEmailFuture.value);
    final deviceInfo = ref.watch(deviceInfoProvider).valueOrNull;

    useListenableSelector(messageController, () => messageController.text.isEmpty);

    void onTryAgain() => isOnInputPage.value = true;

    String getDeviceInfoHtml() {
      final rows = deviceInfo?.entries
          .map(
            (entry) => '<th>${entry.key}</th><td>${entry.value}</td>',
          )
          .join('\n');
      return '<table><tbody>$rows</tbody></table>';
    }

    Future<QueryResult> getSendSupportEmailFuture() {
      final appVer = deviceInfo?.appVer;
      final os = deviceInfo?.os;
      return ref.read(gqlClientProvider).mutate$sendSupportEmail(
            Options$Mutation$sendSupportEmail(
              variables: Variables$Mutation$sendSupportEmail(
                title: 'BTV $appVer $os',
                content: '',
                html: '<p>${messageController.text}</p>${getDeviceInfoHtml()}',
              ),
            ),
          );
    }

    void onSend() {
      FocusManager.instance.primaryFocus?.unfocus();
      sendSupportEmailFuture.value = getSendSupportEmailFuture();
      isOnInputPage.value = false;
    }

    final Widget body;
    if (isOnInputPage.value) {
      body = _InputPage(messageController);
    } else if (sendSupportEmailSnapshot.hasError || sendSupportEmailSnapshot.data?.hasException == true) {
      body = ContactSupportFailure(onTryAgain: onTryAgain);
    } else if (sendSupportEmailSnapshot.hasData) {
      body = const ContactSupportSuccess();
    } else {
      body = const ContactSupportSendingIndicator();
    }

    return DialogOnWeb(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: GeneralAppBar(
            leftActions: [
              BtvButton(
                labelText: S.of(context).cancel,
                onPressed: context.router.pop,
              )
            ],
            rightActions: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: isOnInputPage.value && messageController.text.isNotEmpty
                    ? DesignSystem.of(context).buttons.small(
                          labelText: S.of(context).send,
                          onPressed: onSend,
                        )
                    : null,
              )
            ],
          ),
          body: SafeArea(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}

class _InputPage extends HookWidget {
  const _InputPage(this.messageController);

  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 0),
          child: Text(
            S.of(context).contactSupport,
            style: design.textStyles.headline1,
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextField(
                minLines: 9,
                maxLines: 13,
                controller: messageController,
                decoration: design.inputDecorations.textFormField.copyWith(hintText: S.of(context).concernTextPlaceholder),
                style: design.textStyles.body1.copyWith(color: design.colors.label1),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  S.of(context).debugInfoExplanation,
                  style: design.textStyles.body2.copyWith(color: design.colors.label1),
                ),
              ),
              const DeviceInfoTable(),
            ],
          ),
        ),
      ],
    );
  }
}
