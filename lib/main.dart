import 'package:flutter/material.dart';
import 'topics.dart';

const String myFont = "BreulGroteskA";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TalkItOut",
      home: Topics(),
    );
  }
}
