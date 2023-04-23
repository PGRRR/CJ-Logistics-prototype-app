import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ),
                  Text(
                    '알림',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            AlertCard(
              content: '영상이 업로드되었습니다.',
              time: '1분 전',
            ),
            AlertCard(
              content: '영상이 저장되었습니다.',
              time: '5분 전',
            ),
            AlertCard(
              content: '사진이 저장되었습니다.',
              time: '10분 전',
            ),
          ],
        ),
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  final String content, time;
  const AlertCard({
    super.key,
    required this.content,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(''),
      onDismissed: (direction) {},
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/images/cj_splash_logo.png'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(time),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
