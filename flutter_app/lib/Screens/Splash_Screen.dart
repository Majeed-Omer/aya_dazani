import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:aya_dazani/Screens/Informations_Screen.dart';
import 'package:flutter/material.dart';

class Splah_Screen extends StatefulWidget {
  @override
  State<Splah_Screen> createState() => _Splah_ScreenState();
}

class _Splah_ScreenState extends State<Splah_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: Colors.white,
        splashIconSize: 400,
          splash: Image.asset("assets/qm.png"),
          duration: 2500,
          splashTransition: SplashTransition.scaleTransition,
          nextScreen: Informations_Screen()),
    );
  }
}
