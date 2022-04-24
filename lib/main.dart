import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app_route.dart';
import 'package:movie_app/utils/app_theme.dart';
import 'package:movie_app/utils/k_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: KStrings.appName,
      theme: AppTheme.theme,
      getPages: AppRoutes.getPages,
      unknownRoute:
          GetPage(name: '/notfound', page: () => const UnknownRoutePage()),
    );
  }
}

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UnKnownRoute")),
      body: Center(
        child: Text("This page not define${Get.currentRoute}"),
      ),
    );
  }
}
