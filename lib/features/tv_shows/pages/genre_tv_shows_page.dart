import 'package:flutter/material.dart';

import '../../../app/router/router.dart';
import '../../../app/widgets/list_tile_card.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../../../app/widgets/sliver_sized_box.dart';
import '../../common/widgets/paginated_list_view.dart';
import '../models/tv_show_genre.dart';
import '../providers/tv_show_providers.dart';

class GenreTvShowsPage extends StatelessWidget {
  const GenreTvShowsPage({
    super.key,
    required this.genreId,
  });

  final int genreId;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final genre = TvShowGenre.fromTmdbId(genreId);

    return SizedBox.expand(
      child: Material(
        child: Column(
          children: [
            MyAppBar(
              title: Text('${genre.label} TvShows'),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPaginatedListView<TvShow>(
                    getItemsCb: (ref, page) =>
                        ref.watch(discoverTvShowsWithGenreProvider(genreId: genreId, page: page)),
                    isNextPageLoadedCb: (ref, page) =>
                        ref.exists(discoverTvShowsWithGenreProvider(genreId: genreId, page: page + 1)),
                    onErrorRetryCb: (ref, page) async =>
                        ref.invalidate(discoverTvShowsWithGenreProvider(genreId: genreId, page: page)),
                    itemBuilder: (context, index, tvShow) => ListTileCard.tvShow(
                      tvShow: tvShow,
                      onTap: () => TvShowDetailsRouteData(tvShowId: tvShow.id).push<void>(context),
                    ),
                    placeholderBuilder: (context) => const ListTileCardSkeleton(),
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
