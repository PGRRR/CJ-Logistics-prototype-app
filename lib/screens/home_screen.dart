import 'package:cj_app/utils/constants.dart';
import 'package:cj_app/widgets/notice_body.dart';
import 'package:cj_app/widgets/notice_header.dart';
import 'package:cj_app/widgets/shorts_thumb.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final constants = Constants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.kCjWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const NoticeHeader(
                title: '공지사항',
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
                  ),
                  child: Column(
                    children: const [
                      NoticeBody(
                        title: '어플 안내',
                        content: 'CJ LOGISTICS 앱 이용방법을 확인하세요.',
                      ),
                      NoticeBody(
                        title: '수주 소식',
                        content: '수주 소식을 확인하세요.',
                      ),
                      NoticeBody(
                        title: '경조사 안내',
                        content: '(결혼식) 2023.04.15.토 CJ대한통운 건설부문 인사운영팀',
                      ),
                      NoticeBody(
                        title: '생일 안내',
                        content: '2023.03.10 건설부문 인사운영팀 이병준',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const NoticeHeader(
                title: '인기 SHORTS',
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
                    25,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        ShortsThumb(
                          name: 'short_thumb_1.webp',
                        ),
                        ShortsThumb(
                          name: 'short_thumb_1.webp',
                        ),
                        ShortsThumb(
                          name: 'short_thumb_1.webp',
                        ),
                        ShortsThumb(
                          name: 'short_thumb_1.webp',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const NoticeHeader(
                title: '뉴스',
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
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 90,
                            width: 160,
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset('assets/images/cj_thumb_5.png',
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  'CJ대한통운, 아이지에이웍스와 물류 빅데이터 고도화 MOU',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Text(
                                  '모두를 위한 단 하나의 배송, CJ대한통운 오네',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Text(
                                  'CJ대한통운, 업계 최초 ‘환경·보건·안전’ 상황실 구축',
                                  style: Theme.of(context).textTheme.bodyLarge,
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
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
