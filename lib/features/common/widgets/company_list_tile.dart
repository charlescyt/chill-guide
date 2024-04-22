import 'package:flutter/material.dart';

import '../../movies/models/movie_details.dart';

class CompanyListTile extends StatelessWidget {
  const CompanyListTile({
    super.key,
    required this.company,
  });

  final Company company;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.primaryContainer.withOpacity(0.5),
      child: ListTile(
        title: Text(company.name),
        subtitle: Text(company.originCountry),
      ),
    );
  }
}
