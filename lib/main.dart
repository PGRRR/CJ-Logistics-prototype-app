import 'package:cj_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void onClicked() {
    setState(() {
      counter = counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: const HomeScreen(),
      // home: Scaffold(
      //   backgroundColor: Colors.white,
      //   body: SingleChildScrollView(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           const SizedBox(
      //             height: 80,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Image.asset(
      //                 'assets/images/cj_lh.png',
      //                 width: 115.1,
      //                 height: 47,
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.end,
      //                 children: [
      //                   const Text(
      //                     'Main_title',
      //                     style: TextStyle(
      //                       color: Colors.black,
      //                       fontSize: 28,
      //                       fontWeight: FontWeight.w800,
      //                     ),
      //                   ),
      //                   Text(
      //                     'Sub_title',
      //                     style: TextStyle(
      //                       color: Colors.black.withOpacity(0.8),
      //                       fontSize: 18,
      //                     ),
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //           const SizedBox(
      //             height: 120,
      //           ),
      //           Text(
      //             'Main_text_1',
      //             style: TextStyle(
      //               fontSize: 24,
      //               fontWeight: FontWeight.w600,
      //               color: Colors.black.withOpacity(0.8),
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           Text(
      //             'Main_text_2',
      //             style: TextStyle(
      //               fontSize: 16,
      //               color: Colors.black.withOpacity(0.8),
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 30,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: const [
      //               Button(
      //                 text: "button_1",
      //                 bgColor: Color(0XFF006ECD),
      //                 textColor: Colors.black,
      //               ),
      //               Button(
      //                 text: "button_2",
      //                 bgColor: Color(0XFF97999b),
      //                 textColor: Colors.black,
      //               ),
      //             ],
      //           ),
      //           const SizedBox(
      //             height: 100,
      //           ),
      //           Row(
      //             crossAxisAlignment: CrossAxisAlignment.end,
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               const Text(
      //                 'Sub_text_1',
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 20,
      //                   fontWeight: FontWeight.w600,
      //                 ),
      //               ),
      //               Text(
      //                 'Sub_text_2',
      //                 style: TextStyle(
      //                   color: Colors.black.withOpacity(0.8),
      //                   fontSize: 16,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           const content_card(
      //             title: 'content_title_1',
      //             text1: 'content_text_1',
      //             text2: 'content_text_2',
      //             bgColor: Color(0XFF97999b),
      //             icon: Icons.video_collection_outlined,
      //           ),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           const content_card(
      //             title: 'content_title_1',
      //             text1: 'content_text_1',
      //             text2: 'content_text_2',
      //             bgColor: Color(0XFF97999b),
      //             icon: Icons.video_collection_outlined,
      //           ),
      //           Column(
      //             children: [
      //               Text(
      //                 'Count',
      //                 style: TextStyle(
      //                   fontSize: 20,
      //                   color: Theme.of(context).textTheme.titleLarge!.color,
      //                 ),
      //               ),
      //               Text('$counter',
      //                   style: TextStyle(
      //                     fontSize: 20,
      //                     color: Theme.of(context).textTheme.titleLarge!.color,
      //                   )),
      //               IconButton(
      //                 onPressed: onClicked,
      //                 icon: const Icon(
      //                   Icons.add_box_outlined,
      //                   size: 30,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
