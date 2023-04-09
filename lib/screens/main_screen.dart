import 'package:cj_app/screens/home_screen.dart';
import 'package:cj_app/screens/new_camera_screen.dart';
import 'package:cj_app/screens/new_recode_screen.dart';
import 'package:cj_app/screens/news_screen.dart';
import 'package:cj_app/screens/shorts_screen.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MainScreen extends StatefulWidget {
  final int selectedIndex;
  int? shortsIndex;
  bool? isRecordCamera;
  MainScreen(
      {super.key,
      required this.selectedIndex,
      this.shortsIndex,
      this.isRecordCamera});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late int shortsIndex;
  late bool isRecordCamera;
  final constants = Constants();
  late final List<StatefulWidget> screens;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex; // 초기값 설정
    shortsIndex = widget.shortsIndex ?? 0;
    isRecordCamera = widget.isRecordCamera ?? false;
    screens = [
      const HomeScreen(),
      ShortsScreen(
        shortsIndex: shortsIndex,
      ),
      isRecordCamera ? const NewRecordScreen() : const NewCameraScreen(),
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
                        Scaffold.of(context).openEndDrawer();
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
      endDrawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
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
                  child: Center(
                    child: Text(
                      'MY PAGE',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          'assets/images/cj_splash_logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '아이디 님',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 16,
                                ),
                          ),
                          Text(
                            'cjenc@cj.net',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset(
                      'assets/images/award.png',
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'CREDIT',
                    ),
                  ],
                ),
                trailing: const Text(
                  '50,000',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                tileColor: Colors.white,
              ),
              ExpansionTile(
                title: Text(
                  '기본 설정',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                ),
                children: const [
                  ListTile(
                    title: Text('닉네임 변경'),
                    tileColor: Colors.white,
                  ),
                  ListTile(
                    title: Text('이메일 변경'),
                    tileColor: Colors.white,
                  ),
                  ListTile(
                    title: Text('비밀번호 변경'),
                    tileColor: Colors.white,
                  ),
                  ListTile(
                    title: Text('알림 설정'),
                    tileColor: Colors.white,
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  '스크랩',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                ),
                tileColor: Colors.grey.withOpacity(0.3),
              ),
              ListTile(
                title: Text(
                  '내가 쓴 게시물',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                ),
                tileColor: Colors.grey.withOpacity(0.3),
              ),
              ListTile(
                title: Text(
                  '내가 쓴 댓글',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                ),
                tileColor: Colors.grey.withOpacity(0.3),
              ),
              ListTile(
                title: Text(
                  '문의하기',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                ),
                tileColor: Colors.grey.withOpacity(0.3),
              ),
              ListTile(
                title: Text(
                  '로그아웃',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                ),
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
