import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isFlashOn = false;
  bool isFrontCamera = false;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.medium);
    await _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onCameraSwitch() async {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform.translate(
                    offset: const Offset(0, 100),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.height *
                                      0.025),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '사진',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      width: 60,
                                      height: 5,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: MediaQuery.of(context).size.height *
                                      0.025),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '동영상',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                        ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                      ),
                                      width: 60,
                                      height: 5,
                                    ),
                                  )
                                ],
                              ),
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
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                clipBehavior: Clip.hardEdge,
                child: FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CameraPreview(_controller);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () async {
                        try {
                          await _initializeControllerFuture;
                          final path = join(
                            (await getTemporaryDirectory()).path,
                            '${DateTime.now()}.png',
                          );
                          await _controller.takePicture();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DisplayPictureScreen(imagePath: path),
                            ),
                          );
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Center(
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.circle,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, 10),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.5),
                                      width: 2,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.circle,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                            vertical: 30, horizontal: 15),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
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
                                  size: 45,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.settings_outlined,
                                  size: 45,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  onCameraSwitch();
                                },
                                icon: Icon(
                                  Icons.flip_camera_android,
                                  size: 45,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),

      // Stack(
      //   children: [
      //     FutureBuilder<void>(
      //       future: _initializeControllerFuture,
      //       builder: (context, snapshot) {
      //         if (snapshot.connectionState == ConnectionState.done) {
      //           return CameraPreview(_controller);
      //         } else {
      //           return const Center(child: CircularProgressIndicator());
      //         }
      //       },
      //     ),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         GestureDetector(
      //           onTap: () async {
      //             try {
      //               await _initializeControllerFuture;
      //               final path = join(
      //                 (await getTemporaryDirectory()).path,
      //                 '${DateTime.now()}.png',
      //               );
      //               await _controller.takePicture();
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) =>
      //                       DisplayPictureScreen(imagePath: path),
      //                 ),
      //               );
      //             } catch (e) {
      //               print(e);
      //             }
      //           },
      //           child: Center(
      //             child: Stack(
      //               children: [
      //                 Center(
      //                   child: Container(
      //                     decoration: BoxDecoration(
      //                       color: Colors.white,
      //                       shape: BoxShape.circle,
      //                       boxShadow: [
      //                         BoxShadow(
      //                           color: Colors.grey.withOpacity(0.5),
      //                           spreadRadius: 5,
      //                           blurRadius: 7,
      //                           offset: const Offset(0, 3),
      //                         ),
      //                       ],
      //                     ),
      //                     child: const Icon(
      //                       Icons.circle,
      //                       size: 80,
      //                       color: Colors.white,
      //                     ),
      //                   ),
      //                 ),
      //                 Center(
      //                   child: Container(
      //                     decoration: BoxDecoration(
      //                       color: Colors.white,
      //                       shape: BoxShape.circle,
      //                       border: Border.all(
      //                         color: Colors.black.withOpacity(0.5),
      //                         width: 2,
      //                         strokeAlign: BorderSide.strokeAlignOutside,
      //                       ),
      //                       boxShadow: [
      //                         BoxShadow(
      //                           color: Colors.grey.withOpacity(0.5),
      //                           spreadRadius: 5,
      //                           blurRadius: 7,
      //                           offset: const Offset(0, 3),
      //                         ),
      //                       ],
      //                     ),
      //                     child: const Icon(
      //                       Icons.circle,
      //                       size: 60,
      //                       color: Colors.white,
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.camera_alt),
      //   // onPressed 콜백을 제공합니다.
      //   onPressed: () async {
      //     // try / catch 블럭에서 사진을 촬영합니다. 만약 뭔가 잘못된다면 에러에
      //     // 대응할 수 있습니다.
      //     try {
      //       // 카메라 초기화가 완료됐는지 확인합니다.
      //       await _initializeControllerFuture;

      //       // path 패키지를 사용하여 이미지가 저장될 경로를 지정합니다.
      //       final path = join(
      //         // 본 예제에서는 임시 디렉토리에 이미지를 저장합니다. `path_provider`
      //         // 플러그인을 사용하여 임시 디렉토리를 찾으세요.
      //         (await getTemporaryDirectory()).path,
      //         '${DateTime.now()}.png',
      //       );

      //       // 사진 촬영을 시도하고 저장되는 경로를 로그로 남깁니다.
      //       await _controller.takePicture();

      //       // 사진을 촬영하면, 새로운 화면으로 넘어갑니다.
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => DisplayPictureScreen(imagePath: path),
      //         ),
      //       );
      //     } catch (e) {
      //       // 만약 에러가 발생하면, 콘솔에 에러 로그를 남깁니다.
      //       print(e);
      //     }
      //   },
      // ),
      // ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // 이미지는 디바이스에 파일로 저장됩니다. 이미지를 보여주기 위해 주어진
      // 경로로 `Image.file`을 생성하세요.
      body: Image.file(File(imagePath)),
    );
  }
}
