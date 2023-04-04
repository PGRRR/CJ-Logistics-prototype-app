import 'package:cj_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

class ShortsThumb extends StatelessWidget {
  final String name;
  final int shortsIndex;
  const ShortsThumb({
    super.key,
    required this.name,
    required this.shortsIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(
              selectedIndex: 1,
              shortsIndex: shortsIndex,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          height: 210,
          width: 120,
          clipBehavior: Clip.hardEdge,
          child: Image.asset('assets/images/$name', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
