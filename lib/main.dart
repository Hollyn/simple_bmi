import 'package:flutter/material.dart';
import 'package:simple_bmi/constants.dart';

import 'pages/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(color: kAppBarBackgroundColor),
      ),
      home: const BmiApp(),
    );
  }
}

class BmiApp extends StatelessWidget {
  const BmiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: const InputPage(),
      ),
    );
  }
}
