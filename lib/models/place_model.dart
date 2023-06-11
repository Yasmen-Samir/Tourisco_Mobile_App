
class PlaceModel {
  late String name;
  late String address;
  late double area;
  late String location;
  late String founder;
  late String description;

  PlaceModel(
      {
        required this.name,
      required this.founder,
      required this.address,
      required this.description,
      }
      );
  PlaceModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    founder = json["founder"];
    address = json["address"];
    description = json["description"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "name":name,
      "founder":founder,
      "address":address,
      "description":description,
    };
  }
}
