import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app_route.dart';
import 'package:movie_app/modules/home/model/video_info_model.dart';
import 'package:movie_app/utils/k_colors.dart';
import 'package:movie_app/utils/rest_api.dart';
import 'package:movie_app/widget/custom_image.dart';

class VideoCardComponent extends StatelessWidget {
  const VideoCardComponent({Key? key, required this.videoInfo})
      : super(key: key);

  final VideoInfoModel videoInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.movieDetailsScreen(videoInfo.id));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Hero(
                tag: videoInfo.id,
                child: CustomImage(
                  path: RestApi.getImageUrl(videoInfo.posterPath),
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        const Color(0xff000000).withOpacity(1.0),
                        const Color(0xff000000).withOpacity(0.0),
                      ],
                      stops: const [
                        0.0,
                        0.9,
                      ],
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    top: 27,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Text(
                    videoInfo.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
