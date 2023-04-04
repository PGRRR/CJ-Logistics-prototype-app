import 'package:cj_app/screens/camera_screen.dart';
import 'package:cj_app/screens/home_screen.dart';
import 'package:cj_app/screens/news_screen.dart';
import 'package:cj_app/screens/shorts_screen.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MainScreen extends StatefulWidget {
  final int selectedIndex;
  int? shortsIndex;
  MainScreen({super.key, required this.selectedIndex, this.shortsIndex});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late int? shortsIndex;
  final constants = Constants();
  late final List<StatefulWidget> screens;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex; // 초기값 설정
    shortsIndex = widget.shortsIndex ?? 0;
    screens = [
      const HomeScreen(),
      ShortsScreen(
        shortsIndex: shortsIndex,
      ),
      const CameraScreen(),
      const NewsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _selectedIndex == 1
          ? null
          : AppBar(
              title: Image.asset(
                'assets/images/cj_logo_kor.png',
                width: 209.6,
                height: 47,
              ),
              centerTitle: true,
              backgroundColor: constants.kCjWhite,
              elevation: 0,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person_outline,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ],
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
              size: 35,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_library_outlined,
              size: 35,
            ),
            label: 'SHORTS',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_outlined,
              size: 35,
            ),
            label: 'CAMERA',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.language_sharp,
              size: 35,
            ),
            label: 'NEWS',
          ),
        ],
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
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
