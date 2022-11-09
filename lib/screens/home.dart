import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/sign_in_tooltip.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:brunstadtv_app/router/router.gr.dart';

import 'package:bccm_player/cast_button.dart';
import 'package:flutter_svg/svg.dart';
import '../helpers/btv_colors.dart';
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
  bool isGuestUser = false;
  bool showTooltip = false;
  GlobalKey profileIconKey = GlobalKey();
  Offset? tooltipPos;
  String loginError = '';

  @override
  void initState() {
    super.initState();
    if (AuthService.instance.guestUser) {
      isGuestUser = true;
      showTooltip = true;
    }
    resultFuture = getPage();
  }

  Future<void> loginAction(BuildContext context) async {
    final error = await AuthService.instance.login();
    if (error == null) {
      context.router.popUntil((route) => false);
      context.router.pushNamed('/');
    } else {
      loginError = error.toString();
    }
  }

  Future<Query$Page$page> getPage() async {
    final client = ref.read(gqlClientProvider);
    return client
        .query$Page(
      Options$Query$Page(variables: Variables$Query$Page(code: 'frontpage')),
    )
        .then(
      (value) {
        if (value.exception != null) {
          throw value.exception!;
        }
        if (value.parsedData == null) {
          throw ErrorDescription("No data for page code: 'frontpage'");
        }
        return value.parsedData!.page;
      },
    ).onError(
      (error, stackTrace) {
        FirebaseCrashlytics.instance
            .recordError(error, stackTrace, reason: 'a non-fatal error');
        var message = error.asOrNull<ErrorDescription>();
        if (message != null) {
          debugPrint(message.value.toString());
        }
        return Future.error(error ?? ErrorHint('Unknown error'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: 44,
            shadowColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: logo,
            leading: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (isGuestUser) {
                      loginAction(context);
                    } else {
                      context.router.pushNamed('/profile');
                    }
                  },
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 12, bottom: 12),
                      child: SvgPicture.string(
                        key: profileIconKey,
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
                            colors: [
                          BtvColors.background1,
                          Colors.transparent
                        ])),
                    height: 1000,
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            top: false,
            child: BccmPage(
                pageFuture: resultFuture,
                onRefresh: () async {
                  setState(() {
                    resultFuture = getPage();
                  });
                }),
          ),
        ),
        if (showTooltip)
          Positioned(
            left: 7 + MediaQuery.of(context).padding.left,
            top: 35 + MediaQuery.of(context).padding.top,
            child: Material(
              color: Colors.transparent,
              child: SignInTooltip(onClose: () {
                setState(() => showTooltip = false);
              }),
            ),
          )
      ],
    );
  }
}
