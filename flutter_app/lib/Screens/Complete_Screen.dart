import 'package:aya_dazani/Models/Informations.dart';
import 'package:aya_dazani/Widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Complete_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    
    Informations information = Provider.of<Informations>(context, listen: false).getInformation();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar.myAppbar(),
      body: 
      ListView(
        children: [
          Hero(
        transitionOnUserGestures: true,
        tag: information,
            child: Image.network(
              information.image,
              width: double.infinity,
              height: h * 0.40,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "ئایا دەزانی؟",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              information.information,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 20)
            ),
          ),
        ],
      ),
    
    );
  }
}
