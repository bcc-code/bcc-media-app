import 'package:flutter/material.dart';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
    String screenWidth = '360', screenHeight = '360';
    if (mounted) {
      screenWidth = MediaQuery.of(context).size.width.toInt().toString();
      screenHeight = MediaQuery.of(context).size.height.toInt().toString();
    }
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
          backgroundColor: BtvColors.background1,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: GestureDetector(
            onTapDown: (details) {
              context.router.pop();
            },
            child: const SizedBox(
              height: 24,
              width: 56,
              child: Text(
                'Cancel',
                style: BtvTextStyles.button2,
              ),
            ),
          ),
          actions: [
            (_isTextFieldEnter && _isSendBtnShown)
                ? Container(
                    width: 65,
                    height: 32,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _loading = true;
                          _isSendBtnShown = false;
                        });
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: BtvColors.onTint,
                        backgroundColor: BtvColors.tint1,
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 3.5, bottom: 4.5),
                        textStyle: BtvTextStyles.button1,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Text('Send'),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.5),
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Contact Support',
                  style: BtvTextStyles.headline1,
                ),
                if (!_loading) ...[
                  _TextFieldInput(
                    textController: _textController,
                    textFldOnChange: _textFieldHandler,
                  ),
                  Text(
                    'Your message will include this information, to help us better fix the issues.',
                    style:
                        BtvTextStyles.body2.copyWith(color: BtvColors.label1),
                  ),
                  _DeviceInfo(deviceInfos: deviceInfos()),
                ] else
                  FutureBuilder<String>(
                    future: ajaxCall,
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return _SendingResultPage(
                          sendingResult: true,
                        );
                      } else if (snapshot.hasError) {
                        return _SendingResultPage(
                          sendingResult: false,
                        );
                      } else {
                        return Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  CircularProgressIndicator(),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Sending',
                                    style: BtvTextStyles.body1,
                                  ),
                                ],
                              ),
                            ],
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

  const _TextFieldInput(
      {required this.textController, required this.textFldOnChange});

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
        decoration: const InputDecoration(
          hintText:
              'Describe the issue you are experiencing, and what you do to make it happen.',
          hintStyle: BtvTextStyles.body1,
          filled: true,
          fillColor: BtvColors.background2,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(
              width: 1,
              color: BtvColors.background1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
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
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.38,
            child: _DeviceInfoList(data: data),
          );
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
                  crossAxisAlignment: CrossAxisAlignment
                      .start, //control the LH bar vertical alignment
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
                        style: BtvTextStyles.body2
                            .copyWith(color: BtvColors.label1),
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
  final String sendErrorMsgTitle = 'Couldn’t send you message';
  final String sendErrorMsgContent =
      'Something went wrong. Check your internet connection and try again.';
  final String sendSuccessMsgTitle = 'Thank you for your feedback!';
  final String sendSuccessMsgContent =
      'We appreciate all feedback and we will address the issue as soon as possible.';
  final String successBtnMsg = 'Done';
  final String errorBtnMsg = 'Send again';
  final bool sendingResult;

  _SendingResultPage({
    this.sendingResult = true,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 260),
              child: Column(
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
                    style:
                        BtvTextStyles.body1.copyWith(color: BtvColors.label3),
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
      ),
    );
  }
}
