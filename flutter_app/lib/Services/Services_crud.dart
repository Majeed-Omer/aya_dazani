import 'dart:convert';
import 'package:aya_dazani/Models/Informations.dart';
import 'package:http/http.dart' as http;

class Services {
  static const ROOT = 'http://192.168.100.128/api/informations/';
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';


  static Future<List<Informations>> getInformations() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.get(Uri.parse(ROOT));
      print('getInformations Response: ${response.body}');
      print(response.statusCode);
      print(200 == response.statusCode);
      if (200 == response.statusCode) {
        List<Informations> list = parseResponse(response.body);
        print(list.length);
        return list;
      } else {
        return <Informations>[];
      }
    } catch (e) {
      return <Informations>[];
    }
  }

  static List<Informations> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody);
    print(parsed);
    return parsed.map<Informations>((json) => Informations.fromJson(json)).toList();
  }
}