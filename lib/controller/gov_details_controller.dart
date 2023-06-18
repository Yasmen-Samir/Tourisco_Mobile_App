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
import 'package:toursim/models/place_model.dart';
import 'package:toursim/models/ticket_model.dart';
import 'package:dio/dio.dart' as dioo;
import 'package:http/http.dart'as http;

import '../network/remote/api_url.dart';
import '../network/remote/dio_helper.dart';

class GovDetailsController extends GetxController {

  @override
  onInit() {
    super.onInit();
  }

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
    DioHelper.getData(urlPath: ApiUrl.getLandMarkForGov(id))
        .then((value) {
      print("==============Hello================");
      landmarks = List.from(value.data.map((e) => LandMarkModel.fromJson(e)));
      print("==============landmarks================");

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
      print("============${events.length}===================");
      for (var element in events) {
        element.ticketModel = await getTicketForEvent(element.id);
      }
      update();
    });
  }

  Future<TicketModel?> getTicketForEvent(int id) {
    return DioHelper.getData(urlPath: ApiUrl.getTicketForEvent(id))
        .then((value) {
      print(value.data);
      return TicketModel.fromJson(value.data);
    });
  }

  List<CategoryModel> categories = [];

  void getAllCategories() {
    DioHelper.getData(urlPath: ApiUrl.tourismCategories)
        .then((value) {
      print(value.data);
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

  void addPlace({
    required String name,
    required String address,
    required double area,
    required String location,
    required int tourismCategory,
    required String foundationDate,
    required String founder,
    required String description,
  }) {
    PlaceModel model = PlaceModel(name: name,
        founder: founder,
        address: address,
        description: description,
     );
    DioHelper.postData(
      urlPath: ApiUrl.landmarks, data:model.toMaP(),
    );
  }

  Future<void> createLandMark(LandMarkCreateModel model) async {
    var headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg3NjMwMjM1LCJpYXQiOjE2ODY3NjYyMzUsImp0aSI6IjQ2YmYyNTY1N2NiMzQ5MDlhMDc5N2M4ZjcyNTcyNDg3IiwidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJzdXBlcl9hZG1pbiIsImVtYWlsIjoiYWRtaW5AYWRtaW4uY29tIiwiZ2VuZGVyIjoibWFsZSIsImlzX3ZlcmlmaWVkIjp0cnVlLCJpc19hY3RpdmUiOnRydWV9.Yf_btE5fCDPr0lR8cqSA8b0NXaiwMXBBdI0TCdm2CBc'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://tourisco.onrender.com/api/landmarks/'));
    request.fields.addAll(model.toMaP());
    request.files.add(await http.MultipartFile.fromPath(image!.path.split("/").last, image!.path));
    request.headers.addAll(headers);
  await request.send().then((value){

    if(value.statusCode==200){
      print(value.reasonPhrase);

    }else{
      print(value.reasonPhrase);
    }
  }).catchError((error){
    print(error);

  });




  }


  bool loadingCreate=false;
  bool doneCreate=false;
  Future<void> createLandMarkDio(LandMarkCreateModel model) async {
    var headers = {
      'Authorization': 'Bearer $myAccess'
    };
    loadingCreate=true;
    update();
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
 var headers= {
      'X-RapidAPI-Key': '3451c6c973mshb4d44a4d48fe1e7p12b902jsn70467bcbb868',
    'X-RapidAPI-Host': 'booking-com.p.rapidapi.com'
  };
    var dio=Dio();
     await  dio.get(ApiUrl.hotels,
        queryParameters: {
          "locale": 'en-us',
          "name": city,
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
       if(error is DioError){
         print(error.response);
         showToast(message: error.response.toString().replaceAll(",", "\n"), state: ToastState.error);
        }
       });

     update();

  }


}
