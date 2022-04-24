import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app_route.dart';
import 'package:movie_app/modules/home/controller/bottom_nav_controller.dart';
import 'package:movie_app/utils/k_images.dart';
import 'package:movie_app/utils/k_strings.dart';
import 'package:movie_app/widget/custom_image.dart';
import 'package:movie_app/widget/custom_navigation_bar.dart';

import 'component/dashboard/dashboard_screen.dart';
import 'component/media_library/media_library_screen.dart';
import 'component/more/more_screen.dart';
import 'component/watch/watch_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final navController = Get.put(BottomNavController());

  final tabScreen = <Widget>[
    const DashBoardScreen(),
    const WatchScreen(),
    const MediaLibraryScreen(),
    const MoreScreen(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0.0,
        title: const Text(
          KStrings.watch,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.searchPage);
            },
            icon: const CustomImage(path: Kimages.searchIcon),
          ),
        ],
      ),
      body: Obx(() {
        return tabScreen[navController.currentIndex.value];
      }),
      bottomNavigationBar: CustomNavigationBar(
        height: 72,
        currentIndex: navController.currentIndex.value,
        onItemSelected: navController.onItemSelected,
      ),
    );
  }
}
