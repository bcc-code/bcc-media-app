import 'package:brunstadtv_app/graphql/client.dart';
import 'package:brunstadtv_app/graphql/queries/episode.graphql.dart';
import 'package:brunstadtv_app/helpers/misc.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:brunstadtv_app/theme/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: DesignSystem.of(context).textStyles.title3,
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: double.infinity,
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xff707c8e),
                fontSize: 16,
                fontFamily: 'Barlow',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EpisodeDetails extends ConsumerStatefulWidget {
  const EpisodeDetails(this.episodeId, {super.key});

  final String episodeId;

  @override
  ConsumerState<EpisodeDetails> createState() => _EpisodeDetailsState();
}

class _EpisodeDetailsState extends ConsumerState<EpisodeDetails> {
  late Future<Fragment$EpisodeDetails?> episodeFuture;

  @override
  void initState() {
    super.initState();
    setState(() {
      episodeFuture = loadEpisode();
    });
  }

  @override
  void didUpdateWidget(previous) {
    super.didUpdateWidget(previous);
    if (previous.episodeId == widget.episodeId) {
      return;
    }
    setState(() {
      episodeFuture = loadEpisode();
    });
  }

  Future<Fragment$EpisodeDetails?> loadEpisode() async {
    final result = await ref
        .read(gqlClientProvider)
        .query$EpisodeDetails(Options$Query$EpisodeDetails(variables: Variables$Query$EpisodeDetails(id: widget.episodeId)));
    return result.parsedData?.episode;
  }

  @override
  Widget build(BuildContext context) {
    return simpleFutureBuilder<Fragment$EpisodeDetails?>(
        future: episodeFuture,
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e) => const SizedBox.shrink(),
        noData: () => const SizedBox.shrink(),
        ready: (episode) {
          if (episode == null) return const SizedBox.shrink();

          final locale = Localizations.localeOf(context).languageCode;

          final publishDate = DateTime.tryParse(episode.publishDate);
          final availableTo = DateTime.tryParse(episode.availableTo);

          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (episode.season != null)
                  _InfoItem(
                    title: S.of(context).showDescription,
                    text: episode.season!.$show.description,
                  ),
                if (publishDate != null)
                  _InfoItem(
                    title: S.of(context).releaseDate,
                    text: DateFormat.yMMMMd(locale).add_jm().format(publishDate.toLocal()),
                  ),
                if (availableTo != null && availableTo.isBefore(DateTime.now().add(const Duration(days: 365))))
                  _InfoItem(
                    title: S.of(context).availableTo,
                    text: DateFormat.yMMMd(locale).add_jm().format(availableTo.toLocal()),
                  ),
                _InfoItem(title: S.of(context).ageRating, text: episode.ageRating == 'A' ? S.of(context).ageRatingAll : '${episode.ageRating}+'),
                if (episode.audioLanguages.isNotEmpty)
                  _InfoItem(title: S.of(context).audio, text: episode.audioLanguages.fold('', (str, lang) => str += '${lang.toString()}\n')),
              ],
            ),
          );
        });
  }
}
