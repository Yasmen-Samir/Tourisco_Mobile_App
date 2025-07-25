
class TicketModel {
  late int id;
  late Ticket ticket;
  late String ticketCategory;
  late String title;
  TicketModel({
        required this.id,
      required this.ticket,
      });

  TicketModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    ticketCategory = json["ticket_class_category"];
    ticket = Ticket.fromJson(json["ticket"]);
  }

  Map<String, dynamic> toMaP() {
    return {
      "id":id,
      "title":title,
      "ticket_class_category":ticketCategory,
      "landmark":ticket.toMaP(),
    };
  }
}

class Ticket {
  late int id;
  late String name;
  late double price;
  late String created;
  late bool active;
  Ticket(
      {
        required this.id,
      required this.name,
      required this.price,
      required this.created,
      required this.active,
      }
      );
  Ticket.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    created = json["created"];
    active = json["active"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "id":id,
      "name":name,
      "price":price,
      "active":active,
      "created":created,
    };
  }
}
