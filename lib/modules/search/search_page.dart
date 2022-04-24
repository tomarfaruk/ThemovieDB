import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app_route.dart';
import 'package:movie_app/modules/search/contorller/search_controller.dart';
import 'package:movie_app/utils/k_colors.dart';

import 'component/search_result_list_component.dart';

final _borderRadius = BorderRadius.circular(10);
var inputDecorationTheme = InputDecoration(
  isDense: true,
  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  hintStyle: const TextStyle(fontSize: 18, height: 1.667),
  border: OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: const BorderSide(color: Colors.white),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: const BorderSide(color: Colors.white),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: const BorderSide(color: Colors.white),
  ),
  fillColor: const Color(0xffF2F2F6),
  filled: true,
  focusColor: primaryColor,
);

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = Get.put(SearchController());
  Timer? _dbouncer;

  @override
  void dispose() {
    _dbouncer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        toolbarHeight: kToolbarHeight + 20,
        title: TextFormField(
          controller: searchController.searchEditController,
          autofocus: true,
          onFieldSubmitted: (String v) {
            if (v.isEmpty) return;
            searchController.search();
            Get.toNamed(AppRoutes.searchResultViewPage);
          },
          onChanged: (String v) {
            if (v.isEmpty) return;

            if (_dbouncer?.isActive ?? false) _dbouncer?.cancel();
            _dbouncer = Timer(const Duration(milliseconds: 700), () {
              searchController.search();
            });
          },
          decoration: inputDecorationTheme.copyWith(
            fillColor: const Color(0xffF2F2F6),
            suffixIcon: InkWell(
              onTap: () {
                searchController.searchEditController.clear();
                searchController.searVideos.clear();
              },
              child: const Icon(Icons.close),
            ),
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
      body: Obx(() {
        return _buildBody();
      }),
    );
  }

  Widget _buildBody() {
    if (searchController.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text(
            'Top Results',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10),
          Container(height: 1, color: Colors.black12),
          const SizedBox(height: 10),
          SearchResutlListComponent(videoList: searchController.searVideos),
        ],
      ),
    );
  }
}
