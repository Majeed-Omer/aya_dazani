import 'package:flutter/material.dart';

class Complete_Screen extends StatelessWidget {

  String information;
  String image;

  Complete_Screen(this.information, this.image,);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width; 

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Image.network(image, width: double.infinity, height: h * 0.50, fit: BoxFit.fill,),
            Text("ئایا دەزانی؟", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
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
