import 'package:flutter/material.dart';

class noInternet_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Image.asset(
          "assets/noconection.webp",
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
