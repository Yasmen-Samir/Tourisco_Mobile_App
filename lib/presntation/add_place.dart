
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:toursim/componats/componants.dart';
import 'package:toursim/controller/gov_details_controller.dart';
import 'package:toursim/core/componants/componants.dart';
import 'package:toursim/core/componants/my_button.dart';
import 'package:toursim/core/utils/color_manager.dart';
import 'package:toursim/core/utils/strings_manager.dart';
import 'package:toursim/models/landmark_model.dart';
import 'package:toursim/presntation/gov_details.dart';
import 'package:toursim/presntation/home.dart';

class AddPlace extends StatelessWidget {
  AddPlace({super.key});

  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _area = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _foundationDate = TextEditingController();
  final TextEditingController _founder = TextEditingController();
  final TextEditingController _description = TextEditingController();
  int govObject=Get.arguments as int;
  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return myScaffoldBackground(
      appBar: AppBar(
        title: Text(AppStrings.addPlace.tr),
      ),
      body: GetBuilder<GovDetailsController>(
          init: GovDetailsController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsetsDirectional.all(10),
                padding: const EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      myFromField(
                          context: context,
                          controller: _name,
                          fillColor: ColorsManager.white,
                          labelText: AppStrings.name.tr,
                          prefix: Icons.drive_file_rename_outline,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return AppStrings.mustNotBeEmpty.tr;
                            }
                            return null;
                          },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      myFromField(
                          context: context,
                          controller: _address,
                          fillColor: ColorsManager.white,
                          labelText: AppStrings.address.tr,
                          prefix: Icons.location_on_outlined,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return AppStrings.mustNotBeEmpty.tr;
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      myFromField(
                          context: context,
                          controller: _area,
                          keyboardType: TextInputType.number,
                          fillColor: ColorsManager.white,
                          labelText: AppStrings.area.tr,
                          prefix: Icons.area_chart_outlined,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return AppStrings.mustNotBeEmpty.tr;
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      myFromField(
                          context: context,
                          controller: _location,
                          fillColor: ColorsManager.white,
                          labelText: AppStrings.location.tr,
                          prefix: Icons.location_on_outlined,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return AppStrings.mustNotBeEmpty.tr;
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            color: ColorsManager.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: DropdownButton(
                            borderRadius: BorderRadius.circular(20),
                            underline: const SizedBox(),
                            hint: Text(AppStrings.tourismCategory.tr),
                            value: controller.selectedCategory,
                            items: List.generate(
                                controller.categories.length,
                                    (index) =>
                                    DropdownMenuItem(
                                        value: controller.categories[index]
                                            .category.id,
                                        child: Text(controller
                                            .categories[index].category.name
                                            .replaceAll("_", " ")))),
                            onChanged: (v) {
                              controller.changeCategory(v);
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 120,
                        decoration: const BoxDecoration(
                          color: ColorsManager.white,
                        ),
                        child: controller.image != null
                            ? Stack(
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
                        )
                            : IconButton(
                          onPressed: () {
                            _fromImage(context, controller);
                          },
                          icon: const Icon(
                            Icons.image_outlined,
                            size: 50,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      myFromField(
                          context: context,
                          controller: _foundationDate,
                          fillColor: ColorsManager.white,
                          labelText: AppStrings.foundationData.tr,
                          prefix: Icons.foundation_outlined,
                          readOnly: true,
                          onTap: (){
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:DateTime.utc(1700,1,1),
                              lastDate:DateTime.now(),
                            ).then((value){
                              _foundationDate.text=Jiffy.parseFromDateTime(value!).format(pattern: "yyyy-MM-dd").toString();
                              print(_foundationDate.text);
                            });
                          },
                          validator: (v) {
                            if (v!.isEmpty) {
                              return AppStrings.mustNotBeEmpty.tr;
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      myFromField(
                          context: context,
                          controller: _founder,
                          fillColor: ColorsManager.white,
                          labelText: AppStrings.founder.tr,
                          prefix: Icons.person_2_outlined,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return AppStrings.mustNotBeEmpty.tr;
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      myFromField(
                          context: context,
                          maxLines: 6,
                          minLines: 5,
                          controller: _description,
                          fillColor: ColorsManager.white,
                          labelText: AppStrings.description.tr,
                          prefix: Icons.chat,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return AppStrings.mustNotBeEmpty.tr;
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 50,
                      ),
                      condition(
                        condition: !controller.loadingCreate,
                        child: myElevatedButton(
                            title: AppStrings.add.tr, onPressed: () {
                              if(_formKey.currentState!.validate()&&controller.image!=null&&controller.selectedCategory!=null) {
                                _dialog(context);
                              }
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
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

  _dialog(context) {
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
            content: Text(
              'admin will approve your information to publish it',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
              textAlign: TextAlign.center,
            ),
            actions: [
              GetBuilder<GovDetailsController>(
                  init: GovDetailsController(),
                  builder: (controller) {
                    return OutlinedButton(
                      child: Text(AppStrings.ok.tr),
                      onPressed: () async {

                        LandMarkCreateModel model = LandMarkCreateModel(
                            name: _name.text.replaceAll(" ", "_"),
                            title: _name.text,
                            address: _address.text,
                            area: _area.text,
                            govObject: "$govObject",
                            locationLink: _location.text,
                            foundationDate: _foundationDate.text,
                            founder: _founder.text,
                            description: _description.text,
                            tourismCategoryObject: "${controller.selectedCategory!}",
                        );
                        controller.createLandMarkDio(model).then((value){
                        });
                        Navigator.pop(context);
                      },
                    );
                  }
              ),
            ],
          ),
    );
  }


}
