import 'package:brunstadtv_app/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/rendering.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../helpers/btv_buttons.dart';
import '../../helpers/btv_colors.dart';
import '../../helpers/btv_typography.dart';
import '../../l10n/app_localizations.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class ListItem {
  final String title;
  final String? content;

  ListItem({required this.title, this.content});
}

class _ContactSupportState extends State<ContactSupport> {
  bool _isTextFieldEnter = false;
  bool _loading = false;
  bool _isSendBtnShown = false;

  final _textController = TextEditingController();

  Future<List<ListItem>> deviceInfos() async {
    String? device, manufacturer, os, screenSize, appVer, userId;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    os = Platform.operatingSystemVersion;
    final screenWidth = WidgetsBinding.instance.window.physicalSize.width.toInt().toString();
    final screenHeight = WidgetsBinding.instance.window.physicalSize.height.toInt().toString();
    screenSize = '${screenHeight}x$screenWidth';
    appVer = packageInfo.buildNumber;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
      device = androidInfo.model;
      manufacturer = androidInfo.manufacturer;
      userId = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
      device = iosInfo.model;
      manufacturer = 'Apple';
      userId = iosInfo.identifierForVendor;
    } else {
      //Window or Chrome or Linex
      return [];
    }
    return [
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
  }

  _textFieldHandler() {
    setState(() {
      _isTextFieldEnter = _textController.text.isNotEmpty;
      _isSendBtnShown = true;
    });
  }

  final Future<String> ajaxCall = Future<String>.delayed(
    const Duration(seconds: 7),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 44,
          automaticallyImplyLeading: false,
          leadingWidth: 100,
          leading: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: (details) {
                context.router.pop();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: SizedBox(
                  height: 24,
                  width: 56,
                  child: Text(
                    S.of(context).cancel,
                    style: BtvTextStyles.button2,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            (_isTextFieldEnter && _isSendBtnShown)
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    child: BtvButton.small(
                      onPressed: () {
                        setState(() {
                          _loading = true;
                          _isSendBtnShown = false;
                        });
                      },
                      labelText: S.of(context).send,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!_loading)
                  Expanded(
                    child: SingleChildScrollView(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Text(
                          S.of(context).contactSupport,
                          style: BtvTextStyles.headline1,
                        ),
                      ),
                      _TextFieldInput(
                        textController: _textController,
                        textFldOnChange: _textFieldHandler,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          S.of(context).debugInfoExplanation,
                          style: BtvTextStyles.body2.copyWith(color: BtvColors.label1),
                        ),
                      ),
                      _DeviceInfo(deviceInfos: deviceInfos()),
                    ])),
                  )
                else
                  FutureBuilder<String>(
                    future: ajaxCall,
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: _SendingResultPage(
                            sendingResult: true,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Expanded(
                          child: _SendingResultPage(
                            sendingResult: false,
                          ),
                        );
                      } else {
                        return Expanded(
                          child: Center(
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
                          ),
                        );
                      }
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextFieldInput extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback textFldOnChange;

  const _TextFieldInput({required this.textController, required this.textFldOnChange});

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
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        ),
        controller: textController,
        onChanged: (_) => textFldOnChange(),
      ),
    );
  }
}

class _DeviceInfo extends StatelessWidget {
  const _DeviceInfo({
    Key? key,
    required this.deviceInfos,
  }) : super(key: key);

  final Future<List<ListItem>> deviceInfos;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ListItem>>(
      future: deviceInfos,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Result: ${snapshot.error}');
        } else if (snapshot.data == null) {
          return const Text('Null Data');
        } else if (snapshot.data != null) {
          final data = snapshot.data!;
          return _DeviceInfoList(data: data);
        }
        return const Text('Loading.....');
      },
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
                color: BtvColors.seperatorOnLight,
              ),
            ],
          ),
      ],
    );
  }
}

class _SendingResultPage extends StatelessWidget {
  final GlobalKey _widgetKey = GlobalKey();
  final bool sendingResult;

  _SendingResultPage({
    this.sendingResult = true,
  });

  @override
  Widget build(BuildContext context) {
    final sendErrorMsgTitle = S.of(context).sendFail;
    final sendErrorMsgContent = S.of(context).sendFailDescription;
    final sendSuccessMsgTitle = S.of(context).thankYouSupportTitle;
    final sendSuccessMsgContent = S.of(context).thankYouSupportDescription;
    final successBtnMsg = S.of(context).done;
    final errorBtnMsg = S.of(context).tryAgainButton;
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              key: _widgetKey,
              children: <Widget>[
                Text(
                  sendingResult ? sendSuccessMsgTitle : sendErrorMsgTitle,
                  textAlign: TextAlign.center,
                  style: BtvTextStyles.headline1,
                ),
                const SizedBox(height: 12),
                Text(
                  sendingResult ? sendSuccessMsgContent : sendErrorMsgContent,
                  textAlign: TextAlign.center,
                  style: BtvTextStyles.body1.copyWith(color: BtvColors.label3),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 58),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.blue[200],
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              context.router.pop();
            },
            child: Text(
              sendingResult ? successBtnMsg : errorBtnMsg,
              style: BtvTextStyles.button1.copyWith(color: BtvColors.onTint),
            ),
          ),
        ),
      ],
    );
  }
}
