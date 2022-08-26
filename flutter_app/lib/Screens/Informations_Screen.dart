import 'package:aya_dazani/Models/Informations.dart';
import 'package:aya_dazani/Screens/Complete_Screen.dart';
import 'package:aya_dazani/Services/Services_crud.dart';
import 'package:flutter/material.dart';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_db_helper.dart';

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

  Future<List<Map<String, dynamic>>> fetchapiCach() async {
  // await APICacheDBHelper.deleteAll(APICacheDBModel.table);

  var lists = new List<int>.generate(15, (i) => i + 1);
  lists.forEach((element) async {
    var cacheData2 = await APICacheManager().addCacheData(new APICacheDBModel(
      syncData: '{"name":"lava$element"}',
      key: "$element",
    ));
  });

  List<Map<String,dynamic>> list = await APICacheDBHelper.query(APICacheDBModel.table);
  // await APICacheDBHelper.rawQuery("select * from ${APICacheDBModel.table}");
  // print(list);
  list.forEach((element) {
    print(element);
  });
  return list;
}

  _getInformations() {
    Services.getInformations().then((informations) {
      setState(() {
        _informations = informations;
      });
      print("Length: ${informations.length}");
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Color.fromARGB(247, 246, 244, 244),
  //     key: _scaffoldKey,
  //     appBar: AppBar(
  //       elevation: 0.0,
  //       backgroundColor: Color.fromARGB(255, 242, 160, 65),
  //       title: Text(
  //         "ئایا دەزانی؟",
  //         style: TextStyle( fontWeight: FontWeight.bold),
  //       ),
  //       centerTitle: true,
  //     ),
    //   body: ListView.builder(
    //     itemCount: _informations.length,
    //     itemBuilder: (context, index) => GestureDetector(
    //       onTap: () =>
    //           Navigator.push(context, MaterialPageRoute(builder: (context) {
    //         return Complete_Screen(
    //           _informations[index].information,
    //           _informations[index].image,
    //         );
    //       })),
          
    //       child: Card(
    //         color: Colors.white,
    //         elevation: 5.0,
    //         margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
    //         child: ListTile(
    //           leading: Image.network(_informations[index].image, ),
    //           title: Text(
    //             "ئایا دەزانی؟",
    //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    //             textAlign: TextAlign.end,
    //           ),
    //           subtitle: Text(_informations[index].information, textAlign: TextAlign.end,),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  // }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchapiCach(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Container(
                    height: 10, width: 10, child: CircularProgressIndicator()));
          }
           else {
            print(snapshot.data);
            return ListView.builder(
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
      );
         }
          
        });
  }
}
