import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/utils/formatting.dart';
import '../../../app/widgets/placeholder_icon.dart';
import '../../../app/widgets/rating_indicator.dart';
import '../../../app/widgets/section.dart';
import '../../../app/widgets/sliver_sized_box.dart';
import '../providers/tv_show_providers.dart';

class TvShowSeasonDetailsPage extends ConsumerWidget {
  const TvShowSeasonDetailsPage({
    super.key,
    required this.tvShowId,
    required this.seasonNumber,
  });

  final int tvShowId;
  final int seasonNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTvShowSeasonDetails = ref.watch(
      tvShowSeasonDetailsProvider(
        tvShowId: tvShowId,
        seasonNumber: seasonNumber,
      ),
    );

    return SizedBox.expand(
      child: Material(
        child: switch (asyncTvShowSeasonDetails) {
          AsyncData(value: final tvShowSeason) => _Data(tvShowSeason),
          AsyncError(:final error) => Center(child: Text('Error: $error')),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ),
    );
  }
}

class _Data extends StatelessWidget {
  const _Data(this.tvShowSeasonDetails);

  final TvShowSeasonDetails tvShowSeasonDetails;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;
    final flexibleSpace = switch (tvShowSeasonDetails.posterPath) {
      null => null,
      final posterPath => FlexibleSpaceBar(
          stretchModes: const [StretchMode.zoomBackground, StretchMode.blurBackground],
          background: ClipRRect(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
            child: Image.network(
              posterPath.url(),
              fit: BoxFit.cover,
            ),
          ),
        ),
    };

    final expandedHeight = flexibleSpace != null ? 400.0 : 0.0;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            tvShowSeasonDetails.nameAndAirYear,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              shadows: const [Shadow(color: Colors.black, blurRadius: 2)],
            ),
          ),
          pinned: true,
          stretch: true,
          surfaceTintColor: null,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(32))),
          expandedHeight: expandedHeight,
          flexibleSpace: flexibleSpace,
        ),
        const SliverSizedBox(height: 8),
        if (tvShowSeasonDetails.overview.isNotEmpty) ...[
          SliverSection(
            title: const Text('Overview'),
            content: Text(tvShowSeasonDetails.overview),
          ),
          const SliverSizedBox(height: 8),
        ],
        SliverSection(
          title: const Text('Air date'),
          content: switch (tvShowSeasonDetails.airDate) {
            null => const Text('Unknown'),
            final airDate => Text(formatDate(airDate)),
          },
        ),
        const SliverSizedBox(height: 8),
        SliverToBoxAdapter(
          child: SectionTitle(
            title: Text('Episodes (${tvShowSeasonDetails.episodeCount})'),
          ),
        ),
        SliverList.separated(
          itemCount: tvShowSeasonDetails.episodes.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final episode = tvShowSeasonDetails.episodes[index];
            return EpisodeListTile(
              episode: episode,
              onTap: () {},
            );
          },
        ),
        SliverSizedBox(height: bottomPadding),
      ],
    );
  }
}

class EpisodeListTile extends StatelessWidget {
  const EpisodeListTile({
    super.key,
    required this.episode,
    required this.onTap,
  });

  final TvShowEpisode episode;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              child: switch (episode.stillPath) {
                null => PlaceholderIcon(
                    icon: const Icon(Icons.tv),
                    color: theme.colorScheme.primary,
                  ),
                final stillPath => Ink.image(
                    image: NetworkImage(stillPath.url()),
                    fit: BoxFit.cover,
                  ),
              },
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                episode.numberAndName,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                formatEpisodeAirDateAndRuntime(episode.airDate, episode.runtime),
                style: theme.textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: RatingIndicator(
                rating: episode.voteAverage,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(episode.overview),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
