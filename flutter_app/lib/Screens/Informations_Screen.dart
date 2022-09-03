import 'package:aya_dazani/Models/Informations.dart';
import 'package:aya_dazani/Screens/Complete_Screen.dart';
import 'package:aya_dazani/Services/Services_crud.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:async';

import 'package:provider/provider.dart';

class Informations_Screen extends StatefulWidget {
  Informations_Screen() : super();

  @override
  Informations_ScreenState createState() => Informations_ScreenState();
}

class Informations_ScreenState extends State<Informations_Screen> {
  late List<Informations> _informations;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _informations = [];
    _scaffoldKey = GlobalKey();
    _getInformations();
  }

  _getInformations() {
    Services.getInformations().then((informations) {
      setState(() {
        _informations = informations;
      });
      print("Length: ${informations.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(247, 246, 244, 244),
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 242, 160, 65),
        title: const Text(
          "ئایا دەزانی؟",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _informations.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _informations.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Provider.of<Informations>(context, listen: false)
                      .setInformation(_informations[index]);
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 350),
                          pageBuilder: (_, __, ___) => Complete_Screen()));
                },
                child: Card(
                  color: Colors.white,
                  elevation: 5.0,
                  margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
                  child: ListTile(
                    leading: Hero(
                        transitionOnUserGestures: true,
                        tag: _informations[index],
                        child: Image.network(_informations[index].image)),
                    title: const Text(
                      "ئایا دەزانی؟",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.end,
                    ),
                    subtitle: Text(
                      _informations[index].information,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
