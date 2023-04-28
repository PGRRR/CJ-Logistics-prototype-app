import 'package:cj_app/widgets/keyword_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsCard extends StatelessWidget {
  final String newsTitle, image;
  final double cardHeight;
  final bool isBg, isShadow;
  const NewsCard({
    super.key,
    required this.newsTitle,
    required this.cardHeight,
    required this.image,
    required this.isBg,
    required this.isShadow,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              newsTitle,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isBg ? const Color(0XFFD9D9D9) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: isShadow
                      ? Colors.grey.withOpacity(0.8)
                      : Colors.transparent,
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            clipBehavior: Clip.hardEdge,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * cardHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '4월의 키워드',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    KeywordCard(
                      keyword: '국토교통부',
                    ),
                    KeywordCard(keyword: '지속가능'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    KeywordCard(keyword: '통합 심의'),
                    KeywordCard(keyword: '건설안전'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    KeywordCard(keyword: '기술사'),
                    KeywordCard(keyword: '우수 디자인'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

