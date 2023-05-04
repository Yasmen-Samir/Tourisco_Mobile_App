class Gov {
  late int id;
  late String name;
  late String emblem;
  late double area;
  late String theme;
  late int population;
  late String created;
  late bool active;


  Gov(
      {
        required this.id,
      required this.name,
      required this.emblem,
      required this.area,
      required this.theme,
      required this.population,
      required this.created,
      required this.active}
      );

  Gov.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    emblem = json["emblem"];
    area = json["area"];
    theme = json["theme"];
    population = json["population"];
    created = json["created"];
    active = json["active"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "id":id,
      "name":name,
      "emblem":emblem,
      "area":area,
      "theme":theme,
      "population":population,
      "created":created,
      "active":active,
    };
  }
}
