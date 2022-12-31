class ApiConstance {
  ///Movies Constances
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "1e45f83b28997689ec0af26b09147dc0";

  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) {
    return '$baseImageUrl$path';
  }

  static String movieDetailsPath(int movieId) {
    return '$baseUrl/movie/$movieId?api_key=$apiKey';
  }

  static String recommendationMoviesPath(int movieId) {
    return "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";
  }

  ///Tv Constances
  static const String baseTvUrl = "https://api.themoviedb.org/3/tv";
  static const String onAirTvBath = '$baseTvUrl/on_the_air?api_key=$apiKey';
  static const String popularTvBath = '$baseTvUrl/popular?api_key=$apiKey';
  static const String topRatedTvBath = '$baseTvUrl/top_rated?api_key=$apiKey';
}
