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
    void showKeywordDialog(String keyword) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 8,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '키워드 "$keyword" 관련 뉴스',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            titlePadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: const [
                  KeywordNewsCard(
                    media: '연합뉴스',
                    newsTitle: 'cj올리브네트웍스, 매출 늘었지만 여전한 ‘cj 의존’ 스마트팩토리로 고객 다각화',
                    postTime: '5시간 전',
                    url:
                        'https://www.bloter.net/news/articleView.html?idxno=600757',
                  ),
                  KeywordNewsCard(
                    media: '연합뉴스',
                    newsTitle: 'cj올리브네트웍스, 매출 늘었지만 여전한 ‘cj 의존’ 스마트팩토리로 고객 다각화',
                    postTime: '5시간 전',
                    url:
                        'https://www.bloter.net/news/articleView.html?idxno=600757',
                  ),
                  KeywordNewsCard(
                    media: '연합뉴스',
                    newsTitle: 'cj올리브네트웍스, 매출 늘었지만 여전한 ‘cj 의존’ 스마트팩토리로 고객 다각화',
                    postTime: '5시간 전',
                    url:
                        'https://www.bloter.net/news/articleView.html?idxno=600757',
                  ),
                  KeywordNewsCard(
                    media: '연합뉴스',
                    newsTitle: 'cj올리브네트웍스, 매출 늘었지만 여전한 ‘cj 의존’ 스마트팩토리로 고객 다각화',
                    postTime: '5시간 전',
                    url:
                        'https://www.bloter.net/news/articleView.html?idxno=600757',
                  ),
                  KeywordNewsCard(
                    media: '연합뉴스',
                    newsTitle: 'cj올리브네트웍스, 매출 늘었지만 여전한 ‘cj 의존’ 스마트팩토리로 고객 다각화',
                    postTime: '5시간 전',
                    url:
                        'https://www.bloter.net/news/articleView.html?idxno=600757',
                  ),
                  KeywordNewsCard(
                    media: '연합뉴스',
                    newsTitle: 'cj올리브네트웍스, 매출 늘었지만 여전한 ‘cj 의존’ 스마트팩토리로 고객 다각화',
                    postTime: '5시간 전',
                    url:
                        'https://www.bloter.net/news/articleView.html?idxno=600757',
                  ),
                  KeywordNewsCard(
                    media: '연합뉴스',
                    newsTitle: 'cj올리브네트웍스, 매출 늘었지만 여전한 ‘cj 의존’ 스마트팩토리로 고객 다각화',
                    postTime: '5시간 전',
                    url:
                        'https://www.bloter.net/news/articleView.html?idxno=600757',
                  ),
                  KeywordNewsCard(
                    media: '연합뉴스',
                    newsTitle: 'cj올리브네트웍스, 매출 늘었지만 여전한 ‘cj 의존’ 스마트팩토리로 고객 다각화',
                    postTime: '5시간 전',
                    url:
                        'https://www.bloter.net/news/articleView.html?idxno=600757',
                  ),
                  KeywordNewsCard(
                    media: '연합뉴스',
                    newsTitle: 'cj올리브네트웍스, 매출 늘었지만 여전한 ‘cj 의존’ 스마트팩토리로 고객 다각화',
                    postTime: '5시간 전',
                    url:
                        'https://www.bloter.net/news/articleView.html?idxno=600757',
                  ),
                  KeywordNewsCard(
                    media: '연합뉴스',
                    newsTitle: 'cj올리브네트웍스, 매출 늘었지만 여전한 ‘cj 의존’ 스마트팩토리로 고객 다각화',
                    postTime: '5시간 전',
                    url:
                        'https://www.bloter.net/news/articleView.html?idxno=600757',
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

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
            height: MediaQuery.of(context).size.height * cardHeight,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: () {
                showKeywordDialog('건축');
              },
              child: Image.asset(
                'assets/images/$image',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KeywordNewsCard extends StatelessWidget {
  final String media, newsTitle, postTime, url;
  const KeywordNewsCard({
    super.key,
    required this.media,
    required this.newsTitle,
    required this.postTime,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrlString(url),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          media,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          newsTitle,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          postTime,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  height: 50,
                  width: 50,
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/images/cj_splash_logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black.withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}
