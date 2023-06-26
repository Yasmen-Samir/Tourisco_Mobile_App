
import 'package:toursim/models/ticket_model.dart';

class EventModel {
  late int id;
  late String title;
  late String created;
  late bool active;
  late Event event;
   List<TicketModel>? tickets;

  EventModel(
      {
        required this.id,
      required this.title,
      required this.created,
      required this.active,
      required this.event,
       this.tickets,
      }
      );
  EventModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    created = json["created"];
    active = json["active"];
    event = Event.fromJson(json["event"]);
  }

  Map<String, dynamic> toMaP() {
    return {
      "id":id,
      "title":title,
      "created":created,
      "active":active,
      "landmark":event.toMaP(),
    };
  }
}

class Event {
  late int id;
  late String name;
  late bool isMain;
  late String openTime;
  late String closeTime;
  late String created;
  late bool active;
  Event(
      {
        required this.id,
      required this.name,
      required this.isMain,
      required this.openTime,
      required this.closeTime,
      required this.created,
      required this.active,
      }
      );
  Event.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    isMain = json["isMain"];
    openTime = json["openTime"];
    closeTime = json["closeTime"];
    created = json["created"];
    active = json["active"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "id":id,
      "name":name,
      "isMain":isMain,
      "openTime":openTime,
      "closeTime":closeTime,
      "active":active,
      "created":created,
    };
  }
}
