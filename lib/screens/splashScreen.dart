import 'package:calculater/core/colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, 'homescreen');
    });

    return Scaffold(
      backgroundColor: appcolors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'lib/assets/pngwing.com.png',
            height: 200,
            width: 200,
          )),
        ],
      ),
    );
  }
}
