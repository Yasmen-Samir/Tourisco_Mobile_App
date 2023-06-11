import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toursim/models/category_model.dart';
import 'package:toursim/models/event_model.dart';
import 'package:toursim/models/gov.dart';
import 'package:toursim/models/gov_details.dart';
import 'package:toursim/models/landmark_model.dart';
import 'package:toursim/models/place_model.dart';
import 'package:toursim/models/ticket_model.dart';

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

  void getLandMarkForGov(int id) {
    DioHelper.getData(urlPath: ApiUrl.getLandMarkForGov(id))
        .then((value) {
      print("==============Hello================");
      landmarks = List.from(value.data.map((e) => LandMarkModel.fromJson(e)));
      print("==============landmarks================");

      update();
    });
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

}
