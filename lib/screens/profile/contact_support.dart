import 'package:flutter/material.dart';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info/package_info.dart';

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

  Future<List<ListItem>> get deviceInfos async {
    String? device, manufacturer, os, screenSize, appVer, userId;

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    os = Platform.operatingSystemVersion;
    String screenWidth = MediaQuery.of(context).size.width.toInt().toString();
    String screenHeight = MediaQuery.of(context).size.height.toInt().toString();
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

  textFieldOnChange() {
    print('textFieldOnChange triggered');
    print(_textController.text);
    setState(() {
      _isTextFieldEnter = _textController.text.isNotEmpty;
      _isSendBtnShown = true;
    });
    print('isTextFieldEnter: $_isTextFieldEnter');
  }

  trigger_onLoading() {
    print('_onLoading_loading State b4: $_loading');
    setState(() {
      _loading = true;
      Future.delayed(const Duration(seconds: 3), () {
        _loading = false;
      });
    });
    print('_onLoading _loading State after : $_loading');
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
          backgroundColor: const Color.fromRGBO(13, 22, 35, 1),
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
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(110, 176, 230, 1),
                ),
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
                        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        backgroundColor: const Color.fromRGBO(110, 176, 230, 1),
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 3.5, bottom: 4.5),
                        textStyle: const TextStyle(fontSize: 20),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'Send',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.5),
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Contact Support',
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Color.fromRGBO(13, 22, 35, 1),
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (!_loading) ...[
                textFieldInput(
                    textController: _textController,
                    textFldOnChange: textFieldOnChange),
                const Text(
                  'Your message will include this information, to help us better fix the issues.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                DeviceSpecList(deviceInfos: deviceInfos),
              ] else
                FutureBuilder<String>(
                  future: ajaxCall,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    Widget returnWidget;
                    if (snapshot.hasData) {
                      returnWidget = SendingResultPage(
                        sendingResult: false,
                      );
                    } else if (snapshot.hasError) {
                      returnWidget = SendingResultPage(
                        sendingResult: false,
                      );
                    } else {
                      returnWidget = Expanded(
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
                                  style: TextStyle(
                                    color: Color.fromRGBO(122, 124, 142, 1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 19,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                    return returnWidget;
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class textFieldInput extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback textFldOnChange;

  const textFieldInput(
      {super.key, required this.textController, required this.textFldOnChange});

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
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 19,
        ),
        decoration: const InputDecoration(
          hintText:
              'Describe the issue you are experiencing, and what you do to make it happen.',
          hintStyle: TextStyle(
            color: Color.fromRGBO(112, 124, 142, 1),
            fontWeight: FontWeight.w400,
            fontSize: 19,
          ),
          filled: true,
          fillColor: Color.fromRGBO(29, 40, 56, 1),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(
              width: 1,
              color: Color.fromRGBO(13, 22, 35, 1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide(
                width: 1,
                color: Color.fromRGBO(110, 176, 230, 1),
              )),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        ),
        controller: textController,
        onChanged: (_) => textFldOnChange(),
      ),
    );
  }
}

class DeviceSpecList extends StatelessWidget {
  const DeviceSpecList({
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
            child: DeviceSpecListLoop(data: data),
          );
        }
        return const Text('Loading.....');
      },
    );
  }
}

class DeviceSpecListLoop extends StatelessWidget {
  const DeviceSpecListLoop({
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
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(112, 124, 142, 1),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        item.content ?? 'N/A',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(254, 254, 254, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                color: Color.fromRGBO(204, 221, 255, 0.1),
              ),
            ],
          ),
      ],
    );
  }
}

class SendingResultPage extends StatelessWidget {
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

  SendingResultPage({
    super.key,
    this.sendingResult = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              child: Column(
                key: _widgetKey,
                children: <Widget>[
                  Text(
                    sendingResult ? sendSuccessMsgTitle : sendErrorMsgTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      backgroundColor: Color.fromRGBO(13, 22, 35, 1),
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    sendingResult ? sendSuccessMsgContent : sendErrorMsgContent,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromRGBO(180, 192, 210, 1),
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 58),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
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
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
