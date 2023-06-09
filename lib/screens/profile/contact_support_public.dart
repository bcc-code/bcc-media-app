import 'package:brunstadtv_app/components/general_app_bar.dart';
import 'package:brunstadtv_app/components/status_indicators/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:universal_io/io.dart';
import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../components/contact_support/contact_support_failure.dart';
import '../../components/contact_support/contact_support_success.dart';
import '../../components/web/dialog_on_web.dart';
import '../../graphql/client.dart';
import '../../graphql/queries/send_support_email.graphql.dart';
import '../../helpers/ui/btv_buttons.dart';
import '../../helpers/ui/svg_icons.dart';
import '../../helpers/version.dart';
import '../../providers/shared_preferences.dart';
import '../../theme/design_system/design_system.dart';

import '../../helpers/constants.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_state/auth_state.dart';
import '../../helpers/extensions.dart';

class ContactSupportPublicScreen extends ConsumerStatefulWidget {
  const ContactSupportPublicScreen({super.key});

  @override
  ConsumerState<ContactSupportPublicScreen> createState() => _ContactSupportState();
}

class ListItem {
  final String title;
  final String? content;

  ListItem({required this.title, this.content});
}

class _ContactSupportState extends ConsumerState<ContactSupportPublicScreen> {
  bool isOnInputPage = true;
  List<ListItem>? deviceInfo;
  String title = '';
  Future<bool>? sendSupportEmailFuture;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setDeviceInfo().whenComplete(() => null);
  }

  void onTryAgain() {
    setState(() => isOnInputPage = true);
  }

  void onSend() {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      sendSupportEmailFuture = sendSupportEmail();
      isOnInputPage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              if (isOnInputPage && messageController.text.isNotEmpty)
                DesignSystem.of(context).buttons.small(
                      labelText: S.of(context).send,
                      onPressed: onSend,
                    )
            ],
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: IndexedStack(
                index: isOnInputPage ? 0 : 1,
                children: [
                  _InputPage(
                    deviceInfo: deviceInfo,
                    nameController: nameController,
                    emailController: emailController,
                    messageController: messageController,
                  ),
                  FutureBuilder<bool>(
                    future: sendSupportEmailFuture,
                    builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      if (snapshot.hasData) {
                        return const ContactSupportSuccess();
                      } else if (snapshot.hasError) {
                        return ContactSupportFailure(onTryAgain: onTryAgain);
                      }
                      return sendingIndicator;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future setDeviceInfo() async {
    String? device, manufacturer, os, screenSize, appVer, userId;
    List<ListItem>? deviceInfoTmp;

    final screenWidth = View.of(context).physicalSize.width.toInt().toString();
    final screenHeight = View.of(context).physicalSize.height.toInt().toString();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    screenSize = '${screenHeight}x$screenWidth';
    appVer = formatAppVersion(packageInfo);
    userId = ref.read(authStateProvider).user?.name;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
      os = '${Platform.operatingSystem.capitalized} ${androidInfo.version.release}';
      device = androidInfo.model;
      manufacturer = androidInfo.manufacturer;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
      os = '${Platform.operatingSystem.capitalized} ${iosInfo.systemVersion}';
      device = iosInfo.model;
      manufacturer = 'Apple';
    } else {
      //Windows or Chrome or Linux
      deviceInfoTmp = [];
    }

    deviceInfoTmp = [
      ListItem(
        title: 'Device',
        content: device,
      ),
      ListItem(
        title: 'Environment override',
        content: ref.read(sharedPreferencesProvider).getString(PrefKeys.envOverride),
      ),
      ListItem(
        title: 'Manufacturer',
        content: manufacturer,
      ),
      ListItem(
        title: 'Operating System',
        content: os,
      ),
      ListItem(
        title: 'Screen Size',
        content: screenSize,
      ),
      ListItem(
        title: 'App Version',
        content: appVer,
      ),
      ListItem(
        title: 'User ID',
        content: userId,
      ),
    ];

    setState(() {
      deviceInfo = deviceInfoTmp;
      title = 'BTV $appVer $os';
    });
  }

  Widget get sendingIndicator {
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

  String get deviceInfoHtml {
    if (deviceInfo == null) {
      return '';
    }
    final rows = deviceInfo!.map((entry) => '<th>${entry.title}</th><td>${entry.content}</td>').join('\n');
    return '''
      <table>
        <tbody>
          $rows
        </tbody>
      </table>
    ''';
  }

  Future<bool> sendSupportEmail() async {
    var sendResult = await ref.read(gqlClientProvider).mutate$sendSupportEmail(Options$Mutation$sendSupportEmail(
        variables: Variables$Mutation$sendSupportEmail(title: title, content: '', html: '<p>${messageController.text}</p>$deviceInfoHtml')));
    if (sendResult.exception != null) {
      throw ErrorDescription(sendResult.exception.toString());
    }

    return sendResult.data?['sendSupportEmail'] ?? false;
  }
}

class _InputPage extends HookWidget {
  final List<ListItem>? deviceInfo;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;

  const _InputPage({
    required this.deviceInfo,
    required this.nameController,
    required this.emailController,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    useListenable(nameController);
    useListenable(emailController);
    useListenable(messageController);
    final design = DesignSystem.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text(
              S.of(context).contactSupport,
              style: design.textStyles.headline1,
            ),
          ),
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
        ],
      ),
    );
  }
}
