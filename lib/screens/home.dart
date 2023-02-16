import 'dart:async';
import 'package:brunstadtv_app/router/router.gr.dart';
import 'package:brunstadtv_app/screens/shorts/shorts_main.dart';
import 'package:universal_io/io.dart';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/svg_icons.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:brunstadtv_app/helpers/version_number_utils.dart';
import 'package:brunstadtv_app/models/scroll_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bccm_player/cast_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../api/brunstadtv.dart';
import '../graphql/queries/application.graphql.dart';
import '../helpers/btv_buttons.dart';
import '../helpers/btv_colors.dart';
import '../components/page.dart';
import '../graphql/queries/page.graphql.dart';
import '../helpers/btv_typography.dart';
import '../helpers/page_mixin.dart';
import '../l10n/app_localizations.dart';
import '../providers/app_config.dart';

final logo = Image.asset('assets/images/logo.png');

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({Key? key}) : super(key: key ?? GlobalKey<HomeScreenState>());

  @override
  ConsumerState<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> with PageMixin implements ScrollScreen {
  late ProviderSubscription<Future<Query$Application?>> _appConfigListener;
  bool tooltipDismissed = false;
  String loginError = '';
  final pageScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    pageResult = wrapInCompleter(getHomePage());
    showDialogIfOldAppVersion();
    _appConfigListener = ref.listenManual<Future<Query$Application?>>(appConfigProvider, (prev, next) async {
      showDialogIfOldAppVersion();
    });
  }

  @override
  void scrollToTop() {
    pageScrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
  }

  @override
  void dispose() {
    _appConfigListener.close();
    super.dispose();
  }

  void showDialogIfOldAppVersion() async {
    final appConfig = await ref.read(appConfigProvider);
    if (appConfig == null) return;
    final packageInfo = await PackageInfo.fromPlatform();
    final minVersionNumber = appConfig.application.clientVersion;
    final currentVersionNumber = packageInfo.version;
    debugPrint(minVersionNumber);
    debugPrint('minVersionNumber ${getExtendedVersionNumber(minVersionNumber)}');
    debugPrint('currentVersionNumber ${getExtendedVersionNumber(currentVersionNumber)}');
    if (getExtendedVersionNumber(minVersionNumber) > getExtendedVersionNumber(currentVersionNumber)) {
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: Text(
                S.of(context).appUpdateTitle,
                style: BtvTextStyles.title3,
              ),
              contentPadding: const EdgeInsets.all(24).copyWith(top: 8),
              children: [
                Padding(padding: const EdgeInsets.only(bottom: 16), child: Text(S.of(context).appUpdateRequest)),
                BtvButton.medium(
                    onPressed: () {
                      if (Platform.isIOS) {
                        launchUrlString('itms-apps://itunes.apple.com', mode: LaunchMode.externalApplication);
                      } else if (Platform.isAndroid) {
                        launchUrlString('market://details?id=tv.brunstad.app', mode: LaunchMode.externalApplication);
                      }
                    },
                    labelText: S.of(context).appUpdateAccepted)
              ],
            );
          });
    }
  }

  Future<Query$Page$page> getHomePage() async {
    final api = ref.read(apiProvider);
    return ref.read(appConfigProvider).then((value) {
      final code = value?.application.page?.code;
      if (code == null) {
        throw ErrorHint('Application config error');
      }
      return api.getPage(code);
    });
  }

  Future<Query$Page$page> getHomeAndAppConfig() async {
    ref.read(appConfigProvider.notifier).state = ref.read(apiProvider).queryAppConfig();
    return getHomePage();
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
            leadingWidth: 100,
            leading: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    context.router.pushNamed('/profile');
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(left: 18, top: 12, bottom: 12, right: 32),
                      child: SvgPicture.string(
                        SvgIcons.profile,
                        semanticsLabel: S.of(context).profileTab,
                      ))),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ConstrainedBox(constraints: BoxConstraints.loose(const Size(24, 24)), child: const CastButton()),
              ),
            ],
            flexibleSpace: ClipRect(
              clipBehavior: Clip.hardEdge,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 6),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [BtvColors.background1, Colors.transparent])),
                  height: 1000,
                ),
              ),
            ),
          ),
          body: SafeArea(
            top: false,
            child: BccmPage(
              pageFuture: pageResult.future,
              onRefresh: ({bool? retry}) async {
                setState(() {
                  pageResult = wrapInCompleter(retry == true ? getHomeAndAppConfig() : getHomePage());
                });
              },
              scrollController: pageScrollController,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.token_outlined),
            onPressed: () {
              context.router.navigate(const ShortsMainRoute());
              // Navigator.push(
              //   context,
              //   MaterialPageRoute<void>(
              //     builder: (context) => const ShortsMain(),
              //   ),
              // );
              // context.router.push(const )
            },
          ),
        ),
      ],
    );
  }
}
