import 'package:flutter/material.dart';
import 'package:memeapp/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meme App",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
