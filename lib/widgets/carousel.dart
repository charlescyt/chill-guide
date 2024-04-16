import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class CarouselSection<T> extends StatelessWidget {
  const CarouselSection({
    super.key,
    required this.title,
    required this.asyncItems,
    required this.itemBuilder,
    required this.loadingBuilder,
    this.carouselHeight = 240,
    this.itemAspectRatio = 2 / 3,
    this.onSeeAllPressed,
  });

  final Widget title;
  final AsyncValue<List<T>> asyncItems;
  final Widget Function(BuildContext context, int index, T item) itemBuilder;
  final IndexedWidgetBuilder loadingBuilder;
  final double carouselHeight;
  final double itemAspectRatio;
  final VoidCallback? onSeeAllPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final content = switch (asyncItems) {
      AsyncData(value: final items) => Carousel(
          itemCount: items.length,
          height: carouselHeight,
          aspectRatio: itemAspectRatio,
          itemBuilder: (context, index) => itemBuilder(context, index, items[index]),
        ),
      AsyncError(:final error) => SizedBox(
          height: carouselHeight,
          child: Card.outlined(
            color: theme.colorScheme.errorContainer,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red),
                  Text(
                    '$error',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      _ => Carousel(
          itemCount: 10,
          height: carouselHeight,
          aspectRatio: itemAspectRatio,
          itemBuilder: loadingBuilder,
        ),
    };

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: DefaultTextStyle.merge(
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  child: title,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
        content,
      ],
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.height,
    required this.aspectRatio,
    this.autoPlay = false,
    this.enableInfiniteScroll = true,
    this.enlargeCenterPage = false,
    this.padEnds = false,
    this.onPageChanged,
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double height;
  final double aspectRatio;
  final bool autoPlay;
  final bool enableInfiniteScroll;
  final bool enlargeCenterPage;
  final bool padEnds;
  final void Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = height * aspectRatio;
        final viewportFraction = width / constraints.maxWidth;

        return FlutterCarousel.builder(
          itemCount: itemCount,
          options: CarouselOptions(
            height: height,
            viewportFraction: viewportFraction,
            autoPlay: autoPlay,
            enableInfiniteScroll: enableInfiniteScroll,
            enlargeCenterPage: enlargeCenterPage,
            padEnds: padEnds,
            showIndicator: false,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: onPageChanged,
          ),
          itemBuilder: (context, itemIndex, pageViewIndex) => itemBuilder(context, itemIndex),
        );
      },
    );
  }
}
