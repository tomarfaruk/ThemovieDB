import 'package:flutter/material.dart';

class SeatArrange extends StatelessWidget {
  const SeatArrange({
    Key? key,
    required this.width,
  }) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    final w = (width - 20) / 30;
    return Column(
      children: List.generate(
        10,
        (index) => _BuildSeatRow(i: index, w: w),
      ),
    );
  }
}

class _BuildSeatRow extends StatelessWidget {
  const _BuildSeatRow({
    Key? key,
    required this.i,
    required this.w,
  }) : super(key: key);
  final int i;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        27,
        (index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                '${i + 1}',
                style: const TextStyle(fontSize: 12),
              ),
            );
          }
          if (index == 6) {
            return Container(
              height: 7,
              width: w,
              margin: const EdgeInsets.all(2.3),
              color: Colors.transparent,
            );
          }
          if (index == 21) {
            return Container(
              height: 7,
              width: w,
              margin: const EdgeInsets.all(2.3),
              color: Colors.transparent,
            );
          }
          return Container(
            height: 7,
            width: 7,
            margin: const EdgeInsets.all(2.3),
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
