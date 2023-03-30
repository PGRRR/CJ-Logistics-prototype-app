import 'package:cj_app/widgets/video_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cjRed = const Color(0XFFEF151E);
  final cjYellow = const Color(0XFFFF9700);
  final cjBlue = const Color(0XFF006ECD);
  final cjBlack = const Color(0XFF000000);
  final cjWhite = const Color(0XFFFFFFFF);
  final cjGray = const Color(0XFF97999b);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/cj_lh.png',
          width: 153.3,
          height: 62.6,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            video_card(
              bgColor: const Color(0XFF0F0F0F),
              textColor: cjWhite,
              thumbUrl: 'assets/images/cj_thumb_1.png',
            ),
            video_card(
              bgColor: const Color(0XFF0F0F0F),
              textColor: cjWhite,
              thumbUrl: 'assets/images/cj_thumb_2.png',
            ),
            video_card(
              bgColor: cjBlack,
              textColor: cjWhite,
              thumbUrl: 'assets/images/cj_thumb_3.png',
            ),
            video_card(
              bgColor: const Color(0XFF0F0F0F),
              textColor: cjWhite,
              thumbUrl: 'assets/images/cj_thumb_4.png',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.video_file_outlined), label: '소개 영상'),
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '기본 홈'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
        ],
      ),
    );
  }
}
