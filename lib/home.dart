import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toursim/utils/color_manager.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  List<Map<String,dynamic>> banner = [
    {
    "name":"Cairo",
    "image":"https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
  },
    {
      "name":"Cairo",
      "image":"https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
    {
      "name":"Cairo",
      "image":"https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
    {
      "name":"Cairo",
      "image":"https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
    {
      "name":"Cairo",
      "image":"https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
    {
      "name":"Cairo",
      "image":"https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
    {
      "name":"Cairo",
      "image":"https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
    {
      "name":"Cairo",
      "image":"https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _getContentWidget());
  }

  Widget _getContentWidget() => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25,),
            _getBannersWidget(banner),
            _getStoresWidget(banner),
          ],
        ),
      );


  Widget _getBannersWidget(List<Map<String,dynamic>> banners) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.darkYellow,
          borderRadius: BorderRadius.circular(12),
          border:  Border.all(
            color: ColorsManager.primary,
            width: 3,
          ),
        ),
      child: CarouselSlider(
        items: List.generate(banners.length, (index) => SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                color: ColorsManager.primary,
                width: 3,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                banner[index]["image"],
                fit: BoxFit.cover,
              ),
            ),
          ),
        )),
        options: CarouselOptions(
          height: 190,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,

        ),
      ),
    );
  }


  Widget _getStoresWidget(List<Map<String,dynamic>>  stores) => GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 1,
    mainAxisSpacing: 0,
    childAspectRatio: 1.1,
    physics: const ScrollPhysics(),
    shrinkWrap: true,
    padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 10),
    children: List.generate(stores.length, (index) {
      return InkWell(
        onTap: () {
          Get.toNamed("/govDetails");
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
              ),),
          ],
        ),

      );
    }),
  );
}
