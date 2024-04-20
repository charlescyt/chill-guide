abstract final class TmdbConstants {
  static const String apiUri = 'https://api.themoviedb.org/3';
  static const String apiHost = 'api.themoviedb.org';
  static const String apiPath = '/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p';

  // Movie endpoints
  static const String trendingMovies = '/trending/movie';
  static const String popularMovies = '/movie/popular';
  static const String upcomingMovies = '/movie/upcoming';
  static const String topRatedMovies = '/movie/top_rated';
  static const String movieDetails = '/movie';

  // TV Show endpoints
  static const String trendingTvShows = '/trending/tv';
  static const String airingTodayTvShows = '/tv/airing_today';
  static const String onTheAirTvShows = '/tv/on_the_air';
  static const String popularTvShows = '/tv/popular';
  static const String topRatedTvShows = '/tv/top_rated';
  static const String tvShowDetails = '/tv';
}
