import 'package:flutter/material.dart';

class video_card extends StatelessWidget {
  const video_card({
    super.key,
    required this.bgColor,
    required this.textColor,
    required this.thumbUrl,
  });

  final Color bgColor;
  final Color textColor;
  final String thumbUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              thumbUrl,
              scale: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.video_collection,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'CJ의 미래성장 키워드',
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
