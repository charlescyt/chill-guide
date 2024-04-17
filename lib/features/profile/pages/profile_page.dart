import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Material(
        child: Center(
          child: Text('Profile Page'),
        ),
      ),
    );
  }
}
