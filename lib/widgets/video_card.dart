import 'package:cj_app/widgets/video_player_app.dart';
import 'package:flutter/material.dart';

class video_card extends StatefulWidget {
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
  State<video_card> createState() => _video_cardState();
}

class _video_cardState extends State<video_card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (_) => StatefulBuilder(
                    builder: (context, setState) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 300,
                        ),
                      );
                    },
                  ),
                );
              },
              child: Image.asset(
                widget.thumbUrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.video_collection,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'CJ의 미래성장 키워드',
                        style: TextStyle(
                          fontSize: 20,
                          color: widget.textColor,
                        ),
                      ),
                    ],
                  ),
                  Transform.translate(
                    offset: const Offset(0, -35),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 5,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '3:00',
                            style: TextStyle(
                              fontSize: 14,
                              color: widget.textColor,
                            ),
                          ),
                        ),
                      ),
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
