import 'package:cj_app/screens/main_screen.dart';
import 'package:cj_app/utils/constants.dart';
import 'package:cj_app/widgets/notice_header.dart';
import 'package:cj_app/widgets/shorts_thumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final constants = Constants();

  @override
  Widget build(BuildContext context) {
    var thumbList = [
      'clip_thumb_1.png',
      'clip_thumb_2.png',
      'clip_thumb_3.png',
      'clip_thumb_4.png',
      'clip_thumb_5.png',
    ];
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: constants.kCjWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const NoticeHeader(
                  title: '공지사항',
                  screenIndex: 0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.3),
                      width: 0.3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.14,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '어플 안내',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '수주 소식',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '경조사 안내',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '생일 안내',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.14,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Text(
                                  'CJ LOGISTICS 앱 이용방법을 확인하세요.',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Text(
                                  '수주 소식을 확인하세요.',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Text(
                                  '(결혼식) 2023.04.15.토 CJ대한통운 건설부문 인사운영팀',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Text(
                                  '2023.03.10 건설부문 인사운영팀',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const NoticeHeader(
                  title: '인기 CLIP',
                  screenIndex: 1,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.3),
                      width: 0.3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                      15,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var thumb in thumbList)
                            ShortsThumb(
                              name: thumb,
                              shortsIndex: thumbList.indexOf(thumb),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const NoticeHeader(
                  title: 'Trend in News',
                  screenIndex: 3,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.3),
                      width: 0.3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(
                            selectedIndex: 3,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              'assets/images/trend_keyword.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.blue.shade700,
                                            Colors.lightBlue.withOpacity(0.3)
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )),
                                    height: 160,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                      ),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '서울특별시',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            Image.asset(
                                                'assets/images/partly_cloudy_2.png'),
                                            Text('13°',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge),
                                            Text(
                                              '구름 조금',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  height: 150,
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '오늘의 건설 뉴스',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Flexible(
                                        child: Text(
                                          '"주계약자 공동도급제도 개선 방안 세미나" 12일 국회서 열린다',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Flexible(
                                        child: Text(
                                          '“올해 우리나라 1.5% 성장…건설투자는 1.0% 감소”',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Flexible(
                                        child: Text(
                                          '고용부 노동개혁정책관 신설…“노동개혁 완수 모든 역량 집중”',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Flexible(
                                        child: Text(
                                          '조달청, 불공정 조달행위 엄정 대응…이행방안 추가 발표',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
