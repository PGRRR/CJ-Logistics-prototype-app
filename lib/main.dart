import 'package:cj_app/widgets/Button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/cj_lh.png',
                    width: 115.1,
                    height: 47,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Main_title',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Sub_title',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Text(
                'Main_text_1',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Main_text_2',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Button(
                    text: "button_1",
                    bgColor: Color(0XFF006ECD),
                    textColor: Colors.black,
                  ),
                  Button(
                    text: "button_2",
                    bgColor: Color(0XFF97999b),
                    textColor: Colors.black,
                  ),
                ],
              ),
              const SizedBox(
                height: 200,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sub_text_1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Sub_text_2',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0XFF97999b),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'content_title_1',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              Text(
                                'content_text_1',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('content_text_2',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.video_collection_outlined,
                        size: 90,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
