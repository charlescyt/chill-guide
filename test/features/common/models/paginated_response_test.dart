// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:chill_guide/features/common/models/paginated_response.dart';
import 'package:chill_guide/features/movies/models/movie.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  group('PaginatedResponse', () {
    test('fromJson() should correctly parse json', () {
      final jsonString = FixtureReader.read('paginated_response.json');
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      final response = PaginatedResponse.fromTmdb(json, Movie.fromTmdb);

      expect(response.page, 1);
      expect(response.results, isA<List<Movie>>());
      expect(response.results, hasLength(1));
      expect(response.totalPages, 43588);
      expect(response.totalResults, 871751);
    });

    test('isLastPage should return true if page is equal to totalPages', () {
      const response = PaginatedResponse(
        page: 43588,
        results: [],
        totalPages: 43588,
        totalResults: 871751,
      );

      expect(response.isLastPage, isTrue);
    });

    test('isLastPage should return false if page is not equal to totalPages', () {
      const response = PaginatedResponse(
        page: 1,
        results: [],
        totalPages: 43588,
        totalResults: 871751,
      );

      expect(response.isLastPage, isFalse);
    });
  });
}
