import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/movieDetails/controller/movie_details_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchMovieTrailorScreen extends StatefulWidget {
  const WatchMovieTrailorScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WatchMovieTrailorScreen> createState() =>
      _WatchMovieTrailorScreenState();
}

class _WatchMovieTrailorScreenState extends State<WatchMovieTrailorScreen> {
  late YoutubePlayerController _controller;

  bool isVideoFinished = false;

  final _movieDetailsController = Get.find<MovieDetailsController>();

  @override
  void initState() {
    super.initState();
    final videoEntityModel =
        _movieDetailsController.videoEntityModelResponse.value!.results.first;

    _controller = YoutubePlayerController(
      initialVideoId: videoEntityModel.key,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    _controller.addListener(_listener);

    _controller.toggleFullScreenMode();
  }

  void _listener() {
    if (_controller.value.playerState == PlayerState.ended) {
      Get.back();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
          ),
          builder: (context, player) {
            return Column(
              children: [
                player,
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Done"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
