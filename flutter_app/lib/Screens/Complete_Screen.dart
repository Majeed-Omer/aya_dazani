import 'package:flutter/material.dart';

class Complete_Screen extends StatelessWidget {

String name;
  String information;
  String image;

  Complete_Screen(this.name, this.information, this.image,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.network(image),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(information),
            )
          ],
        ),
      ),
    );
  }
}