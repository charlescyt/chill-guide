import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'tmdb_client.dart';

part 'tmdb_client_provider.g.dart';

// TODO(charlescyt): Should be editable in the app settings
@Riverpod()
String tmdbLanguage(TmdbLanguageRef ref) {
  return 'en-US';
}

// TODO(charlescyt): Should be editable in the app settings
@Riverpod()
String tmdbRegion(TmdbRegionRef ref) {
  return 'US';
}

@Riverpod(keepAlive: true)
String tmdbToken(TmdbTokenRef ref) {
  return const String.fromEnvironment('tmdbToken');
}

@Riverpod(keepAlive: true)
TmdbClient tmdbClient(TmdbClientRef ref) {
  return TmdbClient(token: ref.watch(tmdbTokenProvider));
}
