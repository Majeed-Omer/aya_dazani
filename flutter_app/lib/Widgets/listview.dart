import 'package:aya_dazani/Models/Informations.dart';
import 'package:aya_dazani/Screens/Complete_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class listview {
  mylistview(List<Informations> _informations) {
    return ListView.builder(
      itemCount: _informations.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Provider.of<Informations>(context, listen: false)
              .setInformation(_informations[index]);
          Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 350),
                  pageBuilder: (_, __, ___) => Complete_Screen()));
        },
        child: Card(
          color: Colors.white,
          elevation: 5.0,
          margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
          child: ListTile(
            leading: Hero(
                transitionOnUserGestures: true,
                tag: _informations[index],
                child: Image.network(_informations[index].image)),
            title: const Text(
              "ئایا دەزانی؟",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.end,
            ),
            subtitle: Text(
              _informations[index].information,
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ),
    );
  }
}
