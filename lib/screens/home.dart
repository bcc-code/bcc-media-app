import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/api/sliders.dart';
import 'package:brunstadtv_app/router/router.gr.dart';

import 'package:bccm_player/cast_button.dart';
import 'package:flutter_svg/svg.dart';
import '../components/mini_player.dart';
import '../components/page.dart';
import '../services/auth_service.dart';

final logo = Image.asset('assets/images/logo.png');

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String name = AuthService.instance.user!.name!;
  late Future<List<Section>> sectionFuture;

  @override
  void initState() {
    super.initState();
    //sectionFuture = fetchSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 44,
        shadowColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: logo,
        leading: GestureDetector(
            onTap: () {
              context.router.push(const ProfileRoute());
            },
            child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
                child: SvgPicture.string(
                  SvgIcons.profile,
                ))),
        actions: const [SizedBox(width: 40, child: CastButton())],
        flexibleSpace: Container(
          decoration: BoxDecoration(boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 8,
                blurStyle: BlurStyle.outer)
          ]),
          child: ClipRect(
            clipBehavior: Clip.hardEdge,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                color: Colors.transparent,
                height: 1000,
              ),
            ),
          ),
        ),
      ),
      body: const BccmPage(code: 'frontpage'),
    );
  }
}
