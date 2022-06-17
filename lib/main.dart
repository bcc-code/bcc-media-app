import 'package:flutter/material.dart';
import 'package:my_app/screens/episode.dart';
import 'package:my_app/sections.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => const MyHomePage(title: 'Video App'),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/episode': (context) => const EpisodeScreen(),
    },
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String something = 'cool';

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
      ),
      body: ListView(
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemSection(title: 'Something 1', items: [
              Item(title: 'Hei1', url: '/episode'),
              Item(title: 'Hei1', url: '/episode'),
              Item(title: 'Hei1', url: '/episode'),
              Item(title: 'Hei1', url: '/episode'),
              Item(title: 'Hei1', url: '/episode'),
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i),)).toList()
            ),
            ItemSection(title: 'Else something', items: [
              Item(title: 'Hei1', url: '/episode'),
            ].map((i) => ItemWidget(item: i)).toList()),
            ItemSection(title: 'Third thing', items: [
              Item(title: 'Hei1', url: '/episode'),
            ].map((i) => ItemWidget(item: i)).toList()),
            ItemSection(title: 'Another one', items: [
              Item(title: 'Hei1', url: '/episode'),
            ].map((i) => ItemWidget(item: i)).toList()),
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
