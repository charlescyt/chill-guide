import 'dart:ui' as ui;

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
import '../../common/widgets/company_list_tile.dart';
import '../providers/tv_show_providers.dart';
import '../widgets/network_list_tile.dart';
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
    final bottom = MediaQuery.viewPaddingOf(context).bottom;

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

    return Stack(
      fit: StackFit.expand,
      children: [
        if (tvShowDetails.posterPath case final posterPath?)
          ImageFiltered(
            imageFilter: ui.ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Image.network(
              posterPath.url(),
              fit: BoxFit.cover,
            ),
          ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colorScheme.background.withOpacity(0.5),
          ),
        ),
        Column(
          children: [
            MyAppBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
                child: background,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite_outline),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: bottom),
                child: Column(
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
                                  tvShowDetails.nameAndYear,
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
                    const Divider(),
                    Section(
                      title: const Text('Overview'),
                      content: Text(tvShowDetails.overview),
                    ),
                    const Divider(),
                    Section(
                      title: const Text('Status'),
                      content: Text(tvShowDetails.status),
                    ),
                    if (tvShowDetails.firstAirDate case final firstAirDate?) ...[
                      const Divider(),
                      Section(
                        title: const Text('First Air Date'),
                        content: Text(formatDate(firstAirDate)),
                      ),
                    ],
                    if (tvShowDetails.lastAirDate case final lastAirDate?) ...[
                      const Divider(),
                      Section(
                        title: const Text('Last Air Date'),
                        content: Text(formatDate(lastAirDate)),
                      ),
                    ],
                    if (tvShowDetails.productionCompanies case final companies when companies.isNotEmpty) ...[
                      const Divider(),
                      Section(
                        title: const Text('Production Companies'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final company in companies) //
                              CompanyListTile(company: company),
                          ],
                        ),
                      ),
                    ],
                    if (tvShowDetails.networks case final networks when networks.isNotEmpty) ...[
                      const Divider(),
                      Section(
                        title: const Text('Networks'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final network in networks) //
                              NetworkListTile(network: network),
                          ],
                        ),
                      ),
                    ],
                    if (tvShowDetails.seasons case final seasons when seasons.isNotEmpty) ...[
                      const Divider(),
                      Section(
                        title: const Text('Seasons'),
                        content: Carousel(
                          itemCount: seasons.length,
                          height: 240,
                          aspectRatio: 9 / 16,
                          enableInfiniteScroll: false,
                          itemBuilder: (context, index) {
                            final tvShowSeason = seasons[index];
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
                    ],
                    if (tvShowDetails.casts case final casts when casts.isNotEmpty) ...[
                      const Divider(),
                      Section(
                        title: const Text('Casts'),
                        content: Carousel(
                          itemCount: casts.length,
                          height: 240,
                          aspectRatio: 9 / 16,
                          itemBuilder: (context, index) {
                            final cast = casts[index];
                            return TvShowCastCard(
                              cast: cast,
                              onTap: () => PersonDetailsRouteData(personId: cast.id).push<void>(context),
                            );
                          },
                        ),
                      ),
                    ],
                    if (tvShowDetails.recommendations case final recommendations when recommendations.isNotEmpty) ...[
                      const Divider(),
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
        ),
      ],
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
