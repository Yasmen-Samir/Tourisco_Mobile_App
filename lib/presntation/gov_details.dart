import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toursim/utils/color_manager.dart';
import 'package:toursim/utils/strings_manager.dart';

import '../controller/gov_details_controller.dart';
import '../network/remote/api_url.dart';
import '../utils/assets_manager.dart';

class GovDetails extends StatelessWidget {
  late int govId;
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
    govId = Get.arguments as int;
    return GetBuilder<GovDetailsController>(
        init: GovDetailsController()..getGovDetails(govId),
        builder: (controller) {
        return controller.govs!=null ?Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            backgroundColor: ColorsManager.darkYellow,
            title:  Text(controller.govs!.title,),
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
                        imageUrl:  "${ApiUrl.baseLink}${controller.govs!.gov.emblem}",
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        height: 200,
                      ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppStrings.about.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(controller.govs!.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),),
                ),
                _buildTitle("CULTURAL TOURISM"),
                _getStoresWidget(banner),
                _buildTitle("ENTERTAINMENT TOURISM"),
                _getStoresWidget(banner),
                _buildTitle("MEDICAL TOURISM"),
                _getStoresWidget(single),
                _buildTitle("ECO TOURISM"),
                _getStoresWidget(banner),
              ],
            ),
          ),
        ):const Scaffold(body: Center(child: CircularProgressIndicator()));
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
  Widget _getStoresWidget(List<Map<String,dynamic>>  stores) => GridView.count(
    crossAxisCount:stores.length==1?1: 2,
    crossAxisSpacing: 1,
    mainAxisSpacing: 0,
    childAspectRatio:stores.length==1?2.4:1.2,
    physics: const ScrollPhysics(),
    shrinkWrap: true,
    padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 10),
    children: List.generate(stores.length, (index) {
      return InkWell(
        onTap: () {
          Get.toNamed("/placeDetails");
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
                child: Image.network(
                  stores[index]["image"],
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Text(stores[index]["name"],
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
