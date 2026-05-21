import 'package:bccm_core/platform.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

String _labelForContributionType(BuildContext context, Enum$ContributionTypeCode code) {
  final s = S.of(context);
  switch (code) {
    case Enum$ContributionTypeCode.LYRICIST:
      return s.contributionTypeLyricist;
    case Enum$ContributionTypeCode.ARRANGER:
      return s.contributionTypeArranger;
    case Enum$ContributionTypeCode.SINGER:
      return s.contributionTypeSinger;
    case Enum$ContributionTypeCode.SPEAKER:
      return s.contributionTypeSpeaker;
    case Enum$ContributionTypeCode.COMPOSER:
      return s.contributionTypeComposer;
    case Enum$ContributionTypeCode.SOLOIST:
      return s.contributionTypeSoloist;
    case Enum$ContributionTypeCode.PERFORMER:
      return s.contributionTypePerformer;
    case Enum$ContributionTypeCode.TRANSLATOR:
      return s.contributionTypeTranslator;
    case Enum$ContributionTypeCode.DIRECTOR:
      return s.contributionTypeDirector;
    case Enum$ContributionTypeCode.PRODUCER:
      return s.contributionTypeProducer;
    case Enum$ContributionTypeCode.SCRIPTWRITER:
      return s.contributionTypeScriptwriter;
    case Enum$ContributionTypeCode.ACTOR:
      return s.contributionTypeActor;
    case Enum$ContributionTypeCode.VOICEACTOR:
      return s.contributionTypeVoiceActor;
    case Enum$ContributionTypeCode.OTHER:
      return s.contributionTypeOther;
    case Enum$ContributionTypeCode.$unknown:
      return s.contributionTypeOther;
  }
}

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
        .read(bccmGraphQLProvider)
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

          String contributorsToText(
            Iterable<({String name, List<Enum$ContributionTypeCode> types})> contributors, {
            String linePrefix = '',
          }) {
            final byType = <Enum$ContributionTypeCode, Set<String>>{};
            for (final contributor in contributors) {
              for (final type in contributor.types) {
                byType.putIfAbsent(type, () => <String>{}).add(contributor.name);
              }
            }
            return byType.entries.map((entry) => '$linePrefix${_labelForContributionType(context, entry.key)}: ${entry.value.join(', ')}').join('\n');
          }

          final contributorsText = contributorsToText([
            ...episode.contributors.map((c) => (name: c.person.name, types: c.contributionTypes)),
            ...episode.songs.expand((s) => s.contributors).map((c) => (name: c.person.name, types: c.contributionTypes)),
          ]);

          final songsText = episode.songs.map((song) {
            final collection = song.collection.title;
            return collection.isEmpty ? song.title : '${song.title} ($collection)';
          }).join('\n');

          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (episode.description.isNotEmpty)
                  _InfoItem(
                    title: S.of(context).episodeDescription,
                    text: episode.description,
                  ),
                if (episode.season != null && episode.season!.$show.description.isNotEmpty)
                  _InfoItem(
                    title: S.of(context).showDescription,
                    text: episode.season!.$show.description,
                  ),
                if (songsText.isNotEmpty) _InfoItem(title: S.of(context).songs, text: songsText),
                if (contributorsText.isNotEmpty) _InfoItem(title: S.of(context).contributors, text: contributorsText),
                if (episode.copyrightHolder != null) _InfoItem(title: S.of(context).copyright, text: episode.copyrightHolder!.name),
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
