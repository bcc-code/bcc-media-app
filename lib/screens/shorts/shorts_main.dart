import 'package:brunstadtv_app/components/loading_generic.dart';
import 'package:brunstadtv_app/components/shorts/shorts_episode_main.dart';
import 'package:brunstadtv_app/graphql/queries/shorts.graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ShortsMain extends ConsumerStatefulWidget {
  const ShortsMain({Key? key}) : super(key: key);

  @override
  ConsumerState<ShortsMain> createState() => _ShortsMainState();
}

class _ShortsMainState extends ConsumerState<ShortsMain> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Query$GetEpisodesForShorts$Widget(
        options: Options$Query$GetEpisodesForShorts(
          cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
          fetchPolicy: FetchPolicy.networkOnly,
          variables: Variables$Query$GetEpisodesForShorts(first: 30, offset: 0),
        ),
        builder: (result, {refetch, fetchMore}) {
          if (result.isLoading) {
            return const LoadingGeneric();
          } else {
            final data = result.parsedData?.collection.items?.items.whereType<Fragment$ShortsEpisode$$EpisodeItem>().map((e) => e.episode).toList();
            if (data == null) return const SizedBox();
            return Stack(
              children: [
                PageView.builder(
                  controller: PageController(
                    initialPage: 0,
                    viewportFraction: 1,
                  ),
                  itemCount: data.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ShortsEpisode(
                      episode: data[index],
                    );
                  },
                ),
                Positioned(
                  top: 20.0,
                  left: 40.0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }
}
