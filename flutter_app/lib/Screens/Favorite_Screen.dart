import 'package:aya_dazani/Services/Services_crud.dart';
import 'package:flutter/material.dart';

class Favorite_Screen extends StatefulWidget {
  Favorite_Screen() : super();

  @override
  Favorite_ScreenState createState() => Favorite_ScreenState();
}

class Favorite_ScreenState extends State<Favorite_Screen> {
  //late List<Informations> _informations;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  // late listview list;

  @override
  void initState() {
    super.initState();
    //_informations = [];
    _scaffoldKey = GlobalKey();
    _getInformations();
    // list = new listview();
  }

  _getInformations() {
    Services.getInformations().then((informations) {
      setState(() {
        //_informations = informations;
      });
      print("Length: ${informations.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(247, 246, 244, 244),
      key: _scaffoldKey,
      body: Text("mom"),
      // body: _informations.isEmpty
      //     ? const Center(child: CircularProgressIndicator())
      //     : list.mylistview(_informations),
    );
  }
}
