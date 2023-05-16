import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toursim/controller/home_controller.dart';
import 'package:toursim/core/utils/strings_manager.dart';
import 'package:toursim/models/gov.dart';
import 'package:toursim/models/gov_details.dart';
import 'package:toursim/network/remote/api_url.dart';
import 'package:toursim/presntation/drawer.dart';
import '../core/utils/assets_manager.dart';
import '../core/utils/color_manager.dart';

class HomeView extends GetWidget<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            title:  Text(AppStrings.home.tr),
            leading: IconButton(
              onPressed:(){
                scaffoldKey.currentState?.openDrawer();
              } ,
              icon: const Icon(Icons.menu),
            ),
          ),
          drawer:const DrawerNav() ,
            body: controller.govs.isNotEmpty?_getContentWidget(controller)
                :const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _getContentWidget(HomeController controller) => SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25,),
            _getBannersWidget(controller.govs),
            _getStoresWidget(controller.govs),
          ],
        ),
      );


  Widget _getBannersWidget(List<GovDetailsModel> banners) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.lightGray,
          borderRadius: BorderRadius.circular(12),
          border:  Border.all(
            color: ColorsManager.lightGray,
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
              child: CachedNetworkImage(
                placeholder: (context, url) => Image.asset(
                  ImagesManager.loading2,
                ),
                imageUrl:  "${ApiUrl.baseLink}${banners[index].gov.emblem}",
                fit: BoxFit.cover,
                height: 110,
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


  Widget _getStoresWidget(List<GovDetailsModel>  stores) => GridView.count(
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
          Get.toNamed("/govDetails",arguments: stores[index]);
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
                child:
                CachedNetworkImage(
                  placeholder: (context, url) => Image.asset(
                    ImagesManager.loading1,
                  ),
                  imageUrl: "${ApiUrl.baseLink}${stores[index].gov.emblem}",
                  fit: BoxFit.cover,
                  height: 110,
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Text(stores[index].title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),),
          ],
        ),

      );
    }),
  );
}
