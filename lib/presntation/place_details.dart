import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toursim/componats/componants.dart';
import 'package:toursim/controller/add_review.dart';
import 'package:toursim/controller/gov_details_controller.dart';
import 'package:toursim/controller/home_controller.dart';
import 'package:toursim/core/componants/componants.dart';
import 'package:toursim/core/componants/my_button.dart';
import 'package:toursim/models/event_model.dart';
import 'package:toursim/models/landmark_model.dart';
import '../core/utils/assets_manager.dart';
import '../core/utils/color_manager.dart';
import '../network/remote/api_url.dart';
import '../core/utils/strings_manager.dart';

class PlaceDetails extends StatelessWidget {
  PlaceDetails({required this.model,
    required this.govId,
    Key? key}) : super(key: key);
  late LandMarkModel model;
  final int govId;

  List<Map<String, dynamic>> single = [
    {
      "name": "Helwan Eye",
      "image": "https://ychef.files.bbci.co.uk/976x549/p07zy3y6.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
   Get.find<GovDetailsController>()
      ..getEventForLandMark(model.landMark.id)
      ..getHotels(model.landMark.name.replaceAll("_", " "));
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
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      Image.asset(
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
              height: 50,
            ),
            const Text(
              "Events",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            Divider(
              color: Colors.blue,
              height: 30,
              indent: MediaQuery
                  .of(context)
                  .size
                  .width * .32,
              endIndent: MediaQuery
                  .of(context)
                  .size
                  .width * .32,
              thickness: 2,
            ),
            const SizedBox(
              height: 40,
            ),
            _getEvents(),
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
              indent: MediaQuery
                  .of(context)
                  .size
                  .width * .4,
              endIndent: MediaQuery
                  .of(context)
                  .size
                  .width * .4,
              thickness: 2,
            ),
            _getGalleryWidget(model.landMark.images,75),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Hotels",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            Divider(
              color: Colors.blue,
              height: 30,
              indent: MediaQuery
                  .of(context)
                  .size
                  .width * .4,
              endIndent: MediaQuery
                  .of(context)
                  .size
                  .width * .4,
              thickness: 2,
            ),
            _buildHotels(context),
            const SizedBox(
              height: 20,
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
              indent: MediaQuery
                  .of(context)
                  .size
                  .width * .3,
              endIndent: MediaQuery
                  .of(context)
                  .size
                  .width * .3,
              thickness: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<GovDetailsController>(
              builder: (controller) {
                return _buildReviews(controller.getLandmarkById(model).landMark.reviews);
              }
            ),
            const SizedBox(
              height: 20,
            ),
            _addReview(context,model.landMark.id),
            const SizedBox(
              height: 200,
            ),

          ],
        ),
      ),
    );
  }
  _fromImage(context, controller) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            backgroundColor:
            Theme
                .of(context)
                .scaffoldBackgroundColor
                .withOpacity(.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(
                color: Theme
                    .of(context)
                    .iconTheme
                    .color!,
              ),
            ),
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsPadding: const EdgeInsets.all(20.0),
            elevation: 20.0,
            title: Text(
              'Choose Source :',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
              textAlign: TextAlign.center,
            ),
            actions: [
              OutlinedButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.photo,
                      color: Theme
                          .of(context)
                          .iconTheme
                          .color!,
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      "From Gallery",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,
                    ),
                  ],
                ),
                onPressed: () {
                  controller.getImage(ImageSource.gallery).then((value) {
                    Navigator.pop(context);
                  });
                },
              ),
              OutlinedButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: Theme
                          .of(context)
                          .iconTheme
                          .color!,
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      "From Camera",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,
                    ),
                  ],
                ),
                onPressed: () {
                  controller.getImage(ImageSource.camera).then((value) {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
    );
  }

Widget _addReview(BuildContext context,int ladMarkId){
    return GetBuilder<AddReviewController>(
      init: AddReviewController(),
        builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "add Ration: ${controller.rating}",
                    style:Theme.of(context).textTheme.bodyMedium,
                  ),
                  _star(1,controller),
                  _star(2,controller),
                  _star(3,controller),
                  _star(4,controller),
                  _star(5,controller),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  myFromField(context: context, controller: _addReviewController,
                    minLines: 4,
                    maxLines: 5,
                    labelText: "Add Review",
                    fillColor: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      _fromImage(context, controller);
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
              if(controller.image != null)
                Container(
                  width: double.infinity,
                  height: 120,
                  margin: const EdgeInsetsDirectional.all(8),
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      border: Border.all(
                        color: Theme.of(context).iconTheme.color!,
                      )

                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Image.file(
                        controller.image!,
                        fit: BoxFit.cover,
                      ),
                      Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: IconButton(
                              onPressed: () {
                                controller.removeImage();
                              },
                              icon: CircleAvatar(
                                  backgroundColor: Colors.grey.shade400,
                                  child: const Icon(Icons.clear)))),
                    ],
                  ),
                ),
              const SizedBox(
                height: 30,
              ),
              condition(
                condition: !controller.loadingCreate,
                child: myElevatedButton(title: "add Review", onPressed: (){
                controller.addReview(
                  id: ladMarkId,
                govId: govId,
                comment: _addReviewController.text,);
                _addReviewController.clear();
                }),
              ),
            ],
          ),
        );
      }
    );
}
Widget _star(int num,controller)=>SizedBox(
  height: 30,
  width: 30,
  child: IconButton(
    padding: EdgeInsets.zero,
    icon: const Icon(Icons.star_rate_rounded),
    onPressed: () => controller.setRating(num),
    color: controller.rating >= num ? Colors.yellow : null,
  ),
);
  Widget _buildHotels(context) =>
      GetBuilder<GovDetailsController>(
          builder: (controller) {
            return GridView.count(
              crossAxisCount: controller.hotels.length == 1 ? 1 : 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 0,
              childAspectRatio: controller.hotels.length == 1 ? 2.1 : 1.0,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              children: List.generate(controller.hotels.length, (index) {
                return Column(
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
                        child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              Image.asset(
                                ImagesManager.loading1,
                              ),
                          imageUrl: controller.hotels[index].imageUrl,
                          fit: BoxFit.cover,
                          height: 110,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Expanded(
                      child: Text(controller.hotels[index].name,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Expanded(
                      child: Text(controller.hotels[index].label,
                        style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                );
              }),
            );
          }
      );

  Widget _getGalleryWidget(List<ImageModel> images,double radius) =>
      GridView.count(
        crossAxisCount: images.length == 1 ? 1 : 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 20,
        childAspectRatio: images.length == 1 ? 2.2 : 1.09,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        children: List.generate(images.length, (index) {
          return CircleAvatar(
            radius: radius+2,
            backgroundColor: ColorsManager.white,
            child: CircleAvatar(
              radius: radius+2,
              backgroundColor: ColorsManager.gray,
              child: CircleAvatar(
                radius: radius,
                backgroundImage: NetworkImage(
                  "${ApiUrl.baseLink}${images[index].image}",
                ),
              ),
            ),
          );
        }),
      );

  Widget _getEvents() =>
      GetBuilder<GovDetailsController>(
          builder: (controller) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.events.length,
              itemBuilder: (context, index) =>
                  _eventItem(context, controller.events[index]),
            );
          }
      );

  Widget _eventItem(context, EventModel model) =>
      Card(
        color:Get.find<HomeController>().isDark.value?ColorsManager.gray:ColorsManager.lightGray,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsetsDirectional.all(20),
          decoration: BoxDecoration(
            color:Get.find<HomeController>().isDark.value?ColorsManager.gray:ColorsManager.lightGray,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color:Get.find<HomeController>().isDark.value?ColorsManager.lightGray:ColorsManager.darkGray,
                width: 3),
          ),
          child: Column(
            children: [
              Text(model.title, style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,),
              const SizedBox(height: 10,),
              Text(AppStrings.createdIn.tr, style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,),
              const SizedBox(height: 5,),
              Text("${model.event.created.split("T")[0]}"
                  "  ${model.event.created.split("T")[1].substring(0, 5)}",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if(model.active)
                    const Icon(Icons.check,
                      color: Colors.green,
                      size: 40,),
                  if(!model.active)
                    const Icon(Icons.not_interested,
                      color: Colors.red,
                      size: 35,),
                  const Spacer(flex: 1),
                  Text(model.active ? AppStrings.active.tr : AppStrings.notActive.tr,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,),
                  const Spacer(flex: 2),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/clook.png"),
                  const Spacer(flex: 1),
                  Column(
                    children: [
                      Text("${AppStrings.openTime.tr} : ${model.event.openTime}",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium,),
                      const SizedBox(height: 5,),
                      Text("${AppStrings.closeTime.tr} : ${model.event.closeTime}",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium,
                      ),
                    ],
                  ),
                  const Spacer(flex: 2),
                ],
              ),
              const SizedBox(height: 20,),
              if(model.tickets!=null)
                Row(
                  children: [
                    Image.asset(
                      ImagesManager.ticket1,
                      width: 80,
                    ),
                    const Spacer(),
                    Text(AppStrings.tickets.tr,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleMedium,
              ),
                    const Spacer(flex: 2,),
                  ],
                ),
              if(model.tickets!=null)
                for(int i=0;i<model.tickets!.length;i++)
                  tickets( context , model, i),


            ],
          ),
        ),
      );

  final TextEditingController _addReviewController=TextEditingController();

