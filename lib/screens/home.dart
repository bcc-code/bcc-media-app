import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/router/router.gr.dart';

import 'package:bccm_player/cast_button.dart';
import 'package:flutter_svg/svg.dart';
import '../helpers/btv_colors.dart';
import '../components/general_app_bar.dart';
import '../components/icon_label_button.dart';
import '../components/mini_player.dart';
import '../components/page.dart';
import '../graphql/client.dart';
import '../graphql/queries/page.graphql.dart';
import '../services/auth_service.dart';

final logo = Image.asset('assets/images/logo.png');

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Future<Query$Page$page> resultFuture;

  @override
  void initState() {
    super.initState();

    final client = ref.read(gqlClientProvider);

    resultFuture = client
        .query$Page(
      Options$Query$Page(variables: Variables$Query$Page(code: 'frontpage')),
    )
        .then(
      (value) {
        if (value.hasException) {
          throw ErrorDescription(value.exception.toString());
        }
        if (value.parsedData == null) {
          throw ErrorDescription("No data for page code: 'frontpage'");
        }
        return value.parsedData!.page;
      },
    ).catchError(
      (error) {
        print(error);
      },
    );
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
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: InkWell(
              onTap: () {
                context.router.push(const ProfileRoute());
              },
              child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: SvgPicture.string(
                    SvgIcons.profile,
                  ))),
        ),
        actions: const [SizedBox(width: 40, child: CastButton())],
        flexibleSpace: Container(
          decoration: const BoxDecoration(boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 8,
                blurStyle: BlurStyle.outer)
          ]),
          child: ClipRect(
            clipBehavior: Clip.hardEdge,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [BtvColors.background1, Colors.transparent])),
                height: 1000,
              ),
            ),
          ),
        ),
      ),
      body: BccmPage(pageFuture: resultFuture),
    );
  }
}
