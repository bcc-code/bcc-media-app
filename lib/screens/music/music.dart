import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/helpers/bmm.dart';
import 'package:brunstadtv_app/providers/playback_service.dart';
import 'package:brunstadtv_app/screens/music/bmm_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MusicScreen extends HookConsumerWidget {
  const MusicScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bmmApi = ref.watch(bmmApiProvider);
    final tracksFuture = useState(useMemoized(() => bmmApi.getTracks()));
    final tracksSnapshot = useFuture(tracksFuture.value);

    return Scaffold(
      appBar: AppBar(
        title: Text('Music'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          tracksFuture.value = bmmApi.getTracks();
          await tracksFuture.value;
        },
        child: CustomScrollView(
          slivers: <Widget>[
            if (tracksSnapshot.connectionState == ConnectionState.waiting)
              const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            if (tracksSnapshot.error != null)
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  color: Colors.blue,
                  child: Center(
                    child: Text(tracksSnapshot.error.toString()),
                  ),
                ),
              ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final track = tracksSnapshot.data![index];
                  return ListTile(
                    leading: Container(
                      width: 60,
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: coverFromTrack(track)?.let(
                          (url) => simpleFadeInImage(url: ref.read(bmmApiProvider).getSignedUrl(url)),
                        ),
                      ),
                    ),
                    title: Text('${track.title}'),
                    onTap: () {
                      ref.read(playbackServiceProvider).playTrack(track);
                    },
                  );
                },
                childCount: tracksSnapshot.data?.length ?? 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
