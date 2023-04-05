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
            vertical: 50,
          ),
          child: Column(
            children: [
              const NewsCard(
                newsTitle: '오늘의 키워드',
                cardHeight: 0.3,
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
                                'assets/images/news_img_2.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const NewsTitle(
                            title: '"주계약자 공동도급제도 개선 방안 세미나" 12일 국회서 열린다',
                            date: '2023.04.04 17:56',
                            url:
                                'http://www.koscaj.com/news/articleView.html?idxno=234325',
                          ),
                          const NewsTitle(
                            title: '“올해 우리나라 1.5% 성장…건설투자는 1.0% 감소”',
                            date: '2023.04.04 17:56',
                            url:
                                'http://www.koscaj.com/news/articleView.html?idxno=234324',
                          ),
                          const NewsTitle(
                            title: '고용부 노동개혁정책관 신설…“노동개혁 완수 모든 역량 집중”',
                            date: '2023.04.04 17:14',
                            url:
                                'http://www.koscaj.com/news/articleView.html?idxno=234309',
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
