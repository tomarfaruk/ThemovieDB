import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/app_route.dart';
import 'package:movie_app/modules/movieDetails/controller/movie_details_controller.dart';
import 'package:movie_app/utils/k_images.dart';
import 'package:movie_app/utils/rest_api.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/widget/custom_icon_button.dart';
import 'package:movie_app/widget/custom_image.dart';

import 'component/error_view.dart';
import 'component/movie_content_component.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final _movieDetailsController = Get.put(MovieDetailsController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() {
        return _movieDetailsController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _buildBody(context, size);
      }),
    );
  }

  Widget _buildBody(BuildContext context, Size size) {
    final videoInfo = _movieDetailsController.movieDetaislModel.value;
    if (videoInfo == null) {
      return ErrorView(
        message: "Can't load movie info",
        onPressed: () {
          _movieDetailsController.loadMovieDetails();
        },
      );
    }
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // automaticallyImplyLeading: false,

          title: Row(
            children: const [
              Text(
                'Watch',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          expandedHeight: size.height * 0.6,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: '_result.title!',
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CustomImage(
                    path: RestApi.getImageUrl(videoInfo.posterPath),
                    fit: BoxFit.cover,
                    width: size.width,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          const Color(0xff000000).withOpacity(0.9),
                          const Color(0xff000000).withOpacity(0.0),
                        ],
                        stops: const [
                          0.0,
                          0.9,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 34,
                    left: 66,
                    right: 66,
                    child: Column(
                      children: [
                        const CustomImage(path: Kimages.kingManLogo),
                        const SizedBox(height: 6),
                        Text(
                          'In theaters ${Utils.formatDate(videoInfo.releaseDate)}',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.ticketPage);
                          },
                          child: const Text(
                            'Get Tickets',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Obx(() {
                          if (_movieDetailsController
                                      .videoEntityModelResponse.value !=
                                  null &&
                              _movieDetailsController.isLoadingVodeos.value ==
                                  false) {
                            return CustomIconButton(
                                onTap: () {
                                  Get.toNamed(
                                      AppRoutes.watchMovieTrailorScreen);
                                },
                                icon: Icons.play_arrow,
                                text: 'Watch Trailer');
                          }
                          return const SizedBox();
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: MovieContentComponent(videoInfo: videoInfo)),
      ],
    );
  }
}
