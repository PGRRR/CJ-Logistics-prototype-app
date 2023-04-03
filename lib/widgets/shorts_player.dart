import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortsPlayer extends StatefulWidget {
  final String videoAssetPath;

  const ShortsPlayer({Key? key, required this.videoAssetPath})
      : super(key: key);

  @override
  _ShortsPlayerState createState() =>
      _ShortsPlayerState(videoAssetPath);
}

class _ShortsPlayerState extends State<ShortsPlayer> {
  final String videoAssetPath;
  late Color playBtnC = Colors.transparent;
  late Color playBtnBgc = Colors.transparent;
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  _ShortsPlayerState(this.videoAssetPath);

  @override
  void initState() {
    // VideoPlayerController를 저장하기 위한 변수를 만듭니다. VideoPlayerController는
    // asset, 파일, 인터넷 등의 영상들을 제어하기 위해 다양한 생성자를 제공합니다.
    // _controller = VideoPlayerController.network(
    //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    // );
    _controller = VideoPlayerController.asset(
      ('assets/videos/$videoAssetPath'),
    );

    // 컨트롤러를 초기화하고 추후 사용하기 위해 Future를 변수에 할당합니다.
    _initializeVideoPlayerFuture = _controller.initialize();

    // 비디오를 반복 재생하기 위해 컨트롤러를 사용합니다.
    _controller.setLooping(true);

    super.initState();
    _controller.play();
    playBtnC = Colors.transparent;
    playBtnBgc = Colors.transparent;
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
        playBtnC = Colors.white;
        playBtnBgc = Colors.black.withOpacity(0.6);
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
      body: Stack(
        children: [
          GestureDetector(
            onTap: _togglePlayPause,
            child: Stack(
              alignment: Alignment.center,
              children: [
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Center(
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                if (!_controller.value.isPlaying)
                  Stack(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 100,
                        color: playBtnBgc,
                      ),
                      Positioned(
                        right: 25,
                        bottom: 25,
                        child: Icon(
                          Icons.play_arrow,
                          size: 50,
                          color: playBtnC,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.3)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.supervised_user_circle,
                              size: 70,
                              color: Colors.white,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '아이디 님',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'email@cj.net',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade600),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                child: Text(
                                  '#콘크리트',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade600),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                child: Text(
                                  '#콘크리트',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade600),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                child: Text(
                                  '#콘크리트',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'CJ대한통운 LoIS 포워더스 한 눈에 알아보기\n빠른 자동 견적 확인부터\n쉬운 운송 관리 화면, 실시간 알림 서비스까지\n복잡하고 어려운 국제물류도 CJ대한통운과 함께!',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          size: 35,
                          color: Colors.white,
                        ),
                        Text(
                          '#',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Icon(
                          Icons.insert_comment_outlined,
                          size: 35,
                          color: Colors.white,
                        ),
                        Text(
                          '#',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Icon(
                          Icons.bookmark_border,
                          size: 35,
                          color: Colors.white,
                        ),
                        Text(
                          '#',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
