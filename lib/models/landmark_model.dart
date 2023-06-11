
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
  late double area;
  late int tourismCategoryObject;
  late int userCreatedBy;
  late List<String> images;
  late List<String> reviews;
  LandMark(
      {
        required this.id,
      required this.name,
      required this.image,
      }
      );
  LandMark.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    tourismCategoryObject = json["tourismCategoryObject"];
    userCreatedBy = json["user_created_by"];
    images = List.from(json["images"].map((e)=>e.toString()));
    reviews =List.from(json["reviews"].map((e)=>e.toString()));
  }

  Map<String, dynamic> toMaP() {
    return {
      "id":id,
      "name":name,
      "image":image,
      "tourismCategoryObject":tourismCategoryObject,
      "user_created_by":userCreatedBy,
      "images":images,
      "reviews":reviews,
    };
  }
}
