import 'package:flutter/material.dart';

class appbar {
  static myAppbar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Color.fromARGB(255, 242, 160, 65),
      title: Text(
        "ئایا دەزانی؟",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
