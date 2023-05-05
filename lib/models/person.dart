class Person {
  late int id;
  late String username;
  late String email;
  late String phone;
  late String nationality;
  late String image;
  late String gender;
  late String password;

  Person({
    required this.username,
    required this.email,
    required this.phone,
    required this.gender,
    required this.nationality,
    required this.password,
  });

  Person.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    username = json["username"];
    email = json["email"];
    phone = json["phone"];
    gender = json["gender"];
    nationality = json["nationality"];
    image = json["profile_image"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "username": username,
      "email": email,
      "nationality": nationality,
      "gender": gender,
      "phone": phone,
      "password": password,

    };
  }
}
