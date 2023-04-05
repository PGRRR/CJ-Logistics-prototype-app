import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.only(bottom: 10),
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
            height: MediaQuery.of(context).size.height * cardHeight,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/$image',
              scale: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}