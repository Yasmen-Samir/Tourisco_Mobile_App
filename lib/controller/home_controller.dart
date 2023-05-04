
import 'dart:convert';

import 'package:get/get.dart';
import 'package:toursim/componats/componants.dart';
import 'package:toursim/models/gov.dart';

import '../network/remote/api_url.dart';
import '../network/remote/dio_helper.dart';
import 'constant.dart';

class HomeController extends GetxController {

 @override
  onInit(){
   super.onInit();
   getGov();
 }
  List<Gov> govs  =[];
  void getGov() {
    DioHelper.getData(urlPath: ApiUrl.governorates)
        .then((value) {
      govs=List.from(value.data.map((e)=>Gov.fromJson(e)));
      print(govs[0].name);
      update();
    });
  }


}
