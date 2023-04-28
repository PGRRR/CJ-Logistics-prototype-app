import 'package:flutter/material.dart';

class Tag extends StatefulWidget {
  final String tag;
  final Color? color;

  const Tag({
    super.key,
    required this.tag,
    this.color,
  });

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  bool _isClicked = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isClicked = !_isClicked;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _isClicked ? widget.color ?? Colors.grey.shade600 : Theme.of(context).colorScheme.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            child: Text(
              '#${widget.tag}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
