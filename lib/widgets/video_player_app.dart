import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // VideoPlayerController를 저장하기 위한 변수를 만듭니다. VideoPlayerController는
    // asset, 파일, 인터넷 등의 영상들을 제어하기 위해 다양한 생성자를 제공합니다.
    // _controller = VideoPlayerController.network(
    //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    // );
    _controller = VideoPlayerController.asset(
      ('assets/videos/cj_video_3.mp4'),
    );

    // 컨트롤러를 초기화하고 추후 사용하기 위해 Future를 변수에 할당합니다.
    _initializeVideoPlayerFuture = _controller.initialize();

    // 비디오를 반복 재생하기 위해 컨트롤러를 사용합니다.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // 자원을 반환하기 위해 VideoPlayerController를 dispose 시키세요.
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
      backgroundColor: Colors.black.withOpacity(0),
      body: GestureDetector(
        onTap: _togglePlayPause,
        child: Stack(
          alignment: Alignment.center,
          children: [
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
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
    );

    //   floatingActionButton: Transform.translate(
    //     offset: const Offset(-150, 150),
    //     child: Column(
    //       children: [
    //         FloatingActionButton(
    //           backgroundColor: Colors.white.withOpacity(0),
    //           onPressed: () {
    //             // 재생/일시 중지 기능을 `setState` 호출로 감쌉니다. 이렇게 함으로써 올바른 아이콘이
    //             // 보여집니다.
    //             setState(() {
    //               // 영상이 재생 중이라면, 일시 중지 시킵니다.
    //               if (_controller.value.isPlaying) {
    //                 _controller.pause();
    //               } else {
    //                 // 만약 영상이 일시 중지 상태였다면, 재생합니다.
    //                 _controller.play();
    //               }
    //             });
    //           },
    //           // 플레이어의 상태에 따라 올바른 아이콘을 보여줍니다.
    //           child: Icon(
    //             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow_rounded,
    //             color: Colors.white,
    //             size: 50,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ), // 이 마지막 콤마는 build 메서드에 자동 서식이 잘 적용될 수 있도록 도와줍니다.
    // );
  }
}
