import 'package:brunstadtv_app/components/general_app_bar.dart';
import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:brunstadtv_app/helpers/string_utils.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../graphql/client.dart';
import '../../graphql/queries/send_support_email.graphql.dart';
import '../../helpers/btv_buttons.dart';
import '../../helpers/btv_colors.dart';
import '../../helpers/btv_typography.dart';
import '../../helpers/utils.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_state.dart';

class ContactSupport extends ConsumerStatefulWidget {
  const ContactSupport({super.key});

  @override
  ConsumerState<ContactSupport> createState() => _ContactSupportState();
}

class ListItem {
  final String title;
  final String? content;

  ListItem({required this.title, this.content});
}

class _ContactSupportState extends ConsumerState<ContactSupport> {
  bool isOnInputPage = true;
  List<ListItem>? deviceInfo;
  String title = '';
  String content = '';

  @override
  void initState() {
    super.initState();
    setDeviceInfo().whenComplete(() => null);
  }

  void onTryAgain() {
    setState(() => isOnInputPage = false);
  }

  void onContentChanged(content_) {
    setState(() => content = content_);
  }

  void onSend() {
    setState(() => isOnInputPage = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              BtvButton.small(
                labelText: S.of(context).send,
                onPressed: onSend,
              )
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: isOnInputPage
                ? _InputPage(deviceInfo: deviceInfo, onContentChanged: onContentChanged)
                : FutureBuilder<bool>(
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
          ),
        ),
      ),
    );
  }

  Future setDeviceInfo() async {
    String? device, manufacturer, os, screenSize, appVer, userId;

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
            style: BtvTextStyles.body1,
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

  Future<bool> get sendSupportEmailFuture async {
    print('Title: $title');
    print('Content: $content');
    print('HTML: $deviceInfoHtml');
    var sendResult = await ref.read(gqlClientProvider).mutate$sendSupportEmail(Options$Mutation$sendSupportEmail(
        variables: Variables$Mutation$sendSupportEmail(title: title, content: '', html: '<p>$content</p>$deviceInfoHtml')));
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
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Text(
          S.of(context).contactSupport,
          style: BtvTextStyles.headline1,
        ),
      ),
      _TextFieldInput(
        textController: textController,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Text(
          S.of(context).debugInfoExplanation,
          style: BtvTextStyles.body2.copyWith(color: BtvColors.label1),
        ),
      ),
      widget.deviceInfo != null ? _DeviceInfoList(data: widget.deviceInfo!) : Text('${S.of(context).loading}...'),
    ]));
  }
}

class _TextFieldInput extends StatelessWidget {
  final TextEditingController textController;

  const _TextFieldInput({required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: TextField(
        minLines: 9,
        maxLines: 13,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        style: BtvTextStyles.body1.copyWith(color: BtvColors.label1),
        decoration: InputDecoration(
          hintText: S.of(context).concernTextPlaceholder,
          hintStyle: BtvTextStyles.body1,
          filled: true,
          fillColor: BtvColors.background2,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(
              width: 1,
              color: BtvColors.background1,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(
                width: 1,
                color: BtvColors.tint1,
              )),
          contentPadding: const EdgeInsets.all(16),
        ),
        controller: textController,
      ),
    );
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
                        style: BtvTextStyles.body2,
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        item.content ?? 'N/A',
                        textAlign: TextAlign.right,
                        style: BtvTextStyles.body2.copyWith(color: BtvColors.label1),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                color: BtvColors.separatorOnLight,
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
                style: BtvTextStyles.headline1,
              ),
              const SizedBox(height: 12),
              Text(
                S.of(context).thankYouSupportDescription,
                textAlign: TextAlign.center,
                style: BtvTextStyles.body1.copyWith(color: BtvColors.label3),
              ),
            ],
          ),
        ),
        BtvButton.large(
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
                style: BtvTextStyles.headline1,
              ),
              const SizedBox(height: 12),
              Text(
                S.of(context).sendFailDescription,
                textAlign: TextAlign.center,
                style: BtvTextStyles.body1.copyWith(color: BtvColors.label3),
              ),
            ],
          ),
        ),
        BtvButton.large(
          onPressed: onTryAgain,
          labelText: S.of(context).tryAgainButton,
        ),
      ],
    );
  }
}
