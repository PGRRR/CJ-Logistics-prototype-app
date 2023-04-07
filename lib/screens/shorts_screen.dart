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
      videoAssetPath: 'shorts_1.mp4',
      uploadId: '아이디1',
      uploadEmail: '',
      videoDesc: 'CJ대한통운 LOIS 포워더스 한 눈에 알아보기',
      videoLike: 104,
      videoComment: '82',
      tagList: ['콘크리트', '건물', '해시태그'],
    ),
    const ShortsPlayer(
      videoAssetPath: 'shorts_2.mp4',
      uploadId: '아이디2',
      uploadEmail: '',
      videoDesc: 'CJ대한통운 LOIS 포워더스 한 눈에 알아보기',
      videoLike: 75,
      videoComment: '17',
      tagList: ['콘크리트', '건물', '해시태그'],
    ),
    const ShortsPlayer(
      videoAssetPath: 'shorts_3.mp4',
      uploadId: '아이디3',
      uploadEmail: '',
      videoDesc: 'CJ대한통운 LOIS 포워더스 한 눈에 알아보기',
      videoLike: 84,
      videoComment: '4',
      tagList: ['콘크리트', '건물', '해시태그'],
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
        padding: const EdgeInsets.only(top: 25),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
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
