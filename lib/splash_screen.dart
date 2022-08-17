import 'dart:async';
import 'package:flutter/material.dart';
import 'loading_screen.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        (() => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MyStatefulWidget()))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Image(
                  image: AssetImage("assets/logo.jpg"),
                  alignment: Alignment.center),
            ],
          ),
        ));
  }
}
