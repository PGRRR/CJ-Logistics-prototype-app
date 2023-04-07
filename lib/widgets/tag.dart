import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String tag;
  Color? color;
  Tag({
    super.key,
    required this.tag,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? Colors.grey.shade600,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Text(
            '#$tag',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
