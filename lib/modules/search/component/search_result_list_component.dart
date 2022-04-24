import 'package:flutter/material.dart';

import 'package:movie_app/modules/home/model/video_info_model.dart';

import 'search_video_card_component.dart';

class SearchResutlListComponent extends StatelessWidget {
  const SearchResutlListComponent({
    Key? key,
    required this.videoList,
  }) : super(key: key);

  final List<VideoInfoModel> videoList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: videoList.length,
        itemBuilder: (context, index) {
          return SearchVideoCardComponent(videoInfoModel: videoList[index]);
        },
      ),
    );
  }
}
