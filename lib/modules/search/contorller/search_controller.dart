import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/api/remote_api.dart';
import 'package:movie_app/modules/home/model/video_info_model.dart';
import 'package:movie_app/utils/rest_api.dart';

class SearchController extends GetxController {
  final isLoading = false.obs;
  final int _currentPage = 1;

  final searVideos = <VideoInfoModel>[].obs;

  final searchEditController = TextEditingController();

  void search() async {
    searVideos.clear();
    isLoading(true);
    final url = RestApi.searchMovieUrl(searchEditController.text, _currentPage);
    final result = await RemoteApi.getMovie(url);
    if (result != null) {
      searVideos(result.results);
    }
    isLoading(false);
  }
}
