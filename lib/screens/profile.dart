import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../router/router.gr.dart';
import 'list_frame.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // const Profile();
  var languageList = const [
    {'lang': 'Afrikaans', 'langCode': 'aft'},
    {'lang': 'German'},
    {'lang': 'English'},
    {'lang': 'Dutch'},
    {'lang': 'Turkish'},
    {'lang': 'Estonian'},
    {'lang': 'Spanish'},
    {'lang': 'French'},
    {'lang': 'Italian'},
    {'lang': 'Hungarian'},
    {'lang': 'Norwegian Bokmål'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(children: [
        SizedBox(
          height: 20,
          child: ElevatedButton(
              onPressed: () {
                context.router.push(const AppLanguageScreenRoute());
              },
              child: const Text('App language')),
        )
      ]),
    );
  }
}
//GestureDetector(onTap: () {}, child: ListFrame(eng)),
