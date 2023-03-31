import 'package:cj_app/screens/list_screen.dart';
import 'package:cj_app/screens/user_screen.dart';
import 'package:cj_app/screens/video_screen.dart';
import 'package:cj_app/widgets/video_player_app.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final constants = Constants();
  final screens = [
    const VideoScreen(),
    VideoPlayerApp(),
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
            icon: Icon(Icons.video_file_outlined),
            label: '소개 영상',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: '리스트',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_outlined),
            label: '유저',
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
