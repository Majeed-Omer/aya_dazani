import 'package:aya_dazani/Models/Informations.dart';
import 'package:aya_dazani/Models/myInformations.dart';
import 'package:aya_dazani/Screens/Complete_Screen.dart';
import 'package:aya_dazani/Services/Services_crud.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Informations_Screen extends StatefulWidget {
  Informations_Screen() : super();

  @override
  Informations_ScreenState createState() => Informations_ScreenState();
}

bool _isFavorite = false;

class Informations_ScreenState extends State<Informations_Screen> {
  late List<Informations> _informations;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late String _information;
  late String _image;
  late String _user_id;
  late List<myInformations> _myInformation;

  @override
  void initState() {
    super.initState();
    _myInformation = [];
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

  _addInformations() {
    Services.addInformations(_information, _image, _user_id).then((result) {
      if (result) {
        _getInformations();
      }
    });
  }

  _deleteInformations(myInformations myInformation) {
    Services.deleteEmployee(myInformation.id).then((result) {
      if (result) {
        setState(() {
          _myInformation.remove(myInformation);
        });
        _getInformations();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(247, 246, 244, 244),
      key: _scaffoldKey,
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
                    title: GestureDetector(
                      onTap: () async {
                        print(_isFavorite);
                        _information = _informations[index].information;
                        _image = _informations[index].image;
                        _user_id = '123';
                        setState(() {
                          _isFavorite = !_isFavorite;
                          _addInformations();
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "ئایا دەزانی؟",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _isFavorite ? Colors.red : Colors.black,
                          )
                        ],
                      ),
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
