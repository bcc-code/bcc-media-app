import 'package:flutter/material.dart';
import 'package:my_app/api/sliders.dart';
import 'package:my_app/components/a.dart';
import 'package:my_app/components/featured.dart';
import 'package:my_app/pages/episode.dart';
import 'package:my_app/sections.dart';

import '../components/b.dart';
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

          Featured(),
          Text('Hi $name'),
          TextFormField(controller: _idTokenDisplayController, readOnly: true,),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyWidget(),
            ItemSection(title: 'Native', items: [
              Item(title: 'BibleExplorers', url: '/native', params: EpisodePageArguments(1789)),
              Item(title: 'Magasinet', url: '/native', params: EpisodePageArguments(1788))
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i),)).toList()
            ),

            ItemSection(title: 'Videoplayer', items: [
              Item(title: 'Hei1', url: '/videoplayer'),
              Item(title: 'Hei1', url: '/videoplayer'),
              Item(title: 'Hei1', url: '/videoplayer'),
              Item(title: 'Hei1', url: '/videoplayer'),
              Item(title: 'Hei1', url: '/videoplayer'),
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i))).toList()),

            ItemSection(title: 'Betterplayer', items: [
              Item(title: 'Hei1', url: '/betterplayer'),
              Item(title: 'Hei1', url: '/betterplayer'),
              Item(title: 'Hei1', url: '/betterplayer'),
              Item(title: 'Hei1', url: '/betterplayer'),
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i))).toList()),
            
            ItemSection(title: 'Another one', items: [
              Item(title: 'Hei1', url: '/videoplayer'),
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i))).toList()),
            
            ItemSection(title: 'Another one', items: [
              Item(title: 'Hei1', url: '/videoplayer'),
            ].map((i) => ItemWidget(item: i, onTap: _onItemTap(i))).toList()),

            FutureBuilder<List<Section>>(future: sectionFuture, builder: (context, snapshot) {
              if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: snapshot.data!.map((s) => ItemSection.fromSection(context, s)).toList()
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
            },)
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
