import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router/router.dart';
import '../../../app/widgets/carousel.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../../../tmdb/tmdb_options.dart';
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
    // final popularTvShows = ref.watch(popularTvShowsProvider(page: 1));
    final topRatedTvShows = ref.watch(topRatedTvShowsProvider(page: 1));

    return SizedBox.expand(
      child: Material(
        child: Column(
          children: [
            const MyAppBar(
              title: Text('Tv Show Home Page'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CarouselSection(
                      title: const Text('Trending'),
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
                    const Divider(),
                    CarouselSection(
                      title: const Text('On The Air'),
                      asyncItems: onTheAirTvShows,
                      itemAspectRatio: 5 / 9,
                      itemBuilder: (context, itemIndex, tvShow) => TvShowCard(
                        tvShow: tvShow,
                        onTap: () => TvShowDetailsRouteData(tvShowId: tvShow.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const TvShowSkeleton(),
                    ),
                    const Divider(),
                    CarouselSection(
                      title: const Text('Top Rated'),
                      asyncItems: topRatedTvShows,
                      itemAspectRatio: 5 / 9,
                      itemBuilder: (context, itemIndex, tvShow) => TvShowCard(
                        tvShow: tvShow,
                        onTap: () => TvShowDetailsRouteData(tvShowId: tvShow.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const TvShowSkeleton(),
                    ),
                    SizedBox(height: padding.bottom),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
