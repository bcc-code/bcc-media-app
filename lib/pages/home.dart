import 'package:flutter/material.dart';
import 'package:my_app/sections.dart';

import '../services/auth_service.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = AuthService.instance.parsedIdToken!.name;
  final TextEditingController _idTokenDisplayController = TextEditingController(text: AuthService.instance.idToken);

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
    });
  }

  void Function() _onItemTap(Item i) {
    return () {
      print('test ${i.url}');
      Navigator.pushNamed(context, i.url);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false),
              child: const Text('Login page'),
            ),
        ],
      ),
      body: ListView(
        children: [
          Text('Hi $name'),
          TextFormField(controller: _idTokenDisplayController, readOnly: true,),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemSection(title: 'Videoplayer', items: [
              Item(title: 'Hei1', url: '/native'),
              Item(title: 'Hei1', url: '/videoplayer'),
              Item(title: 'Hei1', url: '/videoplayer'),
              Item(title: 'Hei1', url: '/videoplayer'),
              Item(title: 'Hei1', url: '/videoplayer'),
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i),)).toList()
            ),
            ItemSection(title: 'Betterplayer', items: [
              Item(title: 'Hei1', url: '/betterplayer'),
              Item(title: 'Hei1', url: '/betterplayer'),
              Item(title: 'Hei1', url: '/betterplayer'),
              Item(title: 'Hei1', url: '/betterplayer'),
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i))).toList()),
            ItemSection(title: 'Third thing', items: [
              Item(title: 'Hei1', url: '/betterplayer'),
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i))).toList()),
            ItemSection(title: 'Another one', items: [
              Item(title: 'Hei1', url: '/videoplayer'),
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i))).toList()),
          ],
        ),]
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
