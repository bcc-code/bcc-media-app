import 'package:flutter/material.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class DeviceSpecList {
  final String device;
  final String manufacturer;
  final String operatingSystem;
  final String screenSize;
  final String appVersion;
  final String id; //primaryKey

  DeviceSpecList({
    required this.device,
    required this.manufacturer,
    required this.operatingSystem,
    required this.screenSize,
    required this.appVersion,
    required this.id,
  });
}

class _ContactSupportState extends State<ContactSupport> {
  final _titleController = TextEditingController();
  String placeholderText =
      'Describe the issue you are experiencing, and what you do to make it happen.';
  String reminderrText =
      'Your message will include this information, to help us better fiz the issues.';

  var deviceList = [
    DeviceSpecList(
      device: 'IPhone XS',
      manufacturer: 'Apple',
      operatingSystem: 'iOS 13.4',
      screenSize: '2.001 x 2.436',
      appVersion: '1.0(1)',
      id: '51681',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13, 22, 35, 1),
        leading: Text(
          'Cancel',
          style: Theme.of(context).primaryTextTheme.bodyLarge,
        ),
        actions: [
          SendButton(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(15),
            ),
        child: Column(
          children: <Widget>[
            Text(
              'Contact Support',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                background: Paint(),
                fontSize: 34,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              // height: 267,
              child: TextField(
                maxLines: 9,
                textAlign: TextAlign.start,
                style: TextStyle(
                    // height: 267,
                    ),
                decoration: InputDecoration(
                  labelText: placeholderText,
                  border:
                      OutlineInputBorder(borderSide: new BorderSide(width: 1)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  isDense: true,
                ),
                // cursorRadius: Radius.circular(10),
                keyboardType: TextInputType.text,
                onTap: () {},
                controller: _titleController,
                // keyboardType: TextInputType.name,
              ),
            ),
            // SizedBox(
            //     // height: 16,
            //     ),
            // Text(reminderrText),
            // ListView.builder(
            //   itemCount: 6,
            //   itemBuilder: ((context, index) {
            //     return Card(
            //       child: Flexible(
            //         fit: FlexFit.tight,
            //         child: Row(
            //           children: [
            //             // Text(deviceList.),
            //             Text('Data A'),
            //             Text('Data B'),
            //           ],
            //         ),
            //       ),
            //     );
            //   }),
            // ),
          ],
        ),
      ),
      // child: OptionList(languageList),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 32,
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      child: ElevatedButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: Color.fromRGBO(255, 255, 255, 1),
          backgroundColor: Color.fromRGBO(110, 176, 230, 1),
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 3.5, bottom: 4.5),
          textStyle: const TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        child: FittedBox(
          child: Text('Send'),
        ),
      ),
    );
  }
}
