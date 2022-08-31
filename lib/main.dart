import 'dart:math';

import 'package:flutter/material.dart';

import 'constant.dart';
import 'newpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  numbergenrator randomenumber =numbergenrator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NextPage()

      );
  }
}
