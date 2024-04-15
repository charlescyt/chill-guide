import 'package:flutter/material.dart';

class TvShowHomePage extends StatelessWidget {
  const TvShowHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Material(
        child: Center(
          child: Text('Tv Show Home Page'),
        ),
      ),
    );
  }
}
