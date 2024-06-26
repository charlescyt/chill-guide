import 'dart:convert';

import 'package:chill_guide/features/movies/models/movie.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final fixtureJsonString = FixtureReader.read('movie.json');
  final fixtureJson = jsonDecode(fixtureJsonString) as Map<String, dynamic>;

  group('Movie', () {
    test('fromJson() should correctly parse json', () {
      final movie = Movie.fromTmdb(fixtureJson);

      expect(movie.id, 693134);
      expect(movie.title, 'Dune: Part Two');
      expect(
        movie.overview,
        'Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.',
      );
      expect(movie.posterPath, const PosterPath('/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg'));
      expect(movie.backdropPath, const BackdropPath('/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg'));
      expect(movie.releaseDate, DateTime(2024, 2, 27));
      expect(movie.voteAverage, 8.3);
      expect(movie.voteCount, 2899);
      expect(movie.popularity, 3437.313);
    });
  });
}
