import 'package:cj_app/utils/constants.dart';
import 'package:cj_app/widgets/notice_body.dart';
import 'package:cj_app/widgets/notice_header.dart';
import 'package:cj_app/widgets/shorts_thumb.dart';
import 'package:flutter/material.dart';

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
      'shorts_thumb_1.webp',
      'shorts_thumb_2.webp',
      'shorts_thumb_3.webp',
    ];
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
                height: 25,
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
                height: 25,
              ),
              const NoticeHeader(
                title: '인기 SHORTS',
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
                title: '뉴스',
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
                child: Padding(
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
                                              fontWeight: FontWeight.w600),
                                    ),
                                    // Image.asset(''),
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
                                              fontWeight: FontWeight.w600,
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
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '가장 많이 본 뉴스',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Text(
                                  'CJ대한통운, 아이지에이웍스와 물류 빅데이터 고도화 MOU',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Text(
                                  '모두를 위한 단 하나의 배송, CJ대한통운 오네',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Text(
                                  'CJ대한통운, 업계 최초 ‘환경·보건·안전’ 상황실 구축',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Text(
                                  'CJ그룹, 튀르키예 강진 피해 구호성금 3억원 지원',
                                  style: Theme.of(context).textTheme.bodyMedium,
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
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
