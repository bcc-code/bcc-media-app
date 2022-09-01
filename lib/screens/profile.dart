import 'package:flutter/material.dart';
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
          title: Text('Language Setting List'),
        ),
        body: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: languageList
                  .map((e) => GestureDetector(
                      onTap: () {
                        print(e['langCode']);
                      },
                      child: ListFrame(e['lang']!)))
                  .toList(),
            )));
  }
}
//GestureDetector(onTap: () {}, child: ListFrame(eng)),
