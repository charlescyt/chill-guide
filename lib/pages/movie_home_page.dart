import 'package:flutter/material.dart';

import '../router/router.dart';
import '../widgets/my_app_bar.dart';

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MyAppBar(
              title: Text('Movie Home Page'),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 100,
                prototypeItem: const MovieCard(movieId: 0),
                itemBuilder: (context, index) => MovieCard(movieId: index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Movie $movieId'),
        onTap: () => MovieDetailsRouteData(movieId: movieId).go(context),
      ),
    );
  }
}
