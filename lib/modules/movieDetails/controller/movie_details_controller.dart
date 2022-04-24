import 'package:get/get.dart';
import 'package:movie_app/api/remote_api.dart';
import 'package:movie_app/modules/movieDetails/model/video_entity_model.dart';
import 'package:movie_app/modules/movieDetails/model/video_info_details_model.dart';
import 'package:movie_app/utils/rest_api.dart';

class MovieDetailsController extends GetxController {
  var movieDetaislModel = Rxn<VideoInfoDetailsModel>();
  var videoEntityModelResponse = Rxn<VideoEntityModelResponse>();
  final isLoading = true.obs;
  final isLoadingVodeos = true.obs;

  @override
  void onInit() {
    loadMovieDetails();
    loadMovieEntitys();
    super.onInit();
  }

  Future<void> loadMovieDetails() async {
    isLoading(true);
    final movieId = int.parse(Get.parameters['id'] ?? '');
    final result =
        await RemoteApi.getMovieDetails(RestApi.detailsMovieUrl(movieId));
    if (result != null) {
      movieDetaislModel(result);
    }

    isLoading(false);
  }

  Future<void> loadMovieEntitys() async {
    isLoadingVodeos(true);
    videoEntityModelResponse.value = null;
    final movieId = int.parse(Get.parameters['id'] ?? '');
    final result =
        await RemoteApi.loadMovieEntitys(RestApi.movieEntitysUrl(movieId));
    if (result != null) {
      videoEntityModelResponse(result);
    }

    isLoadingVodeos(false);
  }
}
