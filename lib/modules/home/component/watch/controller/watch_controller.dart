import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/api/remote_api.dart';
import 'package:movie_app/modules/home/model/video_info_model.dart';
import 'package:movie_app/utils/rest_api.dart';

class DashBoardController extends GetxController {
  static const pageSize = 20;

  final PagingController<int, VideoInfoModel> pagingController =
      PagingController(firstPageKey: 1);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final url = RestApi.upcomingMovieUrl(pageKey);
      final newItems = await RemoteApi.getMovie(url);
      final isLastPage = (newItems?.results?.length ?? 0) < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems!.results!);
      } else {
        pagingController.appendPage(newItems!.results!, ++pageKey);
      }
    } catch (error) {
      pagingController.error = 'Error';
    }
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}
