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
      uploadId: '아이디1',
      uploadEmail: 'email1@cj.net',
      videoDesc: 'CJ대한통운 LOIS 포워더스 한 눈에 알아보기\n\n\n\n\n\n\n\n\nasdasd',
      videoLike: '10',
      videoComment: '10',
      tagList: ['콘크리트', '건물', '해시태그'],
    ),
    const ShortsPlayer(
      videoAssetPath: 'shorts_2.mp4',
      uploadId: '아이디2',
      uploadEmail: 'email2@cj.net',
      videoDesc: 'CJ대한통운 LOIS 포워더스 한 눈에 알아보기',
      videoLike: '10',
      videoComment: '10',
      tagList: ['콘크리트', '건물', '해시태그'],
    ),
    const ShortsPlayer(
      videoAssetPath: 'shorts_3.mp4',
      uploadId: '아이디3',
      uploadEmail: 'email3@cj.net',
      videoDesc: 'CJ대한통운 LOIS 포워더스 한 눈에 알아보기',
      videoLike: '10',
      videoComment: '10',
      tagList: ['콘크리트', '건물', '해시태그'],
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
