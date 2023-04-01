import 'package:flutter/material.dart';

class ShortsThumb extends StatelessWidget {
  final String name;
  const ShortsThumb({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}