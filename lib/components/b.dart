import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactSupport extends StatelessWidget {
  const ContactSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 343,
    height: 192,
    child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
            Container(
                width: 343,
                height: 192,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0x19ccddff), width: 1, ),
                    gradient: const LinearGradient(begin: Alignment.centerRight, end: Alignment.centerLeft, colors: [Color(0xff9f71a4), Color(0xffe63c62)], ),
                ),
                padding: const EdgeInsets.only(left: 10, right: 17, top: 12, bottom: 13, ),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                        Row(
                          children: [
                            Container(
                                width: 24,
                                height: 26.70,
                                margin: const EdgeInsets.only(right: 10),
                                child: const FlutterLogo(size: 24),
                            ),
                            const SizedBox(
                                width: 271,
                                height: 27,
                                child: Text(
                                    'Opplever du problemer med appen?',
                                    style: TextStyle(
                                        color: Color(0xfffefefe),
                                        fontSize: 17,
                                        fontFamily: 'Barlow',
                                        fontWeight: FontWeight.w700,
                                    ),
                                ),
                            ),
                          ],
                        ),
                        Container(
                            child: Text(
                                'Send inn melding til teknisk support, så gir vi deg tilbakemelding!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                ),
                            ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                            height: 33,
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children:[
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color: const Color(0x19ccddff), width: 1, ),
                                            color: const Color(0x19ccddff),
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4, ),
                                        child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children:[
                                                Container(
                                                    height: double.infinity,
                                                    child: Text(
                                                                'Button',
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 18,
                                                                    fontFamily: 'Barlow',
                                                                    fontWeight: FontWeight.w700,
                                                                ),
                                                            ),
                                                    ),
                                            ],
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ],
                ),
            ),
        ],
    ),
);
  }
}