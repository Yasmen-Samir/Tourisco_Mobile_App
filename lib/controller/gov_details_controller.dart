

import 'package:get/get.dart';
import 'package:toursim/models/gov.dart';
import 'package:toursim/models/gov_details.dart';

import '../network/remote/api_url.dart';
import '../network/remote/dio_helper.dart';

class GovDetailsController extends GetxController {

 @override
  onInit(){
   super.onInit();
 }
   GovDetails? govs ;
  void getGovDetails(int id) {
    DioHelper.getData(urlPath: ApiUrl.govDetails(id))
        .then((value) {
      govs=GovDetails.fromJson(value.data);
      update();
    });
  }


}
