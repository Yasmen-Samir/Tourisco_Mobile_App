class Person {
  late String username;
  late String email;
  late String phone;
  late String nationality;
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
    username = json["username"];
    email = json["email"];
    phone = json["phone"];
    gender = json["gender"];
    password = json["password"];
    nationality = json["nationality"];
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
