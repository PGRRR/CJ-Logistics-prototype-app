import 'package:cj_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final constants = Constants();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'cj',
        colorScheme: ColorScheme(
          background: constants.kCjWhite,
          onBackground: constants.kCjWhite,
          brightness: Brightness.light,
          primary: constants.kCjBlue,
          onPrimary: constants.kCjBlue,
          secondary: constants.kCjWhite,
          onSecondary: constants.kCjWhite,
          error: constants.kCjRed,
          onError: constants.kCjRed,
          surface: constants.kCjBlue,
          onSurface: constants.kCjBlue,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 18,
            color: constants.kCjWhite,
            fontWeight: FontWeight.w600
          ),
          titleMedium: TextStyle(
            fontSize: 12,
            color: constants.kCjWhite,
          ),
          bodyLarge: TextStyle(
            fontSize: 14,
            color: constants.kCjBlack,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: constants.kCjGray,
          )
        ),
      ),
      home: const MainScreen(),
    );
  }
}
