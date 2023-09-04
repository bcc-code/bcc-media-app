import 'package:brunstadtv_app/components/pages/page_renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/brunstadtv.dart';
import '../../graphql/queries/page.graphql.dart';
import '../../providers/app_config.dart';

class GamesScreen extends HookConsumerWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<Query$Page$page> getGamesPage() async {
      final api = ref.read(apiProvider);
      final appConfig = await ref.read(appConfigFutureProvider);
      final code = appConfig?.application.gamesPage?.code;
      if (code == null) {
        throw Exception('Application config error');
      }
      return api.getPage(code);
    }

    final pageFuture = useMemoized(getGamesPage);

    return Scaffold(
      appBar: AppBar(title: const Text('Games')),
      body: SafeArea(
        child: PageRenderer(
          pageFuture: pageFuture,
          onRefresh: ({retry}) => getGamesPage(),
        ),
      ),
    );
  }
}
