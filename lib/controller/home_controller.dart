
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:toursim/componats/componants.dart';
import 'package:toursim/helper/constants.dart';
import 'package:toursim/models/gov.dart';
import 'package:toursim/models/gov_details.dart';
import 'package:toursim/models/person.dart';

import '../network/remote/api_url.dart';
import '../network/remote/dio_helper.dart';
import 'constant.dart';

class HomeController extends GetxController {

 @override
  onInit(){
   super.onInit();
   getAllGovs(language);
   getUserData();
 }
RxBool isDark=false.obs;

 void changeMode(){
     isDark.value=!isDark.value;
     update();
 }

 RxBool isEnglish=true.obs;
 Future<void> changeLang(bool isEnglish) async {
   if(isEnglish) {
     language="en";
   }else{
     language="ar";
   }
   print(language);
   this.isEnglish.value=isEnglish;
     update();
   getAllGovs(language);

 }


 List<GovDetailsModel> govs=[];
  Future<void> getAllGovs(String lan) async {
    print("=================");
    await DioHelper.getData(urlPath: ApiUrl.govAllGovs())
        .then((value) {
          print(value.data);
      govs=List.from(value.data.map((e)=>GovDetailsModel.fromJson(e)));
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
