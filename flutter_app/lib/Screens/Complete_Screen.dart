import 'package:aya_dazani/Models/Informations.dart';
import 'package:flutter/material.dart';

class Complete_Screen extends StatelessWidget {
  final Informations information;

  const Complete_Screen({
    required this.information,
    }
  );

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 242, 160, 65),
        title: const Text(
          "ئایا دەزانی؟",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: 
      SafeArea(
          child: ListView(
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
        ),
    
    );
  }
}
