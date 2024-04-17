import 'package:flutter/foundation.dart' show describeIdentity, immutable;

@immutable
class PaginatedResponse {
  final int page;
  final List<Map<String, dynamic>> results;
  final int totalPages;
  final int totalResults;

  bool get isLastPage => page == totalPages;

  const PaginatedResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PaginatedResponse.fromJson(Map<String, dynamic> json) {
    return PaginatedResponse(
      page: json['page'] as int,
      results: (json['results'] as List).cast<Map<String, dynamic>>(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results,
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  @override
  String toString() => '${describeIdentity(this)}(${toJson()})';
}
