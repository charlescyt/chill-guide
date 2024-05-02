import 'package:flutter/material.dart';

import '../../../app/router/router.dart';
import '../../../app/widgets/list_tile_card.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../../../app/widgets/sliver_sized_box.dart';
import '../../common/widgets/paginated_list_view.dart';
import '../models/movie_genre.dart';
import '../providers/movies_provider.dart';

class GenreMoviesPage extends StatelessWidget {
  const GenreMoviesPage({
    super.key,
    required this.genreId,
  });

  final int genreId;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final genre = MovieGenre.fromTmdbId(genreId);

    return SizedBox.expand(
      child: Material(
        child: Column(
          children: [
            MyAppBar(
              title: Text('${genre.label} Movies'),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPaginatedListView<Movie>(
                    getItemsCb: (ref, page) => ref.watch(discoverMoviesWithGenreProvider(genreId: genreId, page: page)),
                    isNextPageLoadedCb: (ref, page) =>
                        ref.exists(discoverMoviesWithGenreProvider(genreId: genreId, page: page + 1)),
                    onErrorRetryCb: (ref, page) async =>
                        ref.invalidate(discoverMoviesWithGenreProvider(genreId: genreId, page: page)),
                    itemBuilder: (context, index, movie) => ListTileCard.movie(
                      movie: movie,
                      onTap: () => MovieDetailsRouteData(movieId: movie.id).push<void>(context),
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
