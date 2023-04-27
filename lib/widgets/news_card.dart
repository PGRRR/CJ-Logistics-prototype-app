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
              child: keyword == '건설안전'
                  ? Column(
                      children: const [
                        KeywordNewsCard(
                          media: '서울경제',
                          newsTitle: '산단공, 공공기관 안전관리 등급제 ‘3년 연속 2등급 달성’',
                          postTime: '20230426',
                          url: 'http://www.sedaily.com/NewsView/29ODL7DHGE',
                        ),
                        KeywordNewsCard(
                          media: '중부일보',
                          newsTitle: '용인특례시, 신속한 인 허가 처리 위해 건축허가 처리시스템 개선에 나선다',
                          postTime: '20230426',
                          url:
                              'www.joongboo.com/news/articleView.html?idxno=363589324',
                        ),
                        KeywordNewsCard(
                          media: '서울경제',
                          newsTitle:
                              '가양 CJ부지개발 지자체 발목에 1.3조 PF 불똥 제2 레고랜드 사태되나',
                          postTime: '20230426',
                          url: 'http://www.sedaily.com/NewsView/29OGC45H4S',
                        ),
                        KeywordNewsCard(
                          media: '동아일보',
                          newsTitle: '“지어진 지 얼마 안됐는데” 美 주택, 절벽으로 ‘와르르’ [영상]',
                          postTime: '20230426',
                          url:
                              'https://www.donga.com/news/Inter/article/all/20230426/119019344/2',
                        ),
                        KeywordNewsCard(
                          media: '내일신문',
                          newsTitle: '대구성서산단에 비수도권 최대 지식산업센터',
                          postTime: '20230426',
                          url: 'http://www.naeil.com/news_view/?id_art=458832',
                        ),
                        KeywordNewsCard(
                          media: '한라일보',
                          newsTitle: '특별자치도 사무이양 비용 지원 이번에도 찔끔?',
                          postTime: '20230426',
                          url:
                              'http://www.ihalla.com/article.php?aid=1682473412741538121',
                        ),
                        KeywordNewsCard(
                          media: '매일신문',
                          newsTitle: '만 2세 추락사 비극 막아야 계단 난간 전수조사',
                          postTime: '20230426',
                          url:
                              'https://news.imaeil.com/page/view/2023042610365543000',
                        ),
                        KeywordNewsCard(
                          media: '문화일보',
                          newsTitle: 'KCC건설 ‘이문동 삼익’ 리모델링 안전진단 통과',
                          postTime: '20230425',
                          url:
                              'http://www.munhwa.com/news/view.html?no=2023042501032207301002',
                        ),
                        KeywordNewsCard(
                          media: '한국경제',
                          newsTitle:
                              '경기도, 민간 캠핑장과 키즈펜션 특정감사 결과, 안전 인증 받지 않은 놀이기구 사용',
                          postTime: '20230424',
                          url:
                              'https://www.hankyung.com/society/article/202304248153h',
                        ),
                        KeywordNewsCard(
                          media: '파이낸셜뉴스',
                          newsTitle: '현대건설 영업익 시장 기대치 이상..."적극매수"',
                          postTime: '20230424',
                          url: 'http://www.fnnews.com/news/202304240845092834',
                        ),
                        KeywordNewsCard(
                          media: '충청일보',
                          newsTitle: '건축사시험 합격률 껑충',
                          postTime: '20230423',
                          url:
                              'https://www.ccdailynews.com/news/articleView.html?idxno=2200245',
                        ),
                        KeywordNewsCard(
                          media: '문화일보',
                          newsTitle: '디자인으로 인정받는 K-건설 iF 디자인 어워드 대거 수상',
                          postTime: '20230423',
                          url:
                              'http://www.munhwa.com/news/view.html?no=2023042301039910301001',
                        ),
                        KeywordNewsCard(
                          media: '제민일보',
                          newsTitle: '건설업 훈풍 기대했는데 찬바람만 쌩쌩',
                          postTime: '20230421',
                          url:
                              'http://www.munhwa.com/news/view.html?no=2023042301039910301001',
                        ),
                        KeywordNewsCard(
                          media: '세계일보',
                          newsTitle: '‘디자인 서울’ 첫발 세계적 건축가들이 그린 노들섬의 미래',
                          postTime: '20230421',
                          url:
                              'http://www.segye.com/content/html/2023/04/20/20230420527507.html',
                        ),
                        KeywordNewsCard(
                          media: '매일경제',
                          newsTitle: '“데이트 필수코스로 뜨겠다”...서울에 지어진다는 이것 [부동산 라운지]',
                          postTime: '20230421',
                          url: 'http://www.mk.co.kr/article/10718115',
                        ),
                        KeywordNewsCard(
                          media: '중도일보',
                          newsTitle: '충주시, ‘대한민국 안전大전환 집중안전점검’ 실시',
                          postTime: '20230421',
                          url:
                              'http://www.joongdo.co.kr/web/view.php?key=20230420010006346',
                        ),
                        KeywordNewsCard(
                          media: '울산매일',
                          newsTitle: '건축주택 통합심의제도 1분기만에 성과 톡톡',
                          postTime: '20230420',
                          url:
                              'http://www.iusm.co.kr/news/articleView.html?idxno=1013567',
                        ),
                        KeywordNewsCard(
                          media: '서울경제',
                          newsTitle: '"수천억 도대체 어디에 썼나" 비 새는 기재부 한은 신청사',
                          postTime: '20230420',
                          url: 'http://www.sedaily.com/NewsView/29ODL7DHGE',
                        ),
                        KeywordNewsCard(
                          media: '중부매일',
                          newsTitle: '서산시, 해빙기 사고 예방을 위한 안전점검 시행',
                          postTime: '20230219',
                          url:
                              'www.jbnews.com/news/articleView.html?idxno=1385004',
                        ),
                        KeywordNewsCard(
                          media: '중부일보',
                          newsTitle: '용인시, 화재 취약한 건축자재 미인정 제품 집중 단속',
                          postTime: '20230219',
                          url:
                              'www.joongboo.com/news/articleView.html?idxno=363578995',
                        ),
                      ],
                    )
                  : Column(
                      children: const [
                        KeywordNewsCard(
                          media: '파이낸셜뉴스',
                          newsTitle: '이지스, 삼성전자-삼우종합건축 스마트 그린오피스 구축나서',
                          postTime: '20230426',
                          url: 'http://www.fnnews.com/news/202304261529199924',
                        ),
                        KeywordNewsCard(
                          media: '매일경제',
                          newsTitle: 'G-SEED, 국내 유일 건축물 친환경 성능평가 제도',
                          postTime: '20230426',
                          url: 'http://www.mk.co.kr/article/10722210',
                        ),
                        KeywordNewsCard(
                          media: '머니투데이',
                          newsTitle: '경기도교육청, 학교건축 세미나 개최 미래교육 공간 혁신 도모',
                          postTime: '20230426',
                          url:
                              'http://news.moneytoday.co.kr/view/mtview.php?no=2023042615593524840&type=2',
                        ),
                        KeywordNewsCard(
                          media: '한국경제',
                          newsTitle:
                              '삼우-삼성전자-이지스자산운용-이지스밸류리츠, 미래형 공간 플랫폼 구축 MOU',
                          postTime: '20230426',
                          url:
                              'https://www.hankyung.com/realestate/article/202304263849i',
                        ),
                        KeywordNewsCard(
                          media: '서울신문',
                          newsTitle: '원칙 지키는 승원건설 프리미엄 고품격 ‘승원팰리체’ 뜬다',
                          postTime: '20230426',
                          url:
                              'http://www.seoul.co.kr/news/newsView.php?id=20230426017002',
                        ),
                        KeywordNewsCard(
                          media: '세계일보',
                          newsTitle: '디케이보드 단열재 화재 안전성 인증받았다',
                          postTime: '20230426',
                          url:
                              'http://www.segye.com/content/html/2023/04/25/20230425511039.html',
                        ),
                        KeywordNewsCard(
                          media: '아시아경제',
                          newsTitle: '디케이보드 EPS 단열재 화재 안전성 적합 판정 눈길',
                          postTime: '20230425',
                          url:
                              'https://view.asiae.co.kr/article/2023042522434983774',
                        ),
                        KeywordNewsCard(
                          media: '중도일보',
                          newsTitle: '전북 익산시, 파주시 공공건축 고도화 정책 벤치마킹',
                          postTime: '20230425',
                          url:
                              'http://www.joongdo.co.kr/web/view.php?key=20230425010007587',
                        ),
                        KeywordNewsCard(
                          media: '서울경제',
                          newsTitle: '압구정 재건축 최고 70층 들어선다',
                          postTime: '20230425',
                          url: 'http://www.fnnews.com/news/202304261529199924',
                        ),
                        KeywordNewsCard(
                          media: '충북일보',
                          newsTitle: '"세대 통합 건설인 자부심 높이기 위한 노력"',
                          postTime: '20230426',
                          url:
                              'https://www.inews365.com/news/article.html?no=762046',
                        ),
                        KeywordNewsCard(
                          media: '한국경제',
                          newsTitle: '서울시, 토지주 상생주택 사업 수시신청 받는다',
                          postTime: '20230227',
                          url:
                              'https://www.hankyung.com/realestate/article/202302275476i',
                        ),
                        KeywordNewsCard(
                          media: '서울경제',
                          newsTitle: '녹색건축물 인증받으면 용적률 최대 15% 더 준다',
                          postTime: '20230227',
                          url: 'http://www.sedaily.com/NewsView/29LWX4OPSP',
                        ),
                        KeywordNewsCard(
                          media: '아주경제',
                          newsTitle: '녹색건축 인증시 용적률 최대 15% 완화..."탄소중립 건축 활성화"',
                          postTime: '20230227',
                          url: 'https://www.ajunews.com/view/20230227102139947',
                        ),
                        KeywordNewsCard(
                          media: '서울경제',
                          newsTitle: '코이카, 모로코에 녹색기술 연구시설 개소 저탄소경제 전환 지원',
                          postTime: '20230227',
                          url: 'http://www.sedaily.com/NewsView/29LWVUHZRF',
                        ),
                        KeywordNewsCard(
                          media: '헤럴드경제',
                          newsTitle: '서울 건축규제 완화 올해 상반기 중 밑그림 선보인다',
                          postTime: '20230225',
                          url:
                              'http://biz.heraldcorp.com/view.php?ud=20230224000638',
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
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/$image',
                  fit: BoxFit.fitWidth,
                ),
                Transform.translate(
                  offset: const Offset(185, 80),
                  child: GestureDetector(
                    onTap: () => showKeywordDialog('지속가능'),
                    child: Container(
                      height: 50,
                      width: 130,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(185, 160),
                  child: GestureDetector(
                    onTap: () => showKeywordDialog('건설안전'),
                    child: Container(
                      height: 50,
                      width: 130,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
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
