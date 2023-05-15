import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:toursim/utils/app_theme.dart';
import 'package:toursim/utils/color_manager.dart';

import '../controller/constant.dart';
import '../controller/home_controller.dart';
import '../network/local/cache_helper.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
        return Drawer(
          width: 270,
          backgroundColor:controller.isDark.value
              ?ColorsManager.dark:ColorsManager.white,
          child: Container(
            // frame2nAN (3:22)
            width: double.infinity,
            height: double.infinity,
            decoration:  BoxDecoration(
              color:controller.isDark.value
                  ?ColorsManager.dark:ColorsManager.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0 , 0 , 0 , 39 ),
                  width: 250,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(
                        0 , 27 , 0 , 0 ),
                    padding: const EdgeInsets.fromLTRB(0 , 24 , 0 , 0 ),
                    width: double.infinity ,
                    height: 450,
                    alignment: AlignmentDirectional.centerEnd,
                    decoration:  BoxDecoration(
                      color:controller.isDark.value
                          ?ColorsManager.dark:ColorsManager.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(57.5 ),
                        bottomLeft: Radius.circular(57.5 ),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xe5363e4c),
                          offset: Offset(6 , 6 ),
                          blurRadius: 15 ,
                        ),
                        BoxShadow(
                          color: Color(0xe564748c),
                          offset: Offset(-6 , -6 ),
                          blurRadius: 6 ,
                        ),
                        BoxShadow(
                          color: Color(0x33363e4c),
                          offset: Offset(6 , -6 ),
                          blurRadius: 6 ,
                        ),
                        BoxShadow(
                          color: ColorsManager.primary,
                          offset: Offset(-10 , 10 ),
                          blurRadius: 8 ,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(
                              30 , 0 , 0 , 10 ),
                          width: double.infinity,
                          height: 250 ,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Positioned(
                                // ellipse67dt (3:53)
                                left: 10 ,
                                top: 45 ,
                                child: Align(
                                  alignment: AlignmentDirectional.center,
                                  child: CircleAvatar(
                                    radius: 90,
                                    backgroundColor:const Color(0xfffdb69d),
                                    child: ClipOval(
                                      child: SvgPicture.network(myPerson!.image,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                  ),
                                ),
                              ),
                              Positioned(
                                // ellipse11YjC (3:56)
                                left: 8 ,
                                top: 23 ,
                                child: Align(
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor:const Color(0xfffdb69d),
                                    child: ClipOval(
                                      child: SvgPicture.network(myPerson!.image,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                  ),
                                ),
                              ),
                              Positioned(
                                // ellipse124Se (3:57)
                                left: 60 ,
                                top: 12 ,
                                child: Align(
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor:const Color(0xfffdb69d),
                                    child: ClipOval(
                                      child: SvgPicture.network(myPerson!.image,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                  ),
                                ),
                              ),
                              Positioned(
                                // ellipse13aA6 (3:58)
                                left: 42,
                                top: 6 ,
                                child: Align(
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor:const Color(0xfffdb69d),
                                    child: ClipOval(
                                      child: SvgPicture.network(myPerson!.image,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          myPerson!.username.toUpperCase(),
                          style:Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          myPerson!.phone,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorsManager.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          myPerson!.email,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorsManager.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _language(context,controller),
                const Spacer(),
                Container(
                  // autogrouppgt2he2 (NGF7jXmNo3LZ1Q6v8dpGt2)
                  margin: const EdgeInsets.fromLTRB(
                      10 , 0 , 24.88 , 37.88 ),
                  width: double.infinity,
                  height: 61.12 ,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // frame79F8 (3:29)
                        width: 165 ,
                        height: double.infinity,
                        alignment: AlignmentDirectional.centerEnd,
                        decoration: itemDecoration(controller),
                        child:  Center(
                          child:  ListTile(
                            onTap: (){
                              myId=null;
                              CacheHelper.removeData(key: "myId").then((value){
                                Get.offNamed("/authView");
                              });

                            },
                            tileColor: ColorsManager.primary,
                            leading: const Icon(Icons.logout,color: ColorsManager.primary,),
                            title:  Text(
                              'Logout',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: ColorsManager.primary,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _language(BuildContext context,HomeController controller,)=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 140 ,
          alignment: AlignmentDirectional.center,
          decoration:itemDecoration(controller),
          child: TextButton(
              onPressed: (){
              }, child:  Text("English",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: ColorsManager.primary,
          ),)),
        ),
        const Spacer(),
        _mode(),
      ],
    ),
  );
  Widget _mode()=>GetX<HomeController>(
    init: HomeController(),
    builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50 ,
          decoration:itemDecoration(controller),
          child: IconButton(
            style: const ButtonStyle(
                padding:
                MaterialStatePropertyAll(
                    EdgeInsets.zero)),
            icon: Icon(
              controller.isDark.value
                  ? Icons.sunny
                  : Icons.dark_mode_sharp,
              color: controller.isDark.value
                  ? ColorsManager.primaryLight
                  : ColorsManager.primary,
              size: 35,
            ),
            onPressed: () {
              Get.changeTheme(
                controller.isDark.value ? lightTheme : darkTheme,
              );
              controller.changeMode();
            },
          ),
        ),
      );
    }
  );


  Decoration itemDecoration(controller)=>BoxDecoration(
    color:controller.isDark.value
        ?ColorsManager.dark:ColorsManager.white,// const Color(0xff4d596c),
    borderRadius: BorderRadius.circular(35.5 ),
    boxShadow: const [
      BoxShadow(
        color: Color(0xe5363e4c),
        offset: Offset(6 , 6 ),
        blurRadius: 7.5 ,
      ),
      BoxShadow(
        color: Color(0xe593632d),
        offset: Offset(-6 , -6 ),
        blurRadius: 6 ,
      ),
      BoxShadow(
        color: Color(0x33363e4c),
        offset: Offset(6 , -6 ),
        blurRadius: 6 ,
      ),
      BoxShadow(
        color: ColorsManager.primary,
        offset: Offset(-6 , 6 ),
        blurRadius: 6 ,
      ),
    ],
  );
}
