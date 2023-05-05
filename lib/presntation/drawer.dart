import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:toursim/utils/color_manager.dart';

import '../controller/constant.dart';
import '../controller/home_controller.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController()..getUserData(),
        builder: (controller) {
        return Drawer(
          width: 270,
          child: Container(
            // profileTNz (3:21)
            child: Container(
              // frame2nAN (3:22)
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color:Color(0xff4d596c),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0 , 0 , 0 , 39 ),
                    width: 250,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(
                              0 , 27 , 0 , 0 ),
                          padding: const EdgeInsets.fromLTRB(
                              30 , 24 , 29 , 22 ),
                          width: 250 ,
                          height: 500,
                          alignment: AlignmentDirectional.centerEnd,
                          decoration: const BoxDecoration(
                            color:ColorsManager.primary, //Color(0xff4d596c),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(57.5 ),
                              bottomLeft: Radius.circular(57.5 ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xe5363e4c),
                                offset: Offset(6 , 6 ),
                                blurRadius: 7.5 ,
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
                                color: Color(0xe593632d),
                                offset: Offset(-6 , 6 ),
                                blurRadius: 6 ,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    0 , 0 , 0 , 18 ),
                                width: double.infinity,
                                height: 250 ,
                                child: Stack(
                                  children: [
                                    const Positioned(
                                      // ellipse5ot6 (3:52)
                                      left: 0 ,
                                      top: 27 ,
                                      child: Align(
                                        child: SizedBox(
                                          width: 100 ,
                                          height: 100 ,
                                          /*   child:
                    Image.network(
                      [Image url]
                      width: 248*fem,
                      height: 248 ,
                    ),*/
                                        ),
                                      ),
                                    ),
                                      Positioned(
                                      // ellipse67dt (3:53)
                                      left: 10 ,
                                      top: 45 ,
                                      child: Align(
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
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    0 , 0 , 47 , 5 ),
                                child:    Text(
                                  myPerson!.username.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManager.white,
                                  ),
                                ),

                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0 , 0 , 20 , 0 ),
                                child: Text(
                                  myPerson!.phone,
                                  style: TextStyle(
                                    color: ColorsManager.lightGray,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0 , 0 , 20 , 0 ),
                                child: Text(
                                  myPerson!.email,
                                  style: TextStyle(
                                    color: ColorsManager.lightGray,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
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
                          width: 160 ,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color:ColorsManager.primary,// const Color(0xff4d596c),
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
                                color: Color(0x33363e4c),
                                offset: Offset(-6 , 6 ),
                                blurRadius: 6 ,
                              ),
                            ],
                          ),
                          child:  Center(
                            child:  ListTile(
                              onTap: (){

                                /*  CacheHelper.removeData(key: "uId").then((value){
                      navigateAndFinish(context, LoginScreen());
                  });*/

                              },
                              tileColor: ColorsManager.primary,
                              leading: const Icon(Icons.logout),
                              title: const Text(
                                'Logout',
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
          ),
        );
      }
    );
  }
}
