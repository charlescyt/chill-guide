import 'package:flutter/material.dart';

import '../../../app/router/router.dart';
import '../../../app/widgets/list_tile_card.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../../../app/widgets/sliver_sized_box.dart';
import '../../common/widgets/paginated_list_view.dart';
import '../providers/movies_provider.dart';

class PopularMoviesPage extends StatelessWidget {
  const PopularMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);

    return SizedBox.expand(
      child: Material(
        child: Column(
          children: [
            const MyAppBar(
              title: Text('Popular Movies'),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPaginatedListView<Movie>(
                    getItemsCb: (ref, page) => ref.watch(popularMoviesProvider(page: page)),
                    isNextPageLoadedCb: (ref, page) => ref.exists(popularMoviesProvider(page: page + 1)),
                    onErrorRetryCb: (ref, page) async => ref.invalidate(popularMoviesProvider(page: page)),
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
            // SizedBox(height: padding.bottom),
          ],
        ),
      ),
    );
  }
}
