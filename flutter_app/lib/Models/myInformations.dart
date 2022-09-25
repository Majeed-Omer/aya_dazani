import 'package:flutter/cupertino.dart';

class myInformations extends ChangeNotifier{
  String id;
  String information;
  String image;
  String user_id;
  late myInformations global_inofrmation;

  myInformations({required this.id, required this.information, required this.image, required this.user_id});

  factory myInformations.fromJson(Map<String, dynamic> json) {
    return myInformations(
      id: json['id'].toString(),
      information: json['information'].toString(),
      image: json['image'].toString(),
      user_id: json['user_id'].toString()
    );
  }

  void setInformation(myInformations information){
    global_inofrmation =  information;
    notifyListeners();
  }

  myInformations getInformation(){
    return global_inofrmation;
  }
}