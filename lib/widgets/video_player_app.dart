import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoAssetPath;
  final VoidCallback? onVideoEnd;
  const VideoPlayerScreen(
      {Key? key, required this.videoAssetPath, this.onVideoEnd})
      : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller =
        VideoPlayerController.asset('assets/videos/${widget.videoAssetPath}')
          ..initialize().then((_) {
            setState(() {});
            _controller.play();
          });
    _controller.addListener(() {
      if (_controller.value.isPlaying == false && widget.onVideoEnd != null) {
        widget.onVideoEnd!();
      }
    });

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(false);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: _togglePlayPause,
          child: Stack(
            alignment: Alignment.center,
            children: [
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // _controller.play();
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              if (!_controller.value.isPlaying)
                const Icon(Icons.play_arrow, size: 50),
            ],
          ),
        ),
      ),
    );
  }
}
