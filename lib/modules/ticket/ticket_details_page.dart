import 'package:flutter/material.dart';
import 'package:movie_app/utils/k_colors.dart';
import 'package:movie_app/utils/k_images.dart';
import 'package:movie_app/widget/custom_image.dart';
import 'package:movie_app/widget/ticket_custom_painter.dart';

import 'component/seat_arrenge_component.dart';
import 'component/ticket_appbar_component.dart';

class TicketDetailsPage extends StatefulWidget {
  const TicketDetailsPage({Key? key}) : super(key: key);

  @override
  State<TicketDetailsPage> createState() => _TicketDetailsPageState();
}

class _TicketDetailsPageState extends State<TicketDetailsPage> {
  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF6F6FA),
      appBar: AppBar(
        toolbarHeight: 90,
        iconTheme: const IconThemeData(color: Colors.black),
        flexibleSpace: const FlexibleSpaceBar(
            background: TicketAppBar(
                title: 'The King’s Man',
                subTitle: 'In theaters december 22, 2021')),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 250,
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildInfoItem(
                  text: 'Selected',
                  color: darkYellowColor,
                ),
                _buildInfoItem(
                  text: 'Not available',
                  color: seatColor,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildInfoItem(
                  text: 'VIP (150\$)',
                  color: blueVioletColor,
                ),
                _buildInfoItem(
                  text: 'Regular (50\$)',
                  color: lightBlueColor,
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildSelectedSeat(),
            const Spacer(),
            _buildBottomButton(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: _size.height * 0.06,
              width: _size.width,
              child: CustomPaint(
                painter: TicketCustomPainter(),
                child: const Center(child: Text("Screen")),
              ),
            ),
            const SizedBox(height: 20),
            SeatArrange(width: _size.width),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedSeat() {
    return Container(
      decoration: BoxDecoration(
        color: sliverColor,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: '4/',
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                  ),
                ),
                TextSpan(
                  text: '3 row',
                  style: TextStyle(
                    fontSize: 10,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 17),
          const Icon(Icons.close, size: 14),
        ],
      ),
    );
  }

  Widget _buildInfoItem({required String text, required Color color}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImage(path: Kimages.seatIcon, color: color),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: captionTextColor,
            ),
          )
        ],
      ),
    );
  }

  Row _buildBottomButton() {
    return Row(
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffA6A6A6).withOpacity(.10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Total",
                style: TextStyle(fontSize: 10),
              ),
              Text(
                "\$ 50",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: ElevatedButton(
            onPressed: () {
              // Get.toNamed(AppRoutes.ticketPage);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Select Seats'),
          ),
        ),
      ],
    );
  }
}
