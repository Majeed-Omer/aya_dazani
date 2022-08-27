import 'package:aya_dazani/Models/Informations.dart';
import 'package:aya_dazani/Screens/Complete_Screen.dart';
import 'package:aya_dazani/Services/Services_crud.dart';
import 'package:flutter/material.dart';

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
        title: Text(
          "ئایا دەزانی؟",
          style: TextStyle( fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _informations.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Complete_Screen(
              _informations[index].information,
              _informations[index].image,
            );
          })),
          
          child: Card(
            color: Colors.white,
            elevation: 5.0,
            margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
            child: ListTile(
              leading: Image.network(_informations[index].image, ),
              title: Text(
                "ئایا دەزانی؟",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.end,
              ),
              subtitle: Text(_informations[index].information, textAlign: TextAlign.end,),
            ),
          ),
        ),
      ),
    );
  }
}
