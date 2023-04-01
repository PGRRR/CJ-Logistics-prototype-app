import 'package:cj_app/widgets/video_player_app.dart';
import 'package:flutter/material.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  late PageController _pageController;

  final List<Widget> pages = [
    const VideoPlayerScreen(
      videoAssetPath: 'shorts_1.mp4',
    ),
    const VideoPlayerScreen(
      videoAssetPath: 'shorts_2.mp4',
    ),
    const VideoPlayerScreen(
      videoAssetPath: 'shorts_3.mp4',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      if (_pageController.page == pages.length - 1) {
        _pageController.jumpToPage(0);
      } else if (_pageController.page == 0) {
        _pageController.jumpToPage(pages.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        children: pages,
      ),
    );
  }
}
