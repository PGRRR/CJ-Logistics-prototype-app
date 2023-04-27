import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cj_app/screens/main_screen.dart';
import 'package:cj_app/widgets/camera_side_btn.dart';
import 'package:cj_app/widgets/tag.dart';
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
  bool _isFlashOn = false;
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

    await _initializeControllerFuture;

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

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return '0${duration.toString().split('.').first}';
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
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    clipBehavior: Clip.hardEdge,
                    child: FutureBuilder<void>(
                      future: _initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return CameraPreview(_controller);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: !_isRecording,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: TextButton(
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
                              child: Text(
                                '사진',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                              width: 60,
                              height: 5,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '동영상',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              width: 60,
                              height: 5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 15,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CameraSideBtn(
                              isRecording: _isRecording,
                              icon: Icons.music_note_outlined,
                            ),
                            CameraSideBtn(
                              isRecording: _isRecording,
                              icon: Icons.local_movies_outlined,
                            ),
                            CameraSideBtn(
                              isRecording: _isRecording,
                              icon: Icons.text_fields,
                            ),
                            Visibility(
                              visible: !_isRecording,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    _isFlashOn = !_isFlashOn;
                                    _controller.setFlashMode(
                                      _isFlashOn
                                          ? FlashMode.torch
                                          : FlashMode.off,
                                    );
                                  });
                                },
                                icon: Icon(
                                  _isFlashOn ? Icons.flash_on : Icons.flash_off,
                                  size: 35,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ),
                            CameraSideBtn(
                              isRecording: _isRecording,
                              icon: Icons.settings_outlined,
                            ),
                            Visibility(
                              visible: !_isRecording,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  onCameraSwitch();
                                },
                                icon: Icon(
                                  Icons.flip_camera_android,
                                  size: 35,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              width: 50,
                              height: 50,
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset(
                                'assets/images/cj_splash_logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 130),
                  child: GestureDetector(
                    onTap: () async {
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
                          final directory =
                              await getApplicationDocumentsDirectory();
                          final videoPath =
                              '${directory.path}/${DateTime.now()}.mp4';
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

                        setState(() {
                          _isRecording = !_isRecording;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Center(
                      child: Stack(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 10),
                            child: const Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 100,
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(28, 37),
                            child: Icon(
                              _isRecording
                                  ? Icons.square_rounded
                                  : Icons.circle,
                              color: _isRecording
                                  ? Colors.black.withOpacity(0.8)
                                  : Colors.red,
                              size: 45,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Center(
                    //   child: Stack(
                    //     children: [
                    //       Center(
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             color: Colors.red,
                    //             shape: BoxShape.circle,
                    //             boxShadow: [
                    //               BoxShadow(
                    //                 color: Colors.grey.withOpacity(0.5),
                    //                 spreadRadius: 5,
                    //                 blurRadius: 7,
                    //                 offset: const Offset(0, 3),
                    //               ),
                    //             ],
                    //           ),
                    //           child: const Icon(
                    //             Icons.circle,
                    //             size: 80,
                    //             color: Colors.red,
                    //           ),
                    //         ),
                    //       ),
                    //       Transform.translate(
                    //         offset: const Offset(0, 10),
                    //         child: Center(
                    //           child: _isRecording
                    //               ? Transform.translate(
                    //                 offset:Offset(0, 5) ,
                    //                 child: Icon(
                    //                     Icons.square,
                    //                     size: 50,
                    //                   ),
                    //               )
                    //               : Container(
                    //                   decoration: BoxDecoration(
                    //                     color: Colors.red,
                    //                     shape: BoxShape.circle,
                    //                     border: Border.all(
                    //                       color: Colors.black.withOpacity(0.5),
                    //                       width: 2,
                    //                       strokeAlign:
                    //                           BorderSide.strokeAlignOutside,
                    //                     ),
                    //                     boxShadow: [
                    //                       BoxShadow(
                    //                         color: Colors.grey.withOpacity(0.5),
                    //                         spreadRadius: 5,
                    //                         blurRadius: 7,
                    //                         offset: const Offset(0, 3),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                   child: const Icon(
                    //                     Icons.circle,
                    //                     size: 60,
                    //                     color: Colors.red,
                    //                   ),
                    //                 ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: _isRecording,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        format(seconds),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
  final TextEditingController _textController = TextEditingController();

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
    _textController.dispose();

    super.dispose();
  }

  void textDialog(String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.black,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          '확인',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void twoButtonDialog({
    required String text,
    btnTxt1,
    btnTxt2,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.black,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.primary),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            deleteDialog('삭제되었습니다.');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              btnTxt1,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.primary),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              btnTxt2,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void deleteDialog(String text) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SimpleDialog(
            backgroundColor: Colors.black,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.primary),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            '확인',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
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

  void _showUploadModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        twoButtonDialog(
                          text: '삭제하시겠습니까?',
                          btnTxt1: '삭제',
                          btnTxt2: '취소',
                        );
                      },
                      icon: const Icon(Icons.close),
                    ),
                    Text(
                      'CLIP 업로드',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        textDialog('업로드가 완료되었습니다.');
                      },
                      child: const Text(
                        '공유',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    '내용 입력하기',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: '내용을 입력하세요.',
                    contentPadding: EdgeInsets.only(
                      bottom: 50,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  textInputAction: TextInputAction.newline,
                  maxLines: null,
                  maxLength: 150,
                  onChanged: (value) => {},
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    '태그 설정하기',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Tag(
                        tag: '공사',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Tag(
                        tag: '안전',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Tag(
                        tag: '전기',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Tag(
                        tag: '설비',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Tag(
                        tag: '공무',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 35,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              clipBehavior: Clip.hardEdge,
              child: GestureDetector(
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
                          return const Center(
                              child: CircularProgressIndicator());
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 30,
                                horizontal: 15,
                              ),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    CameraSideBtn(
                                      isRecording: false,
                                      icon: Icons.music_note_outlined,
                                    ),
                                    CameraSideBtn(
                                      isRecording: false,
                                      icon: Icons.local_movies_outlined,
                                    ),
                                    CameraSideBtn(
                                      isRecording: false,
                                      icon: Icons.text_fields,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      _showUploadModal(context);
                    },
                    icon: const Icon(
                      Icons.file_upload_outlined,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      textDialog('cjenc@cj.net\n전송 완료');
                    },
                    icon: const Icon(
                      Icons.send,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
