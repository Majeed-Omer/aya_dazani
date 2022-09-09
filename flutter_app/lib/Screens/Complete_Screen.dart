import 'package:aya_dazani/Models/Informations.dart';
import 'package:aya_dazani/Widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class Complete_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    Informations informations =
        Provider.of<Informations>(context, listen: false).getInformation();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar.myAppbar(),
      body: ListView(
        children: [
          Hero(
            transitionOnUserGestures: true,
            tag: informations,
            child: Image.network(
              informations.image,
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
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(informations.information,
                textAlign: TextAlign.end, style: const TextStyle(fontSize: 20)),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: const Color.fromARGB(255, 241, 145, 36),
        child: InkWell(
          onTap: () async {
            await Share.share(informations.information,
                subject: informations.image);
          },
          child: const SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
                child: Icon(
              Icons.share,
              color: Colors.white,
            )),
          ),
        ),
      ),
    );
  }
}
