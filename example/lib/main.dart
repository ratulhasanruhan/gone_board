import 'package:example/DemoHome.dart';
import 'package:flutter/material.dart';
import 'package:gone_board/gone_board.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: GoneBoard(
            pageController: pageController,
            onFinishedPage: DemoHome(),
            items: [
              GonePage(
                image: 'assets/1.png',
                text: 'Welcome to GoneBoard',
                color: Colors.blue,
                context: context,
              ),
              GonePage(
                image: 'assets/2.png',
                text: 'GoneBoard is a Flutter package',
                color: Colors.red,
                context: context,
              ),
              GonePage(
                image: 'assets/3.png',
                text: 'GoneBoard is a Flutter package',
                color: Colors.green,
                context: context,
              ),
            ]),
      ),
    );
  }
}
