import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app_route.dart';
import 'package:movie_app/modules/home/model/video_info_model.dart';
import 'package:movie_app/utils/k_colors.dart';
import 'package:movie_app/utils/rest_api.dart';

import 'package:movie_app/widget/custom_image.dart';

class SearchVideoCardComponent extends StatelessWidget {
  const SearchVideoCardComponent({
    Key? key,
    required this.videoInfoModel,
  }) : super(key: key);
  final VideoInfoModel videoInfoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.movieDetailsScreen(videoInfoModel.id));
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomImage(
                path: RestApi.getImageUrl(videoInfoModel.posterPath),
                width: 130,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfoModel.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    videoInfoModel.releaseDate,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: sliverColor,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.more_horiz_outlined, color: lightBlueColor)
          ],
        ),
      ),
    );
  }
}
