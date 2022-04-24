import '../.env.dart';

class RestApi {
  RestApi._();
  // static const apiKey = "af2ecd0f211c5d47b757dc0961c6015b";
  static RestApi get instance => RestApi._();

  static const _baseUrl = 'https://api.themoviedb.org/3';
  static const _imageBaseUrl = 'https://image.tmdb.org/t/p/original';

  static getImageUrl(String image) => _imageBaseUrl + image;

  static upcomingMovieUrl(int page) =>
      '$_baseUrl/movie/upcoming?api_key=${EnvKeys.apiKey}&page=$page';

  static topRatedMovieUrl(int page) =>
      '$_baseUrl/movie/top_rated?api_key=${EnvKeys.apiKey}&page=$page';

  static searchMovieUrl(String query, int page) =>
      '$_baseUrl/search/movie?api_key=${EnvKeys.apiKey}&query=$query&page=$page&include_adult=false';

  static detailsMovieUrl(int movieId) =>
      '$_baseUrl/movie/$movieId?api_key=${EnvKeys.apiKey}';
  static movieEntitysUrl(int movieId) =>
      '$_baseUrl/movie/$movieId/videos?api_key=${EnvKeys.apiKey}';

  static getImageListUrl(int movieId) =>
      '$_baseUrl/movie/$movieId/images?api_key=${EnvKeys.apiKey}';
}