Widget tickets(BuildContext context ,EventModel model,int i){
  return  Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      children: [
        Text("${AppStrings.name.tr}:${model.tickets![i].ticket.name}",
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium,),
        Text("${AppStrings.ticketCategory.tr}:${model.tickets![i].ticketCategory}",
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium,),
        Text("${AppStrings.price.tr}: ${model.tickets![i].ticket.price}",
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium,),
        Text(
          "${AppStrings.createdIn.tr}: ${model.tickets![i].ticket.created.split(
              "T")[0]}"
              "  ${model.tickets![i].ticket.created.split("T")[1]
              .substring(0, 5)}",
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium!.copyWith(
            fontSize: 16,
          ),),
        const Divider(color: ColorsManager.primary,thickness: 3),
      ],
    ),
  );
}

  Widget _buildReviews(List<Review> reviews) =>
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: reviews.length,
        itemBuilder: (context, index) =>
            _reviewItem(context, reviews[index]),
      );

  Widget _reviewItem(context, Review review) =>
      Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: SvgPicture.network("${ApiUrl.baseLink}${review.user.profileImage}"),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.user.username,
               style: Theme.of(context).textTheme.titleMedium,),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(Icons.star_rate_rounded,
                          color: review.rating.ceil() >= 1 ? Colors.orange : Colors.black,
                        ),
                        Icon(Icons.star_rate_rounded,
                          color: review.rating.ceil() >= 2 ? Colors.orange : Colors.black,
                        ),
                        Icon(Icons.star_rate_rounded,
                          color: review.rating.ceil() >= 3 ? Colors.orange : Colors.black,
                        ),
                        Icon(Icons.star_rate_rounded,
                          color: review.rating.ceil() >= 4 ? Colors.orange : Colors.black,
                        ),
                        Icon(Icons.star_rate_rounded,
                          color: review.rating.ceil() >= 5 ? Colors.orange : Colors.black,
                        ),


                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Text(review.comment),
            _buildImageReview(review.images),

          ],
        ),
      );

  Widget _buildImageReview(List<ImageModel> images) =>
      GridView.count(
        crossAxisCount: images.length == 1 ? 1 : 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 20,
        childAspectRatio: images.length == 1 ? 3 : 1.09,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        children: List.generate(images.length, (index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: CachedNetworkImage(
              imageUrl: "${ApiUrl.baseLink}${images[index].image}",
              fit: BoxFit.cover,
            ),
          );
        }),
      );

}
