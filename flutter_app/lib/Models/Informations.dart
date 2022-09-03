import 'package:flutter/cupertino.dart';

class Informations extends ChangeNotifier{
  String id;
  String information;
  String image;
  late Informations global_inofrmation;

  Informations({required this.id, required this.information, required this.image});

  factory Informations.fromJson(Map<String, dynamic> json) {
    return Informations(
      id: json['id'].toString(),
      information: json['information'].toString(),
      image: json['image'].toString(),
    );
  }

  void setInformation(Informations information){
    global_inofrmation =  information;
    notifyListeners();
  }

  Informations getInformation(){
    return global_inofrmation;
  }
}