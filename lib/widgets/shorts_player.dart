import 'dart:async';

import 'package:cj_app/widgets/tag.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortsPlayer extends StatefulWidget {
  final String videoAssetPath, uploadId, uploadEmail, videoDesc, videoComment;
  final int videoLike;
  final List<String> tagList;

  const ShortsPlayer(
      {Key? key,
      required this.videoAssetPath,
      required this.uploadId,
      required this.uploadEmail,
      required this.videoDesc,
      required this.videoLike,
      required this.videoComment,
      required this.tagList})
      : super(key: key);

  @override
  State<ShortsPlayer> createState() => _ShortsPlayerState();
}

class _ShortsPlayerState extends State<ShortsPlayer> {
  late Color playBtnC = Colors.transparent;
  late Color playBtnBgc = Colors.transparent;
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late int videoLike;
  bool _isFavClicked = false;
  bool _isBookClicked = false;

  @override
  void initState() {
    super.initState();
    // VideoPlayerController를 저장하기 위한 변수를 만듭니다. VideoPlayerController는
    // asset, 파일, 인터넷 등의 영상들을 제어하기 위해 다양한 생성자를 제공합니다.
    // _controller = VideoPlayerController.network(
    //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    // );
    _controller = VideoPlayerController.asset(
      ('assets/videos/${widget.videoAssetPath}'),
    );

    // 컨트롤러를 초기화하고 추후 사용하기 위해 Future를 변수에 할당합니다.
    _initializeVideoPlayerFuture = _controller.initialize();

    // 비디오를 반복 재생하기 위해 컨트롤러를 사용합니다.
    _controller.setLooping(true);

    _controller.play();
    playBtnC = Colors.transparent;
    playBtnBgc = Colors.transparent;
    videoLike = widget.videoLike;
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
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 15, bottom: 10, left: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white,
                                      width: 3,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside),
                                ),
                                width: 60,
                                height: 60,
                                clipBehavior: Clip.hardEdge,
                                child: Image.asset(
                                  'assets/images/cj_splash_logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.uploadId} 님',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.uploadEmail,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              for (var tag in widget.tagList)
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Tag(
                                    tag: tag,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              widget.videoDesc,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              _isFavClicked = !_isFavClicked;
                              if (_isFavClicked) {
                                videoLike += 1;
                              } else {
                                videoLike += -1;
                              }
                            });
                          },
                          icon: _isFavClicked
                              ? Icon(
                                  Icons.favorite,
                                  size: 35,
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  size: 35,
                                  color: Colors.white,
                                ),
                        ),
                        Text(
                          '$videoLike',
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
                          widget.videoComment,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              _isBookClicked = !_isBookClicked;
                            });
                          },
                          icon: _isBookClicked
                              ? Icon(
                                  Icons.bookmark,
                                  size: 35,
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              : const Icon(
                                  Icons.bookmark_border,
                                  size: 35,
                                  color: Colors.white,
                                ),
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
          ),
        ],
      ),
    );
  }
}
