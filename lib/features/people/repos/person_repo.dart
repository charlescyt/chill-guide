import 'package:meta/meta.dart' show immutable;

import '../../../tmdb/tmdb_client.dart';
import '../models/person_details.dart';

@immutable
class PersonRepo {
  final TmdbClient _client;

  const PersonRepo({
    required TmdbClient client,
  }) : _client = client;

  Future<PersonDetails> getPersonDetails({
    required int personId,
    String language = 'en-US',
  }) async {
    final json = await _client.person.getPersonDetails(
      personId: personId,
      language: language,
    );

    return PersonDetails.fromTmdb(json);
  }
}
