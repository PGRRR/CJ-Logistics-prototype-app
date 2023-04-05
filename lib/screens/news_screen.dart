import 'package:cj_app/widgets/news_card.dart';
import 'package:cj_app/widgets/news_title.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final constants = Constants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 70,
          ),
          child: Column(
            children: [
              const NewsCard(
                newsTitle: '오늘의 키워드',
                cardHeight: 0.4,
                image: 'keyword.png',
                isBg: true,
                isShadow: true,
              ),
              const NewsCard(
                newsTitle: '오늘의 날씨',
                cardHeight: 0.25,
                image: 'weather.png',
                isBg: false,
                isShadow: false,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        '오늘의 뉴스',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0XFFD9D9D9),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: MediaQuery.of(context).size.width * 0.8,
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset(
                                'assets/images/news_img_1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const NewsTitle(
                            title: '모두를 위한 단 하나의 배송, CJ대한통운 오네(O-NE)',
                            date: '2023.03.06',
                            url:
                                'https://www.cjlogistics.com/ko/newsroom/latest/LT_00000307',
                          ),
                          const NewsTitle(
                            title: 'CJ대한통운 일본법인, 품질 환경 안전보건 ISO 인증 획득',
                            date: '2023.03.29',
                            url:
                                'https://www.cjlogistics.com/ko/newsroom/news/NR_00001038',
                          ),
                          const NewsTitle(
                            title: 'CJ대한통운, 아이지에이웍스와 물류 빅데이터 고도화 MOU',
                            date: '2023.03.16',
                            url:
                                'https://www.cjlogistics.com/ko/newsroom/news/NR_00001036',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
