import 'package:flutter/cupertino.dart';

class Informations extends ChangeNotifier{
  String id;
  String name;
  String information;
  String image;
  late Informations global_inofrmation;

  Informations({required this.id, required this.name, required this.information, required this.image});

  factory Informations.fromJson(Map<String, dynamic> json) {
    return Informations(
      id: json['id'].toString(),
      name: json['name'].toString(),
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