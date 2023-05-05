
import 'dart:convert';

import 'package:get/get.dart';
import 'package:toursim/componats/componants.dart';
import 'package:toursim/network/local/cache_helper.dart';

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

  void loginUser({
  required String email,
  required String password,
}) {
    DioHelper.postData(urlPath: ApiUrl.loginUser,
        data:{
        "email":email,
        "password":password
    }).then((value) {
      if(value.statusCode==200){
        decoder(value.data["access"]);
        update();
        print("doneeeeeeeeee");
      }else{
        showToast(message: "Invalid Email Or Password", state: ToastState.error);
      }

    }).catchError((error) {
      showToast(message: "Error Invalid Email Or Password", state: ToastState.error);

      print("error==========$error");
    });
  }

  void decoder(String token){

    List<String> tokenParts = token.split('.');
    String payload = tokenParts[1];

    String normalizedPayload = base64Url.normalize(payload);
    String decodedPayload = utf8.decode(base64Url.decode(normalizedPayload));

    Map<String, dynamic> payloadMap = json.decode(decodedPayload);

    myId=payloadMap['user_id'];
    print(payloadMap['user_id']);
    CacheHelper.saveData(key: "myId", value: myId);
    Get.offNamed("/homeView");
  }


   Future<dynamic> getUserInfo(String token) async {
     DioHelper.getData(urlPath: ApiUrl.loginUser,token: token)
         .then((value) {
       var v= json.decode(value.data["access"]);
       print(v);
     })
         .catchError((error) {
       print("error==========$error");

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
