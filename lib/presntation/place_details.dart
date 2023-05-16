import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toursim/models/landmark_model.dart';
import '../core/utils/assets_manager.dart';
import '../core/utils/color_manager.dart';
import '../network/remote/api_url.dart';
import '../core/utils/strings_manager.dart';

class PlaceDetails extends StatelessWidget {
  PlaceDetails({Key? key}) : super(key: key);
  late LandMarkModel model= Get.arguments ;
  List<Map<String, dynamic>> banner = [
    {
      "name": "Egyptian Musium",
      "image": "https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
    {
      "name": "Egyptian Musium",
      "image": "https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
    {
      "name": "Egyptian Musium",
      "image": "https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
    {
      "name": "Egyptian Musium",
      "image": "https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
  ];
  List<Map<String, dynamic>> single = [
    {
      "name": "Helwan Eye",
      "image": "https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ColorsManager.darkYellow,
        title: Text(
          model.landMark.name.replaceAll("_", " "),
        ),
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
                    ImagesManager.loading1,
                  ),
                  imageUrl: "${ApiUrl.baseLink}${model.landMark.image}",
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.about.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                model.description,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "TICKET PRICE",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            Divider(
              color: Colors.blue,
              height: 30,
              indent: MediaQuery.of(context).size.width * .32,
              endIndent: MediaQuery.of(context).size.width * .32,
              thickness: 2,
            ),
            Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Image.asset(
                  ImagesManager.ticket1,
                )),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Foreigner:\n'
                'Adults: 200 EGP / Students: 100 EGP\n'
                '\n'
                'Commemorative photography without \n'
                'flash: 50 EGP\n'
                '\n'
                'Filming memorial video: 300 EGP\n'
                '\n'
                'Egyptian/Arabic tour guide:\n'
                '  Adults: 30 EGP / Students: 10 EGP\n'
                '\n'
                'Commemorative photography without \n'
                'flash: 20 EGP\n'
                '\n'
                'Filming memorial video: 300 EGP\n'
                '\n'
                'Audio guide: 30 EGP\n'
                'Free entry for children up to 6 years old',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "WORKING HOURS",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            Divider(
              color: Colors.blue,
              height: 30,
              indent: MediaQuery.of(context).size.width * .32,
              endIndent: MediaQuery.of(context).size.width * .32,
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsetsDirectional.all(5),
                decoration:BoxDecoration(
                  color: ColorsManager.lightGray,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorsManager.darkGray,
                      width: 3),
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("09:00 AM - 05:00 PM",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18.0,
                      ),),
                    Text("Sunday - \nFriday",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18.0,
                      ),),

                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "GALLERY",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            Divider(
              color: Colors.blue,
              height: 30,
              indent: MediaQuery.of(context).size.width * .4,
              endIndent: MediaQuery.of(context).size.width * .4,
              thickness: 2,
            ),
            _getStoresWidget(banner),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Ratings and reviews",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            Divider(
              color: Colors.blue,
              height: 30,
              indent: MediaQuery.of(context).size.width * .3,
              endIndent: MediaQuery.of(context).size.width * .3,
              thickness: 2,
            ),
            const SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
  Widget _getStoresWidget(List<Map<String,dynamic>>  stores) => GridView.count(
    crossAxisCount:stores.length==1?1: 2,
    crossAxisSpacing: 1,
    mainAxisSpacing: 20,
    childAspectRatio:stores.length==1?2.2:1.09,
    physics: const ScrollPhysics(),
    shrinkWrap: true,
    padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 10),
    children: List.generate(stores.length, (index) {
      return CircleAvatar(
        radius: 75,
        backgroundColor: ColorsManager.gray,
        child: CircleAvatar(
          radius: 75,
          backgroundImage: NetworkImage(
            stores[index]["image"],
          ),
        ),
      );
    }),
  );

}
