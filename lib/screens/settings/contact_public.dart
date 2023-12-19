import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/contact/contact_public_input_page.dart';
import '../../components/contact/contact_success.dart';
import '../../components/status/error_generic.dart';
import '../../components/status/loading_generic.dart';
import '../../components/web/dialog_on_web.dart';
import '../../components/nav/general_app_bar.dart';
import 'package:bccm_core/platform.dart';
import '../../components/buttons/btv_buttons.dart';
import '../../helpers/translations.dart';
import 'package:bccm_core/design_system.dart';

import '../../l10n/app_localizations.dart';

@RoutePage<void>()
class ContactPublicScreen extends HookConsumerWidget {
  const ContactPublicScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final messageController = useTextEditingController();
    final includeDeviceInfo = useRef(true);
    final isOnInputPage = useState(true);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final sendSupportEmailFuture = useState<Future<QueryResult>?>(null);
    final sendSupportEmailSnapshot = useFuture(sendSupportEmailFuture.value);
    final deviceInfo = ref.watch(contactDeviceInfoProvider).valueOrNull;
    useListenableSelector(nameController, () => nameController.text.isEmpty);
    useListenableSelector(emailController, () => emailController.text.isEmpty);
    useListenableSelector(messageController, () => messageController.text.isEmpty);

    String getDeviceInfoHtml() {
      final rows = deviceInfo?.asLocalizedMap(context).entries.map((entry) => '<th>${entry.key}</th><td>${entry.value}</td>').join('\n');
      return '<table><tbody>$rows</tbody></table>';
    }

    Future<QueryResult> getSendSupportEmailFuture() {
      final appVer = deviceInfo?.appVer;
      final os = deviceInfo?.os;
      return ref.read(bccmGraphQLProvider).mutate$sendSupportEmail(
            Options$Mutation$sendSupportEmail(
              variables: Variables$Mutation$sendSupportEmail(
                title: 'BTV $appVer $os',
                content: '',
                html: '<p>${messageController.text}</p>${includeDeviceInfo.value ? getDeviceInfoHtml() : ''}',
                options: Input$EmailOptions(name: nameController.text, email: emailController.text),
              ),
            ),
          );
    }

    void onSend() {
      FocusManager.instance.primaryFocus?.unfocus();

      if (formKey.currentState?.validate() != true) {
        return;
      }

      sendSupportEmailFuture.value = getSendSupportEmailFuture();
      isOnInputPage.value = false;
    }

    final Widget body;
    if (isOnInputPage.value) {
      body = Form(
        key: formKey,
        child: ContactPublicInputPage(
          nameController: nameController,
          emailController: emailController,
          messageController: messageController,
          onIncludeDeviceInfoChange: (state) => includeDeviceInfo.value = state,
          onShowDeviceInfoTap: () => context.router.push(const DeviceInfoScreenRoute()),
        ),
      );
    } else if ((sendSupportEmailSnapshot.hasError || sendSupportEmailSnapshot.data?.hasException == true) &&
        sendSupportEmailSnapshot.connectionState != ConnectionState.waiting) {
      body = ErrorGeneric(
        title: S.of(context).sendFail,
        description: S.of(context).sendFailDescription,
        onRetry: () => isOnInputPage.value = true,
      );
    } else if (sendSupportEmailSnapshot.connectionState == ConnectionState.waiting) {
      body = LoadingGeneric(text: S.of(context).sending);
    } else {
      body = const ContactSuccess();
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
                child: isOnInputPage.value && messageController.text.isNotEmpty && nameController.text.isNotEmpty && emailController.text.isNotEmpty
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
              duration: const Duration(milliseconds: 200),
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}
