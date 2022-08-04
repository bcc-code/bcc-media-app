import 'package:flutter/material.dart';
import 'package:my_app/api/sliders.dart';
import 'package:my_app/components/a.dart';
import 'package:my_app/components/featured.dart';
import 'package:my_app/screens/episode.dart';
import 'package:my_app/sections.dart';

import '../components/b.dart';
import '../services/auth_service.dart';


class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  String name = AuthService.instance.parsedIdToken!.name;
  final TextEditingController _idTokenDisplayController = TextEditingController(text: AuthService.instance.idToken);
  late Future<List<Section>> sectionFuture;

  @override
  void initState() {
    super.initState();
    sectionFuture = fetchSections();
  }

  void _incrementCounter() {
    setState(() {
    });
  }

  void Function() _onItemTap(Item i) {
    return () {
      print('test ${i.url}');
      Navigator.pushNamed(context, i.url, arguments: i.params);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video app'),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false),
              child: const Text('Login page'),
            ),
        ],
      ),
      body: ListView(
        children: [

          Featured(),
            MyWidget(),
          Text('Hi $name'),
          TextFormField(controller: _idTokenDisplayController, readOnly: true,),
        ]
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
