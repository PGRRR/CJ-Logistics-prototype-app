import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/video_card.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final constants = Constants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            video_card(
              bgColor: constants.kYtGray,
              textColor: constants.kCjWhite,
              thumbUrl: 'assets/images/cj_thumb_1.png',
            ),
            video_card(
              bgColor: constants.kYtGray,
              textColor: constants.kCjWhite,
              thumbUrl: 'assets/images/cj_thumb_2.png',
            ),
            video_card(
              bgColor: constants.kYtGray,
              textColor: constants.kCjWhite,
              thumbUrl: 'assets/images/cj_thumb_3.png',
            ),
            video_card(
              bgColor: constants.kYtGray,
              textColor: constants.kCjWhite,
              thumbUrl: 'assets/images/cj_thumb_4.png',
            ),
          ],
        ),
      ),
    );
  }
}
