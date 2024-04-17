import 'package:flutter/material.dart';

import '../../../app/widgets/my_app_bar.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MyAppBar(title: Text('Movie Details Page')),
            Expanded(
              child: Center(
                child: Text('This is the details page for movie $movieId'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
