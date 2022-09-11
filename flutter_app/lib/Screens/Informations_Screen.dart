import 'package:aya_dazani/Models/Informations.dart';
import 'package:aya_dazani/Services/Services_crud.dart';
import 'package:aya_dazani/Widgets/appbar.dart';
import 'package:aya_dazani/Widgets/listview.dart';
import 'package:flutter/material.dart';

class Informations_Screen extends StatefulWidget {
  Informations_Screen() : super();

  @override
  Informations_ScreenState createState() => Informations_ScreenState();
}

class Informations_ScreenState extends State<Informations_Screen> {
  late List<Informations> _informations;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late listview list;

  @override
  void initState() {
    super.initState();
    _informations = [];
    _scaffoldKey = GlobalKey();
    _getInformations();
    list = new listview();
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
      backgroundColor: const Color.fromARGB(247, 246, 244, 244),
      key: _scaffoldKey,
      appBar: appbar.myAppbar(),
      body: _informations.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : list.mylistview(_informations),
    );
  }
}
