
class LandMarkModel {
  late int id;
  late String title;
  late String founder;
  late String address;
  late String description;
  late String created;
  late bool active;
  late LandMark landMark;

  LandMarkModel(
      {
        required this.id,
      required this.title,
      required this.founder,
      required this.address,
      required this.description,
      required this.created,
      required this.active,
      required this.landMark,
      }
      );
  LandMarkModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    founder = json["founder"];
    address = json["address"];
    description = json["description"];
    created = json["created"];
    active = json["active"];
    landMark = LandMark.fromJson(json["landmark"]);
  }

  Map<String, dynamic> toMaP() {
    return {
      "id":id,
      "title":title,
      "founder":founder,
      "address":address,
      "description":description,
      "created":created,
      "active":active,
      "landmark":landMark.toMaP(),
    };
  }
}
class LandMark {
  late int id;
  late String name;
  late String image;
  late int govObject;

  LandMark(
      {
        required this.id,
      required this.name,
      required this.image,
      required this.govObject,
      }
      );
  LandMark.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    govObject = json["govObject"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "id":id,
      "name":name,
      "image":image,
      "govObject":govObject,
    };
  }
}
