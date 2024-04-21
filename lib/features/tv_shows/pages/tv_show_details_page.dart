import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router/router.dart';
import '../../../app/utils/formatting.dart';
import '../../../app/widgets/carousel.dart';
import '../../../app/widgets/info_card.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../../../app/widgets/placeholder_icon.dart';
import '../../../app/widgets/rating_indicator.dart';
import '../../../app/widgets/section.dart';
import '../models/tv_show_details.dart';
import '../providers/tv_show_providers.dart';
import '../widgets/tv_show_card.dart';
import '../widgets/tv_show_cast_card.dart';
import '../widgets/tv_show_season_card.dart';

class TvShowDetailsPage extends ConsumerWidget {
  const TvShowDetailsPage({
    super.key,
    required this.tvShowId,
  });

  final int tvShowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTvShowDetails = ref.watch(tvShowDetailsProvider(tvShowId: tvShowId));

    return SizedBox.expand(
      child: Material(
        child: switch (asyncTvShowDetails) {
          AsyncData(value: final tvShowDetails) => _Data(tvShowDetails),
          AsyncError(:final error) => _Error(error: error),
          _ => const _Loading(),
        },
      ),
    );
  }
}

class _Data extends StatelessWidget {
  const _Data(this.tvShowDetails);

  final TvShowDetails tvShowDetails;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final background = switch (tvShowDetails.backdropPath) {
      null => PlaceholderIcon(
          icon: const Icon(Icons.tv),
          color: theme.colorScheme.primary,
        ),
      final backdrop => Image.network(
          backdrop.url(),
          fit: BoxFit.cover,
        ),
    };

    return LayoutBuilder(
      builder: (context, constrains) {
        final height = constrains.maxHeight;
        const backgroundHeight = 300.0;
        const offset = 20;
        final contentHeight = height - backgroundHeight + offset;
        return Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              height: backgroundHeight,
              child: background,
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: MyAppBar(
                actions: [
                  IconButton(
                    icon: const Icon(Icons.favorite_outline),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              height: contentHeight,
              child: Material(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    SizedBox(
                      height: 200,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140,
                            child: Card(
                              child: switch (tvShowDetails.posterPath) {
                                null => Center(
                                    child: PlaceholderIcon(
                                      icon: const Icon(Icons.tv),
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                final poster => Image.network(
                                    poster.url(),
                                    fit: BoxFit.cover,
                                  ),
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tvShowDetails.name,
                                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                ),
                                Text(tvShowDetails.genres.map((e) => e.name).join(', ')),
                                RatingIndicator(rating: tvShowDetails.voteAverage),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.center,
                                  runAlignment: WrapAlignment.center,
                                  children: [
                                    InfoCard(
                                      title: 'Seasons',
                                      content: tvShowDetails.numberOfSeasons.toString(),
                                    ),
                                    InfoCard(
                                      title: 'Episodes',
                                      content: tvShowDetails.numberOfEpisodes.toString(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (tvShowDetails.tagline.isNotEmpty)
                      Center(
                        child: Text(
                          tvShowDetails.tagline,
                          style: theme.textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    const SizedBox(height: 8),
                    Section(
                      title: const Text('Overview'),
                      content: Text(tvShowDetails.overview),
                    ),
                    const SizedBox(height: 8),
                    Section(
                      title: const Text('Status'),
                      content: Text(tvShowDetails.status),
                    ),
                    if (tvShowDetails.firstAirDate case final firstAirDate?) ...[
                      const SizedBox(height: 16),
                      Section(
                        title: const Text('First Air Date'),
                        content: Text(formatDate(firstAirDate)),
                      ),
                    ],
                    if (tvShowDetails.lastAirDate case final lastAirDate?) ...[
                      const SizedBox(height: 16),
                      Section(
                        title: const Text('Last Air Date'),
                        content: Text(formatDate(lastAirDate)),
                      ),
                    ],
                    const SizedBox(height: 16),
                    Section(
                      title: const Text('Seasons'),
                      content: Carousel(
                        itemCount: tvShowDetails.seasons.length,
                        height: 240,
                        aspectRatio: 9 / 16,
                        enableInfiniteScroll: false,
                        itemBuilder: (context, index) {
                          final tvShowSeason = tvShowDetails.seasons[index];
                          return TvShowSeasonCard(
                            tvShowSeason: tvShowSeason,
                            onTap: () => TvShowSeasonDetailsRouteData(
                              tvShowId: tvShowDetails.id,
                              seasonNumber: tvShowSeason.seasonNumber,
                            ).go(context),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Section(
                      title: const Text('Casts'),
                      content: Carousel(
                        itemCount: tvShowDetails.casts.length,
                        height: 240,
                        aspectRatio: 9 / 16,
                        itemBuilder: (context, index) {
                          return TvShowCastCard(
                            cast: tvShowDetails.casts[index],
                            onTap: () {
                              // TODO(charlescyt): Push to cast details page
                            },
                          );
                        },
                      ),
                    ),
                    if (tvShowDetails.recommendations case final recommendations when recommendations.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Section(
                        title: const Text('Recommendations'),
                        content: Carousel(
                          itemCount: recommendations.length,
                          height: 240,
                          aspectRatio: 9 / 16,
                          itemBuilder: (context, index) {
                            final tvShow = recommendations[index];
                            return TvShowCard(
                              tvShow: tvShow,
                              onTap: () => TvShowDetailsRouteData(tvShowId: tvShow.id).push<void>(context),
                            );
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({
    required this.error,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(child: Text('Error: $error')),
    );
  }
}
