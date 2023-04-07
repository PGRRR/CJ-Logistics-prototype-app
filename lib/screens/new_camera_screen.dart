import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cj_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class NewCameraScreen extends StatefulWidget {
  const NewCameraScreen({super.key});

  @override
  State<NewCameraScreen> createState() => _NewCameraScreenState();
}

class _NewCameraScreenState extends State<NewCameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool isFrontCamera = false;
  bool _isFlashOn = false;

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
    super.dispose();
  }

  void onCameraSwitch() async {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            '사진',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.primary),
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
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(
                                    selectedIndex: 2,
                                    isRecordCamera: true,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              '동영상',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            width: 60,
                            height: 5,
                          ),
                        ),
                      ],
                    ),
                  ],
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
                        height: MediaQuery.of(context).size.height * 0.35,
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
                                size: 35,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: Icon(
                                Icons.settings_outlined,
                                size: 35,
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
                                size: 35,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
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
                      try {
                        await _initializeControllerFuture;

                        final image = await _controller.takePicture();

                        final directory =
                            await getApplicationDocumentsDirectory();
                        final imagePath =
                            '${directory.path}/${DateTime.now()}.jpg';
                        final imageFile = File(imagePath);
                        await imageFile
                            .writeAsBytes(File(image.path).readAsBytesSync());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DisplayPictureScreen(
                                imagePath: imagePath, image: image),
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
                                    strokeAlign: BorderSide.strokeAlignOutside,
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
          ],
        ),
      ),
    );
  }
}

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  final XFile image;

  const DisplayPictureScreen(
      {super.key, required this.imagePath, required this.image});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
              child: Image.file(
                File(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      textDialog('저장되었습니다.');
                    },
                    icon: const Icon(
                      Icons.file_download_outlined,
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
