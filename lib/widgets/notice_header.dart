import 'package:cj_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

class NoticeHeader extends StatelessWidget {
  final String title;
  final int screenIndex;
  const NoticeHeader({
    super.key,
    required this.title,
    required this.screenIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
        color: Color(0XFF006ECD),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(
                    selectedIndex: screenIndex,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                '전체보기',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
