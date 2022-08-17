import 'dart:async';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  Widget screen;

  LoadingScreen(this.screen);

  @override
  State<StatefulWidget> createState() => _LoadingScreenState(screen);
}

class _LoadingScreenState extends State {
  Widget screen;

  _LoadingScreenState(this.screen);

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        (() => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => screen))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 202, 138),
        title: const Center(child: Text("PiyaSync")),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: const Center(
        child:
            CircularProgressIndicator(color: Color.fromARGB(255, 0, 202, 138)),
      ),
    );
  }
}
