import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../helpers/btv_colors.dart';
import '../../helpers/btv_typography.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BtvColors.background1,
        leadingWidth: 90,
        centerTitle: true,
        title: const Text(
          'Om',
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          child: Column(
            children: [
              SizedBox(
                  width: 200,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () async {
                        var token = await FirebaseMessaging.instance.getToken();
                        print('token : $token');
                      },
                      child: const Text('Print info to console')))
            ],
          ),
        ),
      ),
    );
  }
}
