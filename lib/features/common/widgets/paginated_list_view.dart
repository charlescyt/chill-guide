import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/paginated_response.dart';

class PaginatedListView<T> extends ConsumerWidget {
  const PaginatedListView({
    super.key,
    required this.getItemsCb,
    required this.isNextPageLoadedCb,
    required this.onErrorRetryCb,
    this.itemsPerPage = 20,
    required this.itemBuilder,
    required this.placeholderBuilder,
  });

  final AsyncValue<PaginatedResponse<T>> Function(WidgetRef ref, int page) getItemsCb;
  final bool Function(WidgetRef ref, int page) isNextPageLoadedCb;
  final Future<void> Function(WidgetRef ref, int page) onErrorRetryCb;
  final int itemsPerPage;
  final Widget Function(BuildContext context, int index, T item) itemBuilder;
  final Widget Function(BuildContext context) placeholderBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      cacheExtent: 20,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemBuilder: (context, index) {
        final page = index ~/ itemsPerPage + 1;
        final itemIndex = index % itemsPerPage;
        final asyncItems = getItemsCb(ref, page);

        switch (asyncItems) {
          // Handle the case when the async value is loaded.
          case AsyncData(value: final paginatedResponse):
            // Handle the case when the first page of the paginated response is empty.
            if (page == 1 && paginatedResponse.results.isEmpty) {
              // If the current item index is the first item on the first page,
              // return a custom NoItemFoundIndicator widget to signal that there are no items.
              if (itemIndex == 0) {
                return const _NoItemFoundIndicator();
              }

              // If the current item index is not the first item,
              // return null to stop building more items.
              else {
                return null;
              }
            }

            // Handle the case when the current page is the last page of the paginated response.
            if (paginatedResponse.isLastPage) {
              // If the current item index is within the range of the last page's results,
              // return the item using the provided itemBuilder.
              if (itemIndex < paginatedResponse.results.length) {
                return itemBuilder(context, index, paginatedResponse.results[itemIndex]);
              }

              // If the current item index is equal to the number of results in the last page,
              // return a custom EndOfListIndicator widget to signal the end of the list.
              if (paginatedResponse.isLastPage && itemIndex == paginatedResponse.results.length) {
                return const _EndOfListIndicator();
              }

              // If the current item index is beyond the range of the last page's results,
              // return null to stop building more items.
              return null;
            }

            // Handle the case when the current page is not the last page of the paginated response.
            return itemBuilder(context, index, paginatedResponse.results[itemIndex]);

          // Handle the case when the async value has an error.
          case AsyncError(:final error, :final isRefreshing) when !isRefreshing:
            // If it is the first item in the current page,
            // return a custom ErrorIndicator widget to display the error message and retry button.
            if (itemIndex == 0) {
              return _ErrorIndicator(
                error: error,
                onErrorRetryCb: onErrorRetryCb,
                page: page,
              );
            }

            // If it is not the first item in the current page,
            // return null to stop building more items.
            return null;

          // Handle the case when the async value is still loading.
          default:
            // Check if the next page of the paginated response has already been loaded.
            final isNextPageLoaded = isNextPageLoadedCb(ref, page);

            // If the next page is already loaded, this means that we are scrolling up,
            // return a placeholder widget using the provided placeholderBuilder for
            // all items in the current page.
            if (isNextPageLoaded) {
              return placeholderBuilder(context);
            }

            // If we are scrolling down, only show the placeholder widget for the first item
            // in the current page.
            if (itemIndex == 0) {
              return placeholderBuilder(context);
            }

            // If it is not the first item in the current page,
            // return null to stop building more items.
            return null;
        }
      },
    );
  }
}

class SliverPaginatedListView<T> extends ConsumerWidget {
  const SliverPaginatedListView({
    super.key,
    required this.getItemsCb,
    required this.isNextPageLoadedCb,
    required this.onErrorRetryCb,
    this.itemsPerPage = 20,
    required this.itemBuilder,
    required this.placeholderBuilder,
  });

