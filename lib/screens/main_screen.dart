import 'package:cj_app/screens/camera_screen.dart';
import 'package:cj_app/screens/home_screen.dart';
import 'package:cj_app/screens/new_camera_screen.dart';
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
      NewCameraScreen(),
      const NewsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _selectedIndex != 0
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
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.person_outline,
                        size: 30,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ],
            ),
      drawer: Drawer(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  margin: const EdgeInsets.only(bottom: 1),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  padding: EdgeInsets.zero,
                  child: const Center(
                    child: Text(
                      'MY PAGE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              UserAccountsDrawerHeader(
                accountName: const Text('아이디 님'),
                accountEmail: const Text('email@cj.net'),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage('assets/images/cj_splash_logo.png'),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.attach_money),
                title: Text('CREDIT'),
                trailing: Text('50,000'),
              ),
              ExpansionTile(
                title: const Text(
                  '기본 설정',
                  style: TextStyle(color: Colors.black),
                ),
                collapsedBackgroundColor: Colors.grey.withOpacity(0.3),
                children: const [
                  ListTile(
                    title: Text('닉네임 변경'),
                  ),
                  ListTile(
                    title: Text('이메일 변경'),
                  ),
                  ListTile(
                    title: Text('비밀번호 변경'),
                  ),
                  ListTile(
                    title: Text('알림 설정'),
                  ),
                ],
              ),
              ListTile(
                title: const Text('스크랩'),
                tileColor: Colors.grey.withOpacity(0.3),
              ),
              ListTile(
                title: const Text('내가 쓴 게시물'),
                tileColor: Colors.grey.withOpacity(0.3),
              ),
              ListTile(
                title: const Text('내가 쓴 댓글'),
                tileColor: Colors.grey.withOpacity(0.3),
              ),
              ListTile(
                title: const Text('문의하기'),
                tileColor: Colors.grey.withOpacity(0.3),
              ),
              ListTile(
                title: const Text('로그아웃'),
                tileColor: Colors.grey.withOpacity(0.3),
              ),
            ],
          ),
        ),
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
