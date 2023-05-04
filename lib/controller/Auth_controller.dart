
import 'dart:convert';

import 'package:get/get.dart';
import 'package:toursim/componats/componants.dart';

import '../network/remote/api_url.dart';
import '../network/remote/dio_helper.dart';
import 'constant.dart';

class AuthController extends GetxController {

  void createUser() {
    DioHelper.postData(urlPath: ApiUrl.createUser, data: myPerson!.toMaP())
        .then((value) {
      Get.offNamed("/homeView");

      print(value);
    })
        .catchError((error) {
      if (error.response != null) {
        final errorJson = json.decode(error.response.toString());
        final errorMessages = <String>[];

        errorJson.forEach((key, value) {
          final fieldErrors = value.map((error) => error.toString()).toList();
          final fieldErrorMessage = '$key ${fieldErrors.join(', ')}';
          errorMessages.add(fieldErrorMessage);
        });

        final errorMessage = errorMessages.join('\n');
        print(errorMessage);
        showToast(message: errorMessage, state: ToastState.warning);
        update();
      }
    });
  }

  Rx<bool> isPasswordVisible = true.obs;
  void visibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Rx<bool> isConfirmPasswordVisible = true.obs;

  void confirmVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Rx<bool> loginPage = true.obs;

  void changePage(bool isLogin) {
    loginPage.value = isLogin;
  }

  Rx<bool> isMale = true.obs;

  void changeGender(bool isMale) {
    this.isMale.value = isMale;
  }
  @override
  void onClose() {
    super.onClose();
  }
}
