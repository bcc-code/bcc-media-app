import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/api/sliders.dart';
import 'package:my_app/components/featured.dart';
import 'package:my_app/router/router.gr.dart';
import 'package:my_app/sections.dart';

import 'package:bccm_player/cast_button.dart';
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
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(30.0 + MediaQuery.of(context).padding.top),
          child: SafeArea(
            child: Stack(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: ElevatedButton(
                      onPressed: () {
                        context.router.push(const ProfileRoute());
                      },
                      child: const Text('Profile')),
                ),
              ),
              const Center(child: Text('BrunstadTV')),
              const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: SizedBox(width: 40, child: CastButton()),
                ),
              ),
            ]),
          )),
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
