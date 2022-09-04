import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/api/sliders.dart';
import 'package:my_app/components/featured.dart';
import 'package:my_app/router/router.gr.dart';
import 'package:my_app/sections.dart';

import '../components/cast_button.dart';
import '../services/auth_service.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String name = AuthService.instance.parsedIdToken!.name;
  late Future<List<Section>> sectionFuture;

  @override
  void initState() {
    super.initState();
    sectionFuture = fetchSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: FutureBuilder<List<Section>>(
        future: sectionFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var sections = snapshot.data!
                .map((s) => ItemSection.fromSection(context, s, ref))
                .toList();
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                const Featured(),
                ElevatedButton(
                    onPressed: () {
                      context.router.push(ProfileRoute());
                    },
                    child: Text('Profile')),
                SizedBox(width: 10, height: 30, child: CastButton()),
                Column(
                  children: [...sections],
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
