import 'package:flutter/material.dart';

import 'single_hall_seat_component.dart';

class HallSeatComponent extends StatelessWidget {
  const HallSeatComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          return const SingleHallSeatImage();
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
