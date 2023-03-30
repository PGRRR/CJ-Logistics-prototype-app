import 'package:flutter/material.dart';

class content_card extends StatelessWidget {
  final String title, text1, text2;
  final Color bgColor;
  final IconData icon;

  const content_card({
    super.key,
    required this.title,
    required this.text1,
    required this.text2,
    required this.bgColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      text1,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      text2,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              icon,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
