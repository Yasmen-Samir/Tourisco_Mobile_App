import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toursim/utils/color_manager.dart';
import 'package:toursim/utils/strings_manager.dart';

class GovDetails extends StatelessWidget {
  GovDetails({Key? key}) : super(key: key);

  Map<String, dynamic> gov = {
    "name": "Cairo",
    "image": "https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    "about": "Located on the banks of the Nile River ,Cairo is Africa\'s largest city, as well as the largest city in the Arab world. In the course of its thousand-year history it has been the capital of the great Egyptian dynasties of the Middle Ages, a British colonial enclave, and a modern industrialized city. ",
  };
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ColorsManager.darkYellow,
        title: Text(gov["name"],),
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
                padding: EdgeInsetsDirectional.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(gov["image"],
                  height: 120,
                  width: double.infinity,
                    fit: BoxFit.fitWidth,
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
              child: Text(gov["about"],
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
