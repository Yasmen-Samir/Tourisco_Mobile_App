

import 'package:get/get.dart';
import 'package:toursim/models/gov.dart';
import 'package:toursim/models/gov_details.dart';
import 'package:toursim/models/landmark_model.dart';

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

  List<LandMarkModel> landmarks=[];
  void getLandMarkForGov(int id) {
    DioHelper.getData(urlPath: ApiUrl.getLandMarkForGov(id))
        .then((value) {
          print(value.data);
      landmarks=List.from(value.data.map((e)=>LandMarkModel.fromJson(e)));
      update();
    });
  }


}
