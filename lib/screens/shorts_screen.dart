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
      videoComment: '4',
      tagList: ['건축', '케미칼앙카'],
    ),
    const ShortsPlayer(
      videoAssetPath: 'clip_2.mp4',
      uploadId: '아이디2',
      uploadEmail: '',
      videoDesc: '발코니 방통 시 구배 잡는 방법',
      videoLike: 75,
      videoComment: '4',
      tagList: ['건축', '방통', '타설', '발코니'],
    ),
    const ShortsPlayer(
      videoAssetPath: 'clip_3.mp4',
      uploadId: '아이디3',
      uploadEmail: '',
      videoDesc: '합벽구간 블록 쌓기',
      videoLike: 34,
      videoComment: '4',
      tagList: ['건축', '블록쌓기'],
    ),
    const ShortsPlayer(
      videoAssetPath: 'clip_4.mov',
      uploadId: '아이디4',
      uploadEmail: '',
      videoDesc: '바닥 미장 순서',
      videoLike: 40,
      videoComment: '4',
      tagList: ['건축', '미장'],
    ),
    const ShortsPlayer(
      videoAssetPath: 'clip_5.mov',
      uploadId: '아이디5',
      uploadEmail: '',
      videoDesc: '콘크리트 슬라브 타설',
      videoLike: 54,
      videoComment: '4',
      tagList: ['건축시공', '타설', '바닥슬라브 타설'],
    ),
        const ShortsPlayer(
      videoAssetPath: 'clip_6.mp4',
      uploadId: '아이디6',
      uploadEmail: '',
      videoDesc: '경량벽체 시공',
      videoLike: 32,
      videoComment: '4',
      tagList: ['공사', '수장공사', '경량벽체'],
    ),
        const ShortsPlayer(
      videoAssetPath: 'clip_7.mp4',
      uploadId: '아이디7',
      uploadEmail: '',
      videoDesc: '램프 타설 진행 순서',
      videoLike: 24,
      videoComment: '4',
      tagList: ['건축', '타설', '빵빵이', '조면링', '램프'],
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
