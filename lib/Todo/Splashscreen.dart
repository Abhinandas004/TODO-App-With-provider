import 'package:flutter/material.dart';
import 'package:state_management/Todo/Todo_home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TodoHome()),
      );
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "TODO LIST LITE",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
