import 'package:flutter/material.dart';

import '../../../app/router/router.dart';
import '../../../app/widgets/list_tile_card.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../../../app/widgets/sliver_sized_box.dart';
import '../../common/widgets/paginated_list_view.dart';
import '../models/tv_show.dart';
import '../providers/tv_show_providers.dart';

class TopRatedTvShowsPage extends StatelessWidget {
  const TopRatedTvShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);

    return SizedBox.expand(
      child: Material(
        child: Column(
          children: [
            const MyAppBar(
              title: Text('Top Rated Tv Shows'),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPaginatedListView<TvShow>(
                    getItemsCb: (ref, page) => ref.watch(topRatedTvShowsResponseProvider(page: page)),
                    isNextPageLoadedCb: (ref, page) => ref.exists(topRatedTvShowsResponseProvider(page: page + 1)),
                    onErrorRetryCb: (ref, page) async => ref.invalidate(topRatedTvShowsResponseProvider(page: page)),
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
