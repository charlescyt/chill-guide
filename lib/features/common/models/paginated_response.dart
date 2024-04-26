import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';

@immutable
class PaginatedResponse<T> {
  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;

  bool get isLastPage => page == totalPages;

  const PaginatedResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PaginatedResponse.fromTmdb(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromTmdb,
  ) {
    final page = json['page'];
    if (page is! int) {
      throw FormatException(buildFormatExceptionMessage('PaginatedResponse', 'page', 'int', page));
    }

    final results = json['results'];
    if (results is! List) {
      throw FormatException(buildFormatExceptionMessage('PaginatedResponse', 'results', 'List', results));
    }

    final totalPages = json['total_pages'];
    if (totalPages is! int) {
      throw FormatException(buildFormatExceptionMessage('PaginatedResponse', 'total_pages', 'int', totalPages));
    }

    final totalResults = json['total_results'];
    if (totalResults is! int) {
      throw FormatException(buildFormatExceptionMessage('PaginatedResponse', 'total_results', 'int', totalResults));
    }

    return PaginatedResponse(
      page: page,
      results: results.cast<Map<String, dynamic>>().map(fromTmdb).toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }

  @override
  String toString() => '${describeIdentity(this)}, '
      'page: $page, '
      'results: $results, '
      'totalPages: $totalPages, '
      'totalResults: $totalResults';
}
