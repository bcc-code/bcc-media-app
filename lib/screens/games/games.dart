import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/components/page.dart';
import 'package:brunstadtv_app/router/router.gr.dart';
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
    Widget gameCard(String gameId) {
      return GestureDetector(
        onTap: () => context.router.navigate(GameScreenRoute(gameId: gameId)),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                // Unsplash image
                Image.network(
                  'https://source.unsplash.com/random/?puzzle+games&w=1000&q=80&g=$gameId',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      );
    }

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
        child: BccmPage(
          pageFuture: pageFuture,
          onRefresh: ({retry}) => getGamesPage(),
        ),
      ),
    );
  }
}
