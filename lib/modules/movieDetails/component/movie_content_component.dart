import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import 'package:movie_app/modules/movieDetails/model/video_info_details_model.dart';
import 'package:movie_app/utils/k_colors.dart';

class MovieContentComponent extends StatelessWidget {
  const MovieContentComponent({
    Key? key,
    required this.videoInfo,
  }) : super(key: key);
  final VideoInfoDetailsModel videoInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 27),
          const Text(
            'Genres',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          if (videoInfo.genres.isNotEmpty)
            Wrap(
              spacing: 5,
              children: List.generate(
                videoInfo.genres.take(5).length,
                (index) => _GenericTag(
                  text: videoInfo.genres[index].name,
                  backgroundColor: colors[index],
                ),
              ),
            ),
          const SizedBox(height: 22),
          Container(
            height: 1,
            color: const Color(0xffF2F2F2),
          ),
          const SizedBox(height: 15),
          const Text(
            'Overview',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            videoInfo.overview
                .split(' ')
                .map((e) => e.capitalizeFirst)
                .toList()
                .join(' '),
            style: const TextStyle(
              fontSize: 12,
              color: captionTextColor,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class _GenericTag extends StatelessWidget {
  const _GenericTag({
    Key? key,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
