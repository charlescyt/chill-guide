import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router/router.dart';
import '../../../app/widgets/buttons.dart';
import '../../../app/widgets/carousel.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../../../app/widgets/section.dart';
import '../../../app/widgets/sliver_sized_box.dart';
import '../../../tmdb/tmdb_options.dart';
import '../../common/widgets/genre_card.dart';
import '../models/tv_show_genre.dart';
import '../providers/tv_show_providers.dart';
import '../widgets/tv_show_card.dart';
import '../widgets/tv_show_landscape_card.dart';

class TvShowHomePage extends ConsumerWidget {
  const TvShowHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final padding = MediaQuery.paddingOf(context);
    final trendingTvShows = ref.watch(trendingTvShowsProvider(timeWindow: TimeWindow.day));
    // final airingTodayTvShows = ref.watch(airingTodayTvShowsProvider(page: 1));
    final onTheAirTvShows = ref.watch(onTheAirTvShowsProvider(page: 1));
    final popularTvShows = ref.watch(popularTvShowsProvider(page: 1));
    final topRatedTvShows = ref.watch(topRatedTvShowsProvider(page: 1));

    return SizedBox.expand(
      child: Material(
        child: Column(
          children: [
            const MyAppBar(
              title: Text('Tv Show'),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SectionTitle(
                      title: Text('Trending Today'),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AsyncValueCarousel(
                      carouselHeight: 240,
                      itemAspectRatio: 14 / 9,
                      asyncItems: trendingTvShows,
                      autoPlay: true,
                      itemBuilder: (context, index, tvShow) => TvShowLandscapeCard(
                        tvShow: tvShow,
                        onTap: () => TvShowDetailsRouteData(tvShowId: tvShow.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const TvShowSkeleton(),
                    ),
                  ),
                  const SliverDivider(),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: const Text('On The Air'),
                      trailing: SeeAllButton(
                        onPressed: () => const OnTheAirTvShowsRouteData().go(context),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AsyncValueCarousel(
                      asyncItems: onTheAirTvShows,
                      itemAspectRatio: 5 / 9,
                      itemBuilder: (context, itemIndex, tvShow) => TvShowCard(
                        tvShow: tvShow,
                        onTap: () => TvShowDetailsRouteData(tvShowId: tvShow.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const TvShowSkeleton(),
                    ),
                  ),
                  const SliverDivider(),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: const Text('Popular'),
                      trailing: SeeAllButton(
                        onPressed: () => const PopularTvShowsRouteData().go(context),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AsyncValueCarousel(
                      asyncItems: popularTvShows,
                      itemAspectRatio: 5 / 9,
                      itemBuilder: (context, itemIndex, tvShow) => TvShowCard(
                        tvShow: tvShow,
                        onTap: () => TvShowDetailsRouteData(tvShowId: tvShow.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const TvShowSkeleton(),
                    ),
                  ),
                  const SliverDivider(),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: const Text('Top Rated'),
                      trailing: SeeAllButton(
                        onPressed: () => const TopRatedTvShowsRouteData().go(context),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AsyncValueCarousel(
                      asyncItems: topRatedTvShows,
                      itemAspectRatio: 5 / 9,
                      itemBuilder: (context, itemIndex, tvShow) => TvShowCard(
                        tvShow: tvShow,
                        onTap: () => TvShowDetailsRouteData(tvShowId: tvShow.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const TvShowSkeleton(),
                    ),
                  ),
                  const SliverDivider(),
                  const SliverToBoxAdapter(
                    child: SectionTitle(
                      title: Text('Genres'),
                    ),
                  ),
                  SliverGrid.builder(
                    itemCount: TvShowGenre.values.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 16 / 9,
                    ),
                    itemBuilder: (context, index) {
                      final genre = TvShowGenre.values[index];
                      return GenreCard.tvShow(
                        genre: genre,
                        onTap: () {},
                      );
                    },
                  ),
                  SliverSizedBox(height: padding.bottom),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
