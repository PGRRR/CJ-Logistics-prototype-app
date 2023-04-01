import 'package:cj_app/screens/camera_screen.dart';
import 'package:cj_app/screens/home_screen.dart';
import 'package:cj_app/screens/news_screen.dart';
import 'package:cj_app/screens/shorts_screen.dart';
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
  final List<StatefulWidget> screens = [
    HomeScreen(),
    const ShortsScreen(),
    const CameraScreen(),
    const NewsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/cj_logo_kor.png',
          width: 209.6,
          height: 47,
        ),
        backgroundColor: constants.kCjWhite,
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: constants.kCjWhite,
        selectedItemColor: constants.kCjBlue,
        unselectedItemColor: constants.kCjBlack,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 45,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_library_outlined,
              size: 45,
            ),
            label: 'SHORTS',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_outlined,
              size: 45,
            ),
            label: 'CAMERA',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.language_sharp,
              size: 45,
            ),
            label: 'NEWS',
          ),
        ],
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
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
