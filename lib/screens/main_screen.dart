import 'package:cj_app/screens/camera_screen.dart';
import 'package:cj_app/screens/home_screen.dart';
import 'package:cj_app/screens/news_screen.dart';
import 'package:cj_app/screens/shorts_screen.dart';
import 'package:cj_app/screens/user_screen.dart';
import 'package:cj_app/screens/video_screen.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final constants = Constants();
  final screens = [
    HomeScreen(),
    const ShortsScreen(),
    const CameraScreen(),
    const NewsScreen(),
    const UserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/cj_lh.png',
          width: 153.3,
          height: 62.6,
        ),
        backgroundColor: Colors.blue,
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: constants.kCjWhite,
        selectedItemColor: constants.kCjBlue,
        unselectedItemColor: constants.kCjGray,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '기본 홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: '쇼츠',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: '카메라',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: '뉴스',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_outlined),
            label: '내 정보',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
