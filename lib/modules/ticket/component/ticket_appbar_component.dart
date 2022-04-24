import 'package:flutter/material.dart';
import 'package:movie_app/utils/k_colors.dart';

class TicketAppBar extends StatelessWidget {
  const TicketAppBar({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subTitle,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: lightBlueColor,
            ),
          ),
        ],
      ),
    );
  }
}
