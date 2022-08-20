class Informations {
  String id;
  String name;
  String information;
  String image;

  Informations({required this.id, required this.name, required this.information, required this.image});

  factory Informations.fromJson(Map<String, dynamic> json) {
    return Informations(
      id: json['id'].toString(),
      name: json['name'].toString(),
      information: json['information'].toString(),
      image: json['image'].toString(),
    );
  }
}