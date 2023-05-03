import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../api/brunstadtv.dart';
import '../../components/custom_grid_view.dart';
import '../../components/error_generic.dart';
import '../../components/loading_generic.dart';
import '../../components/sections/thumbnail_grid/thumbnail_grid_episode.dart';
import '../../graphql/queries/my_list.graphql.dart';
import '../../helpers/ui/btv_buttons.dart';
import '../../helpers/ui/svg_icons.dart';
import '../../models/episode_thumbnail_data.dart';
import '../../router/router.gr.dart';
import '../../theme/bccm_colors.dart';
import '../../theme/bccm_typography.dart';

class MyListScreen extends HookConsumerWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAppBar = useState(false);

    final myListFuture = useState(ref.read(apiProvider).getMyList());

    useEffect(() {
      showAppBar.value = false;
      myListFuture.value.then((myList) => showAppBar.value = myList.entries.items.isNotEmpty);
      return null;
    }, [myListFuture.value]);

    onRefresh() => myListFuture.value = ref.read(apiProvider).getMyList();

    return Scaffold(
      appBar: showAppBar.value ? AppBar(title: Text(S.of(context).myList)) : null,
      body: FutureBuilder(
        future: myListFuture.value,
        builder: (context, AsyncSnapshot<Query$MyList$myList> snapshot) {
          Widget child = const SizedBox.shrink();
          if (snapshot.connectionState != ConnectionState.done) {
            child = const Center(child: LoadingGeneric());
          } else if (snapshot.hasError || snapshot.data == null) {
            print(snapshot.error);
            child = ErrorGeneric(onRetry: onRefresh);
          } else if (snapshot.data!.entries.items.isEmpty) {
            child = const _MyListEmptyInfo();
          } else {
            child = RefreshIndicator(
              onRefresh: onRefresh,
              child: MyListGrid(items: snapshot.data!.entries.items),
            );
          }
          return AnimatedSwitcher(duration: const Duration(milliseconds: 250), child: child);
        },
      ),
    );
  }
}

class MyListGrid extends StatelessWidget {
  final List<Fragment$MyListEntry> items;

  const MyListGrid({
    super.key,
    required this.items,
  });

  EpisodeThumbnailData getEpisodeThumbnailData(Fragment$MyListEntry$item$$Episode episode) {
    return EpisodeThumbnailData(
      title: episode.title,
      duration: episode.duration,
      image: episode.image,
      locked: episode.locked,
      progress: episode.progress,
      publishDate: episode.publishDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    final episodeItems = items.map((item) => item.item).whereType<Fragment$MyListEntry$item$$Episode>();
    return CustomGridView(
      shrinkWrap: false,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: episodeItems.map<Widget>((item) {
        return GestureDetector(
          onTap: () => context.navigateTo(EpisodeScreenRoute(episodeId: item.id)),
          child: ThumbnailGridEpisode(
            episode: getEpisodeThumbnailData(item),
            showSecondaryTitle: false,
            aspectRatio: 16 / 9,
          ),
        );
      }).toList(),
    );
  }
}

class _MyListEmptyInfo extends StatelessWidget {
  const _MyListEmptyInfo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: SvgPicture.string(SvgIcons.heartInfo),
          ),
          Text(
            S.of(context).didYouKnowTitle,
            style: BccmTextStyles.headline1,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 42),
            child: Text(
              S.of(context).didYouKnowContent,
              textAlign: TextAlign.center,
              style: BccmTextStyles.body1.copyWith(color: BccmColors.label3),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2, left: 8, right: 8),
            child: BtvButton.large(
              labelText: S.of(context).exploreContent,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
