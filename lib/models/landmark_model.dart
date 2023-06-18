

import 'dart:io';

import 'package:dio/dio.dart';

class LandMarkModel {
  late int id;
  late String title;
   String? founder;
  late String address;
  late String description;
  late String created;
  late bool active;
  late LandMark landMark;

  LandMarkModel(
      {
        required this.id,
      required this.title,
       this.founder,
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

}

class LandMark {
  late int id;
  late String name;
  late String image;
  late double area;
  late int tourismCategoryObject;
  late int userCreatedBy;
  late List<ImageModel> images;
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
    area = json["area"];
    tourismCategoryObject = json["tourismCategoryObject"]??1;
    userCreatedBy = json["user_created_by"];
    images = List.from(json["images"].map((e)=>ImageModel.fromJson(e)));
    reviews =List.from(json["reviews"].map((e)=>e.toString()));
  }


}

class ImageModel{
  late int id;
  late String image;
  late String created;
  late int userObject;
  late bool active;

  ImageModel(this.id, this.userObject, this.image, this.created, this.active);

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    created = json["created"];
    userObject = json["userObject"];
    active = json["active"];
  }
}

class LandMarkCreateModel {
  late String name;
  late String title;
  late String address;
  late String area;
  late String govObject;
  late String locationLink;
  late String foundationDate;
  late String founder;
  late String description;
  late String tourismCategoryObject;

  LandMarkCreateModel(
      {
        required this.name,
      required this.title,
      required this.address,
      required this.area,
      required this.govObject,
      required this.locationLink,
      required this.foundationDate,
      required this.founder,
      required this.description,
      required this.tourismCategoryObject});

  Map<String, String> toMaP() {
    return {
      "name":name,
      "title":title,
      "address":address,
      "area": area,
      "govObject": govObject,
      "location_link": locationLink,
      "foundationDate": foundationDate,
      "founder": founder,
      "description": description,
      "tourismCategoryObject": tourismCategoryObject,
    };
  }
}
