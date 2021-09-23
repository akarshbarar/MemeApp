import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memeapp/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()))
            });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text(
          "Meme App",
          style: TextStyle(fontSize: 30),
        ),
      ),
    ));
  }
}
