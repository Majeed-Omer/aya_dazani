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

  _addInformations(info, img, id) {
    Services.addInformations('mmmmmm', 'data:image/jpeg;base64,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', '111').then((result) {
      if (result) {
        _getInformations();
      }
    });
  }

  _deleteInformations(myInformations myInformation) {
    Services.deleteInformation(myInformation.id).then((result) {
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
                          _addInformations(_information, _image, _user_id);
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
