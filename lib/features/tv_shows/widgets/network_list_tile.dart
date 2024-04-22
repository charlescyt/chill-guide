import 'package:flutter/material.dart';

import '../models/network.dart';

class NetworkListTile extends StatelessWidget {
  const NetworkListTile({
    super.key,
    required this.network,
  });

  final Network network;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.primaryContainer.withOpacity(0.5),
      child: ListTile(
        title: Text(network.name),
        subtitle: Text(network.originCountry),
      ),
    );
  }
}
