import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../tmdb/tmdb_client_provider.dart';
import '../../common/utils/riverpod.dart';
import '../models/person_details.dart';
import '../repos/person_repo.dart';

part 'person_providers.g.dart';

@riverpod
PersonRepo personRepo(PersonRepoRef ref) {
  final tmdbClient = ref.watch(tmdbClientProvider);
  return PersonRepo(client: tmdbClient);
}

@riverpod
Future<PersonDetails> personDetails(
  PersonDetailsRef ref, {
  required int personId,
}) {
  final repo = ref.watch(personRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final details = repo.getPersonDetails(personId: personId, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return details;
}
