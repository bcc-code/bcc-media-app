import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bccm_player/cast_button.dart';
import '../../api/sliders.dart';
import '../../router/router.gr.dart';
import '../../components/general_app_bar.dart';
import '../../components/icon_label_button.dart';
import '../../components/page/page.dart';
import '../../services/auth_service.dart';

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
    print('Bearer ${AuthService.instance.auth0AccessToken}');
  }

  @override
  Widget build(BuildContext context) {
    final appBar = GeneralAppBar(
      // statusBarHeight: MediaQuery.of(context).padding.top,
      title: Image.asset('assets/icons/Logo.png'),
      leftActions: [
        IconLabelButton(
          imagePath: 'assets/icons/Profile.png',
          onPressed: () => context.router.push(const ProfileRoute()),
        )
      ],
      rightActions: const [
        SizedBox.square(dimension: 24, child: CastButton()),
      ],
    );

    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: appBar,
      body: BccmPage(
        code: 'frontpage',
        // appbarOffset: appBar.preferredSize.height,
        parentPageName: 'none',
      ),
    );
  }
}
