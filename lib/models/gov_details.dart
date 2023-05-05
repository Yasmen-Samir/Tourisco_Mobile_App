import 'package:toursim/models/gov.dart';

class GovDetails {
  late int id;
  late String title;
  late Gov gov;
  late String governor;
  late String description;
  late String created;
  late bool active;


  GovDetails(
      {
        required this.id,
      required this.title,
      required this.gov,
      required this.governor,
      required this.description,
      required this.created,
      required this.active,
      }
      );
  GovDetails.instance();
  GovDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    gov = Gov.fromJson(json["governorate"]);
    governor = json["governor"];
    description = json["description"];
    created = json["created"];
    active = json["active"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "id":id,
      "title":title,
      "gov":gov.toMaP(),
      "governor":governor,
      "description":description,
      "created":created,
      "active":active,
    };
  }
}
