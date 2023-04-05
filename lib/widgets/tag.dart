import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String tag;
  const Tag({
    super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade600),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(
          '#$tag',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
