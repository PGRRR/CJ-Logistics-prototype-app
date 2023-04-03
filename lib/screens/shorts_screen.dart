import 'package:cj_app/widgets/shorts_player.dart';
import 'package:flutter/material.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({Key? key}) : super(key: key);

  @override
  State createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  final PageController _pageController = PageController();

  final List<Widget> pages = [
    const ShortsPlayer(
      videoAssetPath: 'shorts_1.mp4',
    ),
    const ShortsPlayer(
      videoAssetPath: 'shorts_2.mp4',
    ),
    const ShortsPlayer(
      videoAssetPath: 'shorts_3.mp4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        clipBehavior: Clip.hardEdge,
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          children: pages,
        ),
      ),
    );
  }
}
