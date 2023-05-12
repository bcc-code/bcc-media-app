import 'package:brunstadtv_app/components/general_app_bar.dart';
import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';
import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/web/dialog_on_web.dart';
import '../../graphql/client.dart';
import '../../graphql/queries/send_support_email.graphql.dart';
import '../../helpers/ui/btv_buttons.dart';
import '../../helpers/version.dart';
import '../../theme/design_system/design_system.dart';

import '../../helpers/constants.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_state/auth_state.dart';
import '../../helpers/extensions.dart';

class ContactSupportScreen extends ConsumerStatefulWidget {
  const ContactSupportScreen({super.key});

  @override
  ConsumerState<ContactSupportScreen> createState() => _ContactSupportState();
}

class ListItem {
  final String title;
  final String? content;

  ListItem({required this.title, this.content});
}

class _ContactSupportState extends ConsumerState<ContactSupportScreen> {
  bool isOnInputPage = true;
  List<ListItem>? deviceInfo;
  String title = '';
  String content = '';
  Future<bool>? sendSupportEmailFuture;

  @override
  void initState() {
    super.initState();
    setDeviceInfo().whenComplete(() => null);
  }

  void onTryAgain() {
    setState(() => isOnInputPage = true);
  }

  void onContentChanged(content_) {
    setState(() => content = content_);
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
              if (isOnInputPage && content.isNotEmpty)
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
                  _InputPage(deviceInfo: deviceInfo, onContentChanged: onContentChanged),
                  FutureBuilder<bool>(
                    future: sendSupportEmailFuture,
                    builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      if (snapshot.hasData) {
                        return _SuccessPage();
                      } else if (snapshot.hasError) {
                        return _FailurePage(onTryAgain: onTryAgain);
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

    final sharedPrefs = await SharedPreferences.getInstance();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final screenWidth = WidgetsBinding.instance.window.physicalSize.width.toInt().toString();
    final screenHeight = WidgetsBinding.instance.window.physicalSize.height.toInt().toString();
    screenSize = '${screenHeight}x$screenWidth';
    appVer = formatAppVersion(packageInfo);
    userId = ref.read(authStateProvider).user?.name;

    List<ListItem>? deviceInfoTmp;

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
        content: sharedPrefs.getString(PrefKeys.envOverride),
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
        variables: Variables$Mutation$sendSupportEmail(title: title, content: '', html: '<p>$content</p>$deviceInfoHtml')));
    if (sendResult.exception != null) {
      throw ErrorDescription(sendResult.exception.toString());
    }

    return sendResult.data?['sendSupportEmail'] ?? false;
  }
}

class _InputPage extends StatefulWidget {
  final List<ListItem>? deviceInfo;
  final Function onContentChanged;

  const _InputPage({required this.deviceInfo, required this.onContentChanged});

  @override
  State<_InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<_InputPage> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.addListener(() => widget.onContentChanged(textController.text));
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Text(
          S.of(context).contactSupport,
          style: design.textStyles.headline1,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: TextField(
          minLines: 9,
          maxLines: 13,
          controller: textController,
          decoration: design.inputDecorations.textFormField.copyWith(hintText: S.of(context).concernTextPlaceholder),
          style: design.textStyles.body1.copyWith(color: design.colors.label1),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Text(
          S.of(context).debugInfoExplanation,
          style: design.textStyles.body2.copyWith(color: design.colors.label1),
        ),
      ),
      widget.deviceInfo != null ? _DeviceInfoList(data: widget.deviceInfo!) : Text('${S.of(context).loading}...'),
    ]));
  }
}

class _DeviceInfoList extends StatelessWidget {
  const _DeviceInfoList({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<ListItem> data;

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Column(
      children: [
        for (var item in data)
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 11.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start, //control the LH bar vertical alignment
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        item.title,
                        style: design.textStyles.body2,
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        item.content ?? 'N/A',
                        textAlign: TextAlign.right,
                        style: design.textStyles.body2.copyWith(color: design.colors.label1),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: design.colors.separatorOnLight,
              ),
            ],
          ),
      ],
    );
  }
}

class _SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).thankYouSupportTitle,
                textAlign: TextAlign.center,
                style: design.textStyles.headline1,
              ),
              const SizedBox(height: 12),
              Text(
                S.of(context).thankYouSupportDescription,
                textAlign: TextAlign.center,
                style: design.textStyles.body1.copyWith(color: design.colors.label3),
              ),
            ],
          ),
        ),
        design.buttons.large(
          labelText: S.of(context).done,
          onPressed: context.router.pop,
        ),
      ],
    );
  }
}

class _FailurePage extends StatelessWidget {
  final VoidCallback onTryAgain;

  const _FailurePage({required this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).sendFail,
                textAlign: TextAlign.center,
                style: design.textStyles.headline1,
              ),
              const SizedBox(height: 12),
              Text(
                S.of(context).sendFailDescription,
                textAlign: TextAlign.center,
                style: design.textStyles.body1.copyWith(color: design.colors.label3),
              ),
            ],
          ),
        ),
        design.buttons.large(
          onPressed: onTryAgain,
          labelText: S.of(context).tryAgainButton,
        ),
      ],
    );
  }
}
