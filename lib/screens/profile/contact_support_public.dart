import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql/client.dart';
import 'package:universal_io/io.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/contact_support/contact_support_failure.dart';
import '../../components/contact_support/contact_support_success.dart';
import '../../components/web/dialog_on_web.dart';
import '../../components/general_app_bar.dart';
import '../../components/status_indicators/loading_indicator.dart';
import '../../graphql/client.dart';
import '../../graphql/queries/send_support_email.graphql.dart';
import '../../helpers/ui/btv_buttons.dart';
import '../../helpers/ui/svg_icons.dart';
import '../../providers/device_info.dart';
import '../../theme/design_system/design_system.dart';

import '../../l10n/app_localizations.dart';

class ContactSupportPublicScreen extends HookConsumerWidget {
  const ContactSupportPublicScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final messageController = useTextEditingController();
    final includeDeviceInfo = useRef(true);
    final isOnInputPage = useState(true);
    final sendSupportEmailFuture = useState<Future<QueryResult>?>(null);
    final sendSupportEmailSnapshot = useFuture(sendSupportEmailFuture.value);
    final deviceInfo = ref.watch(deviceInfoProvider).valueOrNull;
    useListenableSelector(messageController, () => messageController.text.isEmpty);

    void onIncludeDeviceInfoChange(bool state) => includeDeviceInfo.value = state;

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
                html: '<p>${messageController.text}</p>${includeDeviceInfo.value ? getDeviceInfoHtml() : ''}',
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
      body = _InputPage(
        nameController: nameController,
        emailController: emailController,
        messageController: messageController,
        onIncludeDeviceInfoChange: onIncludeDeviceInfoChange,
      );
    } else if (sendSupportEmailSnapshot.hasError || sendSupportEmailSnapshot.data?.hasException == true) {
      body = ContactSupportFailure(onTryAgain: onTryAgain);
    } else if (sendSupportEmailSnapshot.hasData) {
      body = const ContactSupportSuccess();
    } else {
      body = const _SendingIndicator();
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
              duration: const Duration(milliseconds: 200),
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}

class _InputPage extends HookWidget {
  const _InputPage({
    required this.nameController,
    required this.emailController,
    required this.messageController,
    required this.onIncludeDeviceInfoChange,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final Function(bool) onIncludeDeviceInfoChange;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);

    final includeDeviceInfo = useState(true);

    void includeDeviceInfoChange(bool state) {
      includeDeviceInfo.value = state;
      onIncludeDeviceInfoChange(state);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 0),
          child: Text(
            S.of(context).contactUs,
            style: design.textStyles.headline1,
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Name',
                  style: design.textStyles.caption1.copyWith(color: design.colors.label2),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: TextFormField(
                  cursorColor: design.colors.tint1,
                  cursorWidth: 1,
                  controller: nameController,
                  style: design.textStyles.body2.copyWith(color: design.colors.label1),
                  decoration: design.inputDecorations.textFormField.copyWith(
                    hintText: 'Type in your name',
                    suffixIcon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 100),
                      child: nameController.text.isEmpty
                          ? null
                          : GestureDetector(
                              onTap: () => nameController.value = TextEditingValue.empty,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: SvgPicture.string(
                                  SvgIcons.clearXIcon,
                                  theme: SvgTheme(currentColor: design.colors.label3),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Your contact email',
                  style: design.textStyles.caption1.copyWith(color: design.colors.label2),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: TextFormField(
                  cursorColor: design.colors.tint1,
                  cursorWidth: 1,
                  controller: emailController,
                  style: design.textStyles.body2.copyWith(color: design.colors.label1),
                  decoration: design.inputDecorations.textFormField.copyWith(
                    hintText: 'Type in your email address',
                    suffixIcon: emailController.text.isEmpty
                        ? null
                        : GestureDetector(
                            onTap: () => emailController.value = TextEditingValue.empty,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: SvgPicture.string(
                                SvgIcons.clearXIcon,
                                theme: SvgTheme(currentColor: design.colors.label3),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Message',
                  style: design.textStyles.caption1.copyWith(color: design.colors.label2),
                ),
              ),
              TextField(
                cursorColor: design.colors.tint1,
                cursorWidth: 1,
                minLines: 9,
                maxLines: 13,
                controller: messageController,
                decoration: design.inputDecorations.textFormField.copyWith(hintText: S.of(context).concernTextPlaceholder),
                style: design.textStyles.body2.copyWith(color: design.colors.label1),
              ),
              GestureDetector(
                onTap: () => includeDeviceInfoChange(!includeDeviceInfo.value),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Switch.adaptive(
                      activeColor: Platform.isIOS ? design.colors.tint1 : null,
                      value: includeDeviceInfo.value,
                      onChanged: (value) => includeDeviceInfoChange(value),
                    ),
                    SizedBox(width: Platform.isAndroid ? 0 : 6),
                    Expanded(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(text: '${S.of(context).contactSupportIncludeDeviceInfo} ', style: design.textStyles.caption1),
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () => context.router.push(const DeviceInfoScreenRoute()),
                            text: S.of(context).contactSupportSeeData,
                            style: design.textStyles.caption1.copyWith(
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              color: design.colors.tint1,
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _SendingIndicator extends StatelessWidget {
  const _SendingIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoadingIndicator(),
          const SizedBox(
            height: 12,
          ),
          Text(
            S.of(context).sending,
            style: DesignSystem.of(context).textStyles.body1,
          ),
        ],
      ),
    );
  }
}
