


class CategoryModel {
  late int id;
  late Category category;
  late String title;
  late String description;

  CategoryModel(
      {
        required this.id,
      required this.category,
      required this.title,
      required this.description,
      }
      );
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    category = Category.fromJson(json["category"]);
    description = json["description"];
    title = json["title"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "id":id,
      "category":category.toMaP(),
      "description":description,
      "title":title,
    };
  }
}

class Category {
  late int id;
  late String name;
  late String image;
  late String created;
  late bool active;
  Category(
      {
        required this.id,
      required this.name,
      required this.image,
      required this.created,
      required this.active,
      }
      );
  Category.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    created = json["created"];
    active = json["active"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "id":id,
      "name":name,
      "image":image,
      "active":active,
      "created":created,
    };
  }
}
