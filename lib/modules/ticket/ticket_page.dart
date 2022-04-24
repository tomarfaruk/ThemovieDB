import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app_route.dart';

import 'component/date_label_list_component.dart';
import 'component/hall_seat_component.dart';
import 'component/ticket_appbar_component.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 90),
              DateLabelsComponent(),
              SizedBox(height: 40),
              HallSeatComponent(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.ticketDetailsPage);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Select Seats'),
            ),
          ),
        ],
      ),
    );
  }
}
