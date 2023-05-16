import 'package:get/get.dart';
import 'package:toursim/controller/Auth_controller.dart';
import 'package:toursim/controller/home_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(),fenix: true);
    Get.lazyPut(() => HomeController(),fenix: true);
  }
}

