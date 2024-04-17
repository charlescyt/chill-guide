// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:chill_guide/features/common/models/paginated_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const paginatedResponse = PaginatedResponse(
    page: 1,
    results: [
      {
        'adult': false,
        'backdrop_path': '/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg',
        'genre_ids': [878, 12],
        'id': 693134,
        'original_language': 'en',
        'original_title': 'Dune: Part Two',
        'overview':
            'Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.',
        'popularity': 3437.313,
        'poster_path': '/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg',
        'release_date': '2024-02-27',
        'title': 'Dune: Part Two',
        'video': false,
        'vote_average': 8.3,
        'vote_count': 2899,
      },
    ],
    totalPages: 43588,
    totalResults: 871751,
  );

  group('PaginatedResponse', () {
    test('fromJson() should correctly parse json', () {
      final json = FixtureReader.read('paginated_response.json');
      final response = PaginatedResponse.fromJson(jsonDecode(json) as Map<String, dynamic>);

      expect(response.page, 1);
      expect(response.results, isA<List<Map<String, dynamic>>>());
      expect(response.results, hasLength(1));
      expect(response.results.first, equals(paginatedResponse.results.first));
      expect(response.totalPages, 43588);
      expect(response.totalResults, 871751);
    });

    test('toJson() should correctly convert to json', () {
      final json = paginatedResponse.toJson();

      expect(json['page'], 1);
      expect(json['results'], isA<List<Map<String, dynamic>>>());
      expect(json['results'], hasLength(1));
      expect(json['results'].first, equals(paginatedResponse.results.first));
      expect(json['total_pages'], 43588);
      expect(json['total_results'], 871751);
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
