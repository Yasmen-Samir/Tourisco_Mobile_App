import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleWare extends GetMiddleware{

  @override
  RouteSettings? redirect(String? route) {
    return const RouteSettings(name: "/home");
  }
}