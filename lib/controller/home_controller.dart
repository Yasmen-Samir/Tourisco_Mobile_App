
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:toursim/componats/componants.dart';
import 'package:toursim/models/gov.dart';
import 'package:toursim/models/person.dart';

import '../network/remote/api_url.dart';
import '../network/remote/dio_helper.dart';
import 'constant.dart';

class HomeController extends GetxController {

 @override
  onInit(){
   super.onInit();
   getGov();
   getUserData();
 }
RxBool isDark=false.obs;

 void changeMode(){
     isDark.value=!isDark.value;
     update();
 }
 void updateSystemOverlayStyle(bool isDark) {
   FlutterStatusbarcolor.setStatusBarWhiteForeground(isDark);
   update();
 }


 List<Gov> govs=[];
  void getGov() {
    DioHelper.getData(urlPath: ApiUrl.governorates)
        .then((value) {
      govs=List.from(value.data.map((e)=>Gov.fromJson(e)));
      print(govs[0].name);
      update();
    }).catchError((error){
      print(error);
    });
  }

  void getUserData() {
    DioHelper.getData(urlPath: ApiUrl.userData(myId!))
        .then((value) {
      myPerson=Person.fromJson(value.data);
      update();
    });
  }


}