  final AsyncValue<PaginatedResponse<T>> Function(WidgetRef ref, int page) getItemsCb;
  final bool Function(WidgetRef ref, int page) isNextPageLoadedCb;
  final Future<void> Function(WidgetRef ref, int page) onErrorRetryCb;
  final int itemsPerPage;
  final Widget Function(BuildContext context, int index, T item) itemBuilder;
  final Widget Function(BuildContext context) placeholderBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        final page = index ~/ itemsPerPage + 1;
        final itemIndex = index % itemsPerPage;
        final asyncItems = getItemsCb(ref, page);

        switch (asyncItems) {
          // Handle the case when the async value is loaded.
          case AsyncData(value: final paginatedResponse):
            // Handle the case when the first page of the paginated response is empty.
            if (page == 1 && paginatedResponse.results.isEmpty) {
              // If the current item index is the first item on the first page,
              // return a custom NoItemFoundIndicator widget to signal that there are no items.
              if (itemIndex == 0) {
                return const _NoItemFoundIndicator();
              }

              // If the current item index is not the first item,
              // return null to stop building more items.
              else {
                return null;
              }
            }

            // Handle the case when the current page is the last page of the paginated response.
            if (paginatedResponse.isLastPage) {
              // If the current item index is within the range of the last page's results,
              // return the item using the provided itemBuilder.
              if (itemIndex < paginatedResponse.results.length) {
                return itemBuilder(context, index, paginatedResponse.results[itemIndex]);
              }

              // If the current item index is equal to the number of results in the last page,
              // return a custom EndOfListIndicator widget to signal the end of the list.
              if (paginatedResponse.isLastPage && itemIndex == paginatedResponse.results.length) {
                return const _EndOfListIndicator();
              }

              // If the current item index is beyond the range of the last page's results,
              // return null to stop building more items.
              return null;
            }

            // Handle the case when the current page is not the last page of the paginated response.
            return itemBuilder(context, index, paginatedResponse.results[itemIndex]);

          // Handle the case when the async value has an error.
          case AsyncError(:final error, :final isRefreshing) when !isRefreshing:
            // If it is the first item in the current page,
            // return a custom ErrorIndicator widget to display the error message and retry button.
            if (itemIndex == 0) {
              return _ErrorIndicator(
                error: error,
                onErrorRetryCb: onErrorRetryCb,
                page: page,
              );
            }

            // If it is not the first item in the current page,
            // return null to stop building more items.
            return null;

          // Handle the case when the async value is still loading.
          default:
            // Check if the next page of the paginated response has already been loaded.
            final isNextPageLoaded = isNextPageLoadedCb(ref, page);

            // If the next page is already loaded, this means that we are scrolling up,
            // return a placeholder widget using the provided placeholderBuilder for
            // all items in the current page.
            if (isNextPageLoaded) {
              return placeholderBuilder(context);
            }

            // If we are scrolling down, only show the placeholder widget for the first item
            // in the current page.
            if (itemIndex == 0) {
              return placeholderBuilder(context);
            }

            // If it is not the first item in the current page,
            // return null to stop building more items.
            return null;
        }
      },
    );
  }
}

class _EndOfListIndicator extends StatelessWidget {
  const _EndOfListIndicator();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text('End of List'),
      ),
    );
  }
}

class _ErrorIndicator extends ConsumerWidget {
  const _ErrorIndicator({
    required this.error,
    required this.page,
    required this.onErrorRetryCb,
  });

  final Object error;
  final int page;
  final Future<void> Function(WidgetRef ref, int page) onErrorRetryCb;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Failed to load data for page $page\n$error',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 4,
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            icon: Icon(
              Icons.refresh,
              color: theme.colorScheme.onErrorContainer,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.errorContainer,
              foregroundColor: theme.colorScheme.onErrorContainer,
            ),
            onPressed: () {
              onErrorRetryCb(ref, page);
            },
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

class _NoItemFoundIndicator extends StatelessWidget {
  const _NoItemFoundIndicator();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text('No item found'),
      ),
    );
  }
}
