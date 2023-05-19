import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toursim/models/gov_details.dart';
import 'package:toursim/models/landmark_model.dart';
import 'package:toursim/core/utils/strings_manager.dart';

import '../controller/gov_details_controller.dart';
import '../core/utils/assets_manager.dart';
import '../core/utils/color_manager.dart';
import '../network/remote/api_url.dart';

class GovDetails extends StatelessWidget {
  //late int govId;
   GovDetailsModel govDetails = Get.arguments as GovDetailsModel;
  GovDetails({ Key? key}) : super(key: key);


  List<Map<String,dynamic>> banner = [
    {
      "name":"Egyptian Musium",
      "image":"https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
    {
      "name":"Egyptian Musium",
      "image":"https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },

  ];
  List<Map<String,dynamic>> single = [
    {
      "name":"Helwan Eye",
      "image":"https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },

  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GovDetailsController>(
      init: GovDetailsController()..getLandMarkForGov(govDetails.gov.id),
      builder: (controller) {
        return Scaffold(
              appBar: AppBar(
                systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
                elevation: 0,
                leading: IconButton(
                  onPressed: (){
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                backgroundColor: ColorsManager.darkYellow,
                title:  Text(govDetails.title,),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: ColorsManager.darkYellow,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                        padding: const EdgeInsetsDirectional.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child:CachedNetworkImage(
                            placeholder: (context, url) => Image.asset(
                              ImagesManager.loading2,
                            ),
                            imageUrl:  "${ApiUrl.baseLink}${govDetails.gov.emblem}",
                            fit: BoxFit.fitWidth,
                            width: double.infinity,
                            height: 200,
                          ),
                        ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(AppStrings.about.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(govDetails.description,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),),
                    ),
                    _buildTitle("CULTURAL TOURISM"),
                    _buildLandmarkWidget(controller.landmarks),
                    _buildTitle("ENTERTAINMENT TOURISM"),
                    _buildLandmarkWidget(controller.landmarks),
                    _buildTitle("MEDICAL TOURISM"),
                    _buildLandmarkWidget(controller.landmarks),
                    _buildTitle("ECO TOURISM"),
                    _buildLandmarkWidget(controller.landmarks),
                  ],
                ),
              ),
            );
      }
    );

  }
  Widget _buildTitle(String title)=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 50,
      width: double.infinity,
      decoration:BoxDecoration(
        color: ColorsManager.darkYellow,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorsManager.brown,
            width: 3),
      ),
      child:  Center(
        child: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18.0,
          ),),
      ),
    ),
  );

  Widget _buildLandmarkWidget(List<LandMarkModel>  landMarks) => GridView.count(
    crossAxisCount:landMarks.length==1?1: 2,
    crossAxisSpacing: 1,
    mainAxisSpacing: 0,
    childAspectRatio:landMarks.length==1?2.4:1.2,
    physics: const ScrollPhysics(),
    shrinkWrap: true,
    padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 10),
    children: List.generate(landMarks.length, (index) {
      return InkWell(
        onTap: () {
          Get.toNamed("/placeDetails",arguments: landMarks[index]);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: ColorsManager.primary,
                  width: 3,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  CachedNetworkImage(
                  placeholder: (context, url) => Image.asset(
                    ImagesManager.loading1,
                  ),
                  imageUrl: "${ApiUrl.baseLink}${landMarks[index].landMark.image}",
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Text(landMarks[index].landMark.name.replaceAll("_", " "),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),),
          ],
        ),

      );
    }),
  );

}
