import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cj_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class NewRecordScreen extends StatefulWidget {
  const NewRecordScreen({super.key});

  @override
  State<NewRecordScreen> createState() => _NewRecordScreenState();
}

class _NewRecordScreenState extends State<NewRecordScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool isFrontCamera = false;
  bool _isRecording = false;
  int seconds = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );
    await _controller.initialize();
    _controller.setFlashMode(FlashMode.off);
  }

  @override
  void dispose() {
    _controller.dispose();
    if (!_isRecording) {
      onStartTimer();
    }
    timer.cancel();
    super.dispose();
  }

  void onCameraSwitch() async {
    // 이전 캡처가 완료될 때까지 대기
    if (_controller.value.isTakingPicture) {
      return;
    }

    final cameras = await availableCameras();
    setState(() {
      isFrontCamera = !isFrontCamera;
      _controller = CameraController(
        isFrontCamera ? cameras.last : cameras.first,
        ResolutionPreset.medium,
      );
      _initializeControllerFuture = _controller.initialize();
    });
  }

  Future<void> _toggleRecording() async {
    if (!_isRecording) {
      // 동영상 모드로 전환
      await _controller.prepareForVideoRecording();

      // 동영상 촬영 시작
      await _controller.startVideoRecording();
    } else {
      // 동영상 촬영 중지
      await _controller.stopVideoRecording();
    }

    // 동영상 촬영 상태 변경
    setState(() {
      _isRecording = !_isRecording;
    });
  }

  void onTick(Timer timer) {
    setState(() {
      seconds = seconds + 1;
    });
  }

  void onStartTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(
              selectedIndex: 0,
            ),
          ),
        );
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // Future가 완료되면, 프리뷰를 보여줍니다.
                  return CameraPreview(_controller);
                } else {
                  // Otherwise, display a loading indicator.
                  // 그렇지 않다면, 진행 표시기를 보여줍니다.
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            Center(
              child: Text(
                '$seconds',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(
                      selectedIndex: 2,
                      isRecordCamera: false,
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.camera_alt_outlined,
                size: 100,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: () async {
            var video;
            try {
              // 카메라 초기화가 완료됐는지 확인합니다.
              await _initializeControllerFuture;

              if (!_isRecording) {
                // 동영상 모드로 전환
                await _controller.prepareForVideoRecording();

                // 동영상 촬영 시작
                await _controller.startVideoRecording();
                onStartTimer();
              } else {
                timer.cancel();
                seconds = 0;
                // 동영상 촬영 중지
                final video = await _controller.stopVideoRecording();
                final directory = await getApplicationDocumentsDirectory();
                final videoPath = '${directory.path}/${DateTime.now()}.mp4';
                final imageFile = File(videoPath);
                await imageFile
                    .writeAsBytes(File(video.path).readAsBytesSync());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DisplayPictureScreen(videoPath: videoPath),
                  ),
                );
              }

              // 동영상 촬영 상태 변경
              setState(() {
                _isRecording = !_isRecording;
              });
            } catch (e) {
              print(e);
            }
          },
        ),
      ),
    );
  }
}

class DisplayPictureScreen extends StatefulWidget {
  final String videoPath;

  const DisplayPictureScreen({super.key, required this.videoPath});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  late VideoPlayerController _controller;

  late Future<void> _initializeVideoPlayerFuture;
  late Color playBtnC = Colors.transparent;
  late Color playBtnBgc = Colors.transparent;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(
      (File(widget.videoPath)),
    );

    // 컨트롤러를 초기화하고 추후 사용하기 위해 Future를 변수에 할당합니다.
    _initializeVideoPlayerFuture = _controller.initialize();

    // 비디오를 반복 재생하기 위해 컨트롤러를 사용합니다.
    _controller.setLooping(true);

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
      appBar: AppBar(title: Text('Display the Picture')),
      body: GestureDetector(
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
    );
  }
}
