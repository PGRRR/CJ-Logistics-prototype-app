import 'package:cj_app/utils/constants.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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
                Icons.supervised_user_circle_outlined,
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
