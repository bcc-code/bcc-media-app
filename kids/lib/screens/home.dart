import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/pages/page_mixin.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:brunstadtv_app/components/status/loading_indicator.dart';
import 'package:brunstadtv_app/graphql/queries/application.graphql.dart';
import 'package:brunstadtv_app/graphql/queries/page.graphql.dart';
import 'package:brunstadtv_app/helpers/misc.dart';
import 'package:brunstadtv_app/helpers/version.dart';
import 'package:brunstadtv_app/providers/app_config.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kids/components/page/section_renderer.dart';

@RoutePage<void>()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with PageMixin {
  late ProviderSubscription<Future<Query$Application?>> _appConfigListener;

  @override
  void initState() {
    super.initState();
    pageResult = wrapInCompleter(getHomePage());
    _appConfigListener = ref.listenManual<Future<Query$Application?>>(appConfigFutureProvider, (prev, next) async {
      final value = await next;
      if (value == null) return;
      if (!context.mounted) return;
      showDialogIfOldAppVersion(context, value);
    }, fireImmediately: true);
  }

  @override
  void dispose() {
    _appConfigListener.close();
    super.dispose();
  }

  Future<Query$Page$page> getHomePage() async {
    final api = ref.read(apiProvider);
    return ref.read(appConfigFutureProvider).then((value) {
      final code = value?.application.page?.code;
      if (code == null) {
        throw ErrorHint('Application config error');
      }
      return api.getPage("kids2-frontpage");
    });
  }

  Future<Query$Page$page> getHomeAndAppConfig() async {
    reloadAppConfig(ref);
    return getHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: pageResult.future,
                builder: (context, result) => CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    const SliverPadding(padding: EdgeInsets.only(left: 64)),
                    SliverToBoxAdapter(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: FractionallySizedBox(
                          heightFactor: 0.45,
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Image.asset(
                              'assets/flavors/prod/logo_neg.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SliverPadding(padding: EdgeInsets.only(left: 20)),
                    if (result.connectionState == ConnectionState.waiting)
                      const SliverFillRemaining(hasScrollBody: true, child: Center(child: LoadingIndicator()))
                    else if (result.data == null || result.hasError)
                      SliverFillRemaining(
                        hasScrollBody: true,
                        child: ErrorGeneric(
                          onRetry: () {
                            setState(() {
                              pageResult = wrapInCompleter(getHomeAndAppConfig());
                            });
                          },
                        ),
                      )
                    else
                      SliverList.builder(
                        itemCount: result.data!.sections.items.length,
                        itemBuilder: (context, index) {
                          final section = result.data!.sections.items[index];
                          return SectionRenderer(section: section);
                        },
                      ),
                    const SliverPadding(padding: EdgeInsets.only(right: 60)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: Row(
                  children: [
                    Text('Footer', style: DesignSystem.of(context).textStyles.headline1),
                    Text('Footer', style: DesignSystem.of(context).textStyles.title1),
                    Text('Footer', style: DesignSystem.of(context).textStyles.body1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
