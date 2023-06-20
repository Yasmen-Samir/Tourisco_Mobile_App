import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toursim/componats/componants.dart';
import 'package:toursim/controller/constant.dart';
import 'package:toursim/models/category_model.dart';
import 'package:toursim/models/event_model.dart';
import 'package:toursim/models/gov_details.dart';
import 'package:toursim/models/hotel_model.dart';
import 'package:toursim/models/landmark_model.dart';
import 'package:toursim/models/ticket_model.dart';
import 'package:dio/dio.dart' as dioo;

import '../network/remote/api_url.dart';
import '../network/remote/dio_helper.dart';

class GovDetailsController extends GetxController {



  GovDetailsModel? govs;

  void getGovDetails(int id) {
    DioHelper.getData(urlPath: ApiUrl.govDetails(id))
        .then((value) {
      govs = GovDetailsModel.fromJson(value.data);
      update();
    });
  }

  List<LandMarkModel> landmarks = [];
  List<LandMarkModel> landmarksSearch = [];

  void getLandMarkForGov(int id) {
    print("================$id====================");
    DioHelper.getData(urlPath: ApiUrl.getLandMarkForGov(id))
        .then((value) {
      landmarks = List.from(value.data.map((e) => LandMarkModel.fromJson(e)));
      update();
    });
  }
  void search(String text) {
      landmarksSearch=[];
      landmarksSearch.addAll(landmarks.where((element) =>
      element.title.toLowerCase().contains(text.toLowerCase())
          || element.address.toLowerCase().contains(text.toLowerCase())
          || element.created.toLowerCase().contains(text.toLowerCase())
          || element.landMark.name.toLowerCase().contains(text.toLowerCase())
          || element.landMark.area.toString().toLowerCase().contains(text.toLowerCase())
      ));
    update();
  }

  List<EventModel> events = [];

  void getEventForLandMark(int id) {
    DioHelper.getData(urlPath: ApiUrl.getEventForLandMark(id))
        .then((value) async {
      events = List.from(value.data.map((e) => EventModel.fromJson(e)));
      for (var element in events) {
        element.ticketModel = await getTicketForEvent(element.id);
      }
      update();
    });
  }

  Future<TicketModel?> getTicketForEvent(int id) {
    return DioHelper.getData(urlPath: ApiUrl.getTicketForEvent(id))
        .then((value) {
      return TicketModel.fromJson(value.data);
    });
  }

  List<CategoryModel> categories = [];

  void getAllCategories() {
    DioHelper.getData(urlPath: ApiUrl.tourismCategories)
        .then((value) {
      categories = List.from(value.data.map((e) => CategoryModel.fromJson(e)));
      update();
    });
  }

  int? selectedCategory;

  void changeCategory(int? id) {
    selectedCategory = id;
    update();
  }

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
  Future<void> createLandMarkDio(LandMarkCreateModel model) async {
    var headers = {
      'Authorization': 'Bearer $myAccess'
    };
    loadingCreate=true;
    update();
    DioHelper.postData(urlPath: ApiUrl.landmarksWithBase, data: model.toMaP());

    var dio = Dio();
    var formData = dioo.FormData.fromMap(model.toMaP());
    formData.files.add(
      MapEntry(
        "image",
        await dioo.MultipartFile.fromFile(
          image!.path,
          filename: image!.path.split("/").last,
        ),
      ),
    );

     await  dio.post(ApiUrl.landmarksWithBase,
        data: formData,
        options: Options(headers: headers),
      ).then((value){
       loadingCreate=false;
       Get.offAllNamed("/homeView");
     }).catchError((error){
       loadingCreate=false;
       if(error is DioError){
          showToast(message: error.response.toString().replaceAll(",", "\n"), state: ToastState.error);
        }
       });

     update();

  }


  List<HotelModel> hotels=[];
  Future<void> getHotels(String city) async {
    hotels=[];
    print("=================$city===========================");
 var headers= {
      'X-RapidAPI-Key': 'e0e9dafe7bmsh71855364bd99b80p14a6c6jsn6c0e4be0f513',
    'X-RapidAPI-Host': 'booking-com.p.rapidapi.com'
  };
    var dio=Dio();
     await  dio.get(ApiUrl.hotels,
        queryParameters: {
          "locale": 'en-us',
          "name": city.toLowerCase(),
        },
        options: Options(headers: headers,),
      ).then((value){
        hotels=List.from(value.data.map((e){
          if(e["dest_type"]=="hotel"){
            return HotelModel.fromJson(e);
          }
        }));
        print(hotels);
     }).catchError((error){
       print("=================Error===========================");
       if(error is DioError){
         print(error.response);
         showToast(message: error.response.toString().replaceAll(",", "\n"), state: ToastState.error);
        }
       });

     update();

  }


}
