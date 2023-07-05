import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toursim/helper/constant.dart';
import 'package:toursim/controller/gov_details_controller.dart';
import 'package:toursim/core/componants/componants.dart';

import 'package:dio/dio.dart' as dioo;

import '../network/remote/api_url.dart';
import '../network/remote/dio_helper.dart';

class AddReviewController extends GetxController {


  File? image;

  Future<void> getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    update();
  }
  void removeImage() async {
    image = null;
    update();
  }


  bool loadingCreate=false;
  bool doneCreate=false;
  Future<void> addReview({
    required int id,
    required int govId,
    String? comment,
    }) async {
    var headers = {
      'Authorization': 'Bearer $myAccess'
    };
    loadingCreate=true;
    update();


    var dio = Dio();
    var formData = dioo.FormData.fromMap({
      "rating":rating.toDouble(),
      "comment":comment,
    });
    if(image!=null) {
      formData.files.add(
      MapEntry(
        "image_list",
        await dioo.MultipartFile.fromFile(
          image!.path,
          filename: image!.path.split("/").last,
        ),
      ),
    );
    }

     await  dio.post(ApiUrl.addReviewByIdWithBase(id),
        data: formData,
        options: Options(headers: headers),
      ).then((value){
       loadingCreate=false;
       image=null;
       rating=0;
       Get.find<GovDetailsController>().getLandMarkForGov(govId);
     }).catchError((error){
       loadingCreate=false;
       if(error is DioError){
          showToast(message: error.response.toString().replaceAll(",", "\n"), state: ToastState.error);
        }
       });

     update();

  }


  int rating=0;
  void setRating(int value) {
      rating = value;
   update();
  }



}
