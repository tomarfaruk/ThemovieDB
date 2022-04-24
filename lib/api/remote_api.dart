import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:movie_app/modules/home/model/movie_info_list_response.dart';
import 'package:movie_app/modules/movieDetails/model/video_entity_model.dart';
import 'package:movie_app/modules/movieDetails/model/video_info_details_model.dart';

class RemoteApi {
  RemoteApi._();

  static RemoteApi get instance => RemoteApi._();

  static Future<MovieInfoListResponse?> getMovie(String url) async {
    try {
      log(url);
      http.Response response = await http.get(Uri.parse(url));

      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200) {
        return MovieInfoListResponse.fromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<VideoInfoDetailsModel?> getMovieDetails(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return VideoInfoDetailsModel.fromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<VideoEntityModelResponse?> loadMovieEntitys(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return VideoEntityModelResponse.fromJson(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
