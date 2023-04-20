import 'package:cj_app/widgets/shorts_player.dart';
import 'package:flutter/material.dart';

class ShortsScreen extends StatefulWidget {
  final int? shortsIndex;
  const ShortsScreen({Key? key, required this.shortsIndex}) : super(key: key);

  @override
  State createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  late final PageController _pageController;

  final List<Widget> pages = [
    const ShortsPlayer(
      videoAssetPath: 'clip_1.mp4',
      uploadId: '아이디1',
      uploadEmail: '',
      videoDesc: '케미칼앙카 인발 시험',
      videoLike: 104,
      videoComment: '82',
      tagList: ['건축', '케미칼앙카'],
    ),
    const ShortsPlayer(
      videoAssetPath: 'clip_2.mp4',
      uploadId: '아이디2',
      uploadEmail: '',
      videoDesc: '발코니 방통 시 구배 잡는 방법',
      videoLike: 75,
      videoComment: '17',
      tagList: ['건축', '방통', '타설', '발코니'],
    ),
    const ShortsPlayer(
      videoAssetPath: 'clip_3.mp4',
      uploadId: '아이디3',
      uploadEmail: '',
      videoDesc: '합벽구간 블록 쌓기',
      videoLike: 84,
      videoComment: '4',
      tagList: ['건축', '블록쌓기'],
    ),
    const ShortsPlayer(
      videoAssetPath: 'clip_4.mov',
      uploadId: '아이디4',
      uploadEmail: '',
      videoDesc: '바닥 미장 순서',
      videoLike: 84,
      videoComment: '4',
      tagList: ['건축', '미장'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.shortsIndex ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.3),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SEARCH',
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
