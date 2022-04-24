import 'package:flutter/material.dart';
import 'package:movie_app/utils/k_colors.dart';
import 'package:movie_app/utils/k_images.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/widget/custom_image.dart';

class SingleHallSeatImage extends StatelessWidget {
  const SingleHallSeatImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: width * .67,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 5),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: lightBlueColor),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: const Center(
                child: CustomImage(
                  path: Kimages.hallSeatImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text.rich(
            TextSpan(
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              children: [
                const TextSpan(
                  text: 'From ',
                  style: TextStyle(
                      color: captionTextColor, fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: Utils.formatPrice(20),
                ),
                const TextSpan(
                  text: ' or ',
                  style: TextStyle(
                      color: captionTextColor, fontWeight: FontWeight.w500),
                ),
                const TextSpan(
                  text: '2550 bonus',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: const [
        Text(
          '12:30',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        SizedBox(width: 10),
        Text(
          'Cinetech + hall 1',
          style: TextStyle(
            fontSize: 12,
            color: captionTextColor,
          ),
        ),
      ],
    );
  }
}
