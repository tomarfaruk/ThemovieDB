import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/modules/home/model/video_info_model.dart';
import 'component/video_card_component.dart';
import 'controller/watch_controller.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  final dashBoardControloler = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, VideoInfoModel>(
      padding: const EdgeInsets.all(20),
      pagingController: dashBoardControloler.pagingController,
      builderDelegate: PagedChildBuilderDelegate<VideoInfoModel>(
        itemBuilder: (context, item, index) =>
            VideoCardComponent(videoInfo: item),
      ),
    );
  }
}
