import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/search/component/search_result_list_component.dart';
import 'package:movie_app/modules/search/contorller/search_controller.dart';

class SearchResultViewPage extends StatelessWidget {
  const SearchResultViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchController>();
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text("${controller.searVideos.length} Results Found"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SearchResutlListComponent(videoList: controller.searVideos),
            ],
          ),
        ),
      );
    });
  }
}
