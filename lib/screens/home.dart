import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/api/sliders.dart';
import 'package:my_app/components/a.dart';
import 'package:my_app/components/featured.dart';
import 'package:my_app/screens/episode.dart';
import 'package:my_app/sections.dart';

import '../components/b.dart';
import '../services/auth_service.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      context.router.pushNamed(i.url);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: FutureBuilder<List<Section>>(future: sectionFuture, builder: (context, snapshot) {
              if (snapshot.hasData) {
                var sections = snapshot.data!.map((s) => ItemSection.fromSection(context, s)).toList();
                  return ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      Featured(),
                      Column(children: [
                      ...sections
                      ],)
                    ],
                    shrinkWrap: true,
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
            },),  
      );
  }
}
