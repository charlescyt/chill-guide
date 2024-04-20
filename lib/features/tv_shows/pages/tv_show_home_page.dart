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
                  children: [
                    CarouselSection(
                      title: const Text('Trending Tv Shows'),
                      carouselHeight: 240,
                      itemAspectRatio: 14 / 9,
                      asyncItems: trendingTvShows,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      padEnds: true,
                      itemBuilder: (context, index, tvShow) => TvShowLandscapeCard(
                        tvShow: tvShow,
                        onTap: () => TvShowDetailsRouteData(tvShowId: tvShow.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const TvShowSkeleton(),
                    ),
                    // CarouselSection(
                    //   title: const Text('Airing Today Tv Shows'),
                    //   asyncItems: airingTodayTvShows,
                    //   itemAspectRatio: 5 / 9,
                    //   itemBuilder: (context, itemIndex, tvShow) => TvShowCard(
                    //     tvShow: tvShow,
                    //     onTap: () {
                    //       TvShowDetailsRouteData(tvShowId: tvShow.id).go(context);
                    //     },
                    //   ),
                    //   loadingBuilder: (context, index) => const TvShowSkeleton(),
                    // ),
                    CarouselSection(
                      title: const Text('On The Air Tv Shows'),
                      asyncItems: onTheAirTvShows,
                      itemAspectRatio: 5 / 9,
                      itemBuilder: (context, itemIndex, tvShow) => TvShowCard(
                        tvShow: tvShow,
                        onTap: () => TvShowDetailsRouteData(tvShowId: tvShow.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const TvShowSkeleton(),
                    ),
                    // CarouselSection(
                    //   title: const Text('Popular Tv Shows'),
                    //   asyncItems: popularTvShows,
                    //   itemAspectRatio: 5 / 9,
                    //   itemBuilder: (context, itemIndex, tvShow) => TvShowCard(
                    //     tvShow: tvShow,
                    //     onTap: () {
                    //       TvShowDetailsRouteData(tvShowId: tvShow.id).go(context);
                    //     },
                    //   ),
                    //   loadingBuilder: (context, index) => const TvShowSkeleton(),
                    // ),
                    CarouselSection(
                      title: const Text('Top Rated Tv Shows'),
                      asyncItems: topRatedTvShows,
                      itemAspectRatio: 5 / 9,
                      itemBuilder: (context, itemIndex, tvShow) => TvShowCard(
                        tvShow: tvShow,
                        onTap: () => TvShowDetailsRouteData(tvShowId: tvShow.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const TvShowSkeleton(),
                    ),
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
