import 'package:flutter/material.dart';

import '../../../app/router/router.dart';
import '../../../app/widgets/list_tile_card.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../../../app/widgets/sliver_sized_box.dart';
import '../../common/widgets/paginated_list_view.dart';
import '../models/tv_show.dart';
import '../providers/tv_show_providers.dart';

class PopularTvShowsPage extends StatelessWidget {
  const PopularTvShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);

    return SizedBox.expand(
      child: Material(
        child: Column(
          children: [
            const MyAppBar(
              title: Text('Popular Tv Shows'),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPaginatedListView<TvShow>(
                    getItemsCb: (ref, page) => ref.watch(popularTvShowsResponseProvider(page: page)),
                    isNextPageLoadedCb: (ref, page) => ref.exists(popularTvShowsResponseProvider(page: page + 1)),
                    onErrorRetryCb: (ref, page) async => ref.invalidate(popularTvShowsResponseProvider(page: page)),
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

// class TvShowListTileCard extends StatelessWidget {
//   const TvShowListTileCard({
//     super.key,
//     required this.tvShow,
//     required this.onTap,
//   });

//   final TvShow tvShow;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     final poster = switch (tvShow.posterPath) {
//       null => PlaceholderIcon(
//           icon: const Icon(Icons.movie),
//           color: theme.colorScheme.primary,
//         ),
//       final poster => Ink.image(
//           image: NetworkImage(poster.url()),
//           fit: BoxFit.cover,
//         )
//     };

//     return Card(
//       child: InkWell(
//         onTap: onTap,
//         child: Stack(
//           children: [
//             if (tvShow.backdropPath case final backdropPath)
//               Positioned.fill(
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.7),
//                   ),
//                   child: Ink.image(
//                     image: NetworkImage(backdropPath.url()),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             Padding(
//               padding: const EdgeInsets.all(8),
//               child: SizedBox(
//                 height: 200,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AspectRatio(
//                       aspectRatio: 2 / 3,
//                       child: Card(child: poster),
//                     ),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               tvShow.name,
//                               style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             RatingIndicator(rating: tvShow.voteAverage),
//                             const SizedBox(height: 4),
//                             Text(
//                               tvShow.overview,
//                               style: theme.textTheme.bodyMedium,
//                               maxLines: 5,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
