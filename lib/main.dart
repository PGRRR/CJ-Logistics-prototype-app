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
        colorScheme: ColorScheme(
          background: constants.kYtGray,
          onBackground: constants.kYtGray,
          brightness: Brightness.dark,
          primary: constants.kCjBlack,
          onPrimary: constants.kCjBlack,
          secondary: constants.kCjBlack,
          onSecondary: constants.kCjBlack,
          error: constants.kCjRed,
          onError: constants.kCjRed,
          surface: constants.kCjBlue,
          onSurface: constants.kCjBlue,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: constants.kCjBlack,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
