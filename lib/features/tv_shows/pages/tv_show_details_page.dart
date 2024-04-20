import 'package:flutter/material.dart';

import '../../../app/widgets/my_app_bar.dart';

class TvShowDetailsPage extends StatelessWidget {
  const TvShowDetailsPage({
    super.key,
    required this.tvShowId,
  });

  final int tvShowId;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Material(
        child: Center(
          child: Column(
            children: [
              const MyAppBar(),
              Text('Tv Show Details Page for id: $tvShowId'),
            ],
          ),
        ),
      ),
    );
  }
}
