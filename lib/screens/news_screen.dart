import 'package:flutter/material.dart';
import '../utils/constants.dart';

class NewsScreen extends StatefulWidget {
  
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final constants = Constants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.kYtGray,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.newspaper,
                size: 100,
                color: constants.kCjWhite,
              ),
            ],
          ),
        ],
      ),
    );
  }
}