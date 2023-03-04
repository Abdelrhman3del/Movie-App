class ApiConstant {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = '0b8038ab4182307df7a09f3a3f3a0c19';
  static const nowPlayingMovieUrl =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const topRatedMovieUrl = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const popularMovieUrl = '$baseUrl/movie/popular?api_key=$apiKey';
  static const baseUrlImageNetwork = 'https://image.tmdb.org/t/p/w500';

  static imageUrl(String ?path) => '$baseUrlImageNetwork$path';

  static pathDetails(int id) => '$baseUrl/movie/$id?api_key=$apiKey';

  static pathRecommendation(int id) =>
      '$baseUrl/movie/$id/recommendations?api_key=$apiKey';
}
