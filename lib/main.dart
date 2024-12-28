import 'package:calculater/screens/homeScreen.dart';
import 'package:calculater/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(calculator());
}

class calculator extends StatelessWidget {
  const calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'splash screen': (context) => SplashScreen(),
        'homescreen': (context) => Homescreen()
      },
      initialRoute: 'splash screen',
      debugShowCheckedModeBanner: false,
    );
  }
}
