import 'package:flutter/material.dart';
import 'package:my_app/api/sliders.dart';
import 'package:my_app/components/a.dart';
import 'package:my_app/components/featured.dart';
import 'package:my_app/screens/episode.dart';
import 'package:my_app/sections.dart';

import '../components/b.dart';
import '../services/auth_service.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String name = AuthService.instance.parsedIdToken!.name;
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 3),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color.fromARGB(255, 29, 40, 56)
            ),
            child: const TextField(
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left:10, right:5),
                  child: Icon(Icons.search, size: 25),
                ),
          
                prefixIconConstraints:BoxConstraints(minWidth: 0, maxHeight: 25),
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Color(0x00707c8e),
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.w400)
              ),
            ),
          ),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
