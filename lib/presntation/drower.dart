// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:toursim/controller/constant.dart';
import 'package:toursim/controller/home_controller.dart';
import 'package:toursim/network/remote/api_url.dart';
import 'package:toursim/utils/color_manager.dart';


class NavigateDrawer extends StatefulWidget {
  @override
  State<NavigateDrawer> createState() => _NavigateDrawerState();
}

class _NavigateDrawerState extends State<NavigateDrawer> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController()..getUserData(),
      builder: (controller) {
        return Drawer(
          child: myPerson!=null? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [

                  Container(
                    width: double.infinity,
                    color: ColorsManager.primary.withOpacity(.5),
                    padding:  EdgeInsets.only(
                      left: 10.0,
                      top: 20+ MediaQuery.of(context).padding.top,
                      bottom: 15.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60.0,
                          backgroundColor: ColorsManager.primary,
                          child: CircleAvatar(
                            radius: 67.0,
                            child: ClipOval(
                              child: SvgPicture.network(myPerson!.image,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          myPerson!.username,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.black,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          myPerson!.phone,
                          style: TextStyle(
                            color: ColorsManager.gray,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          myPerson!.email,
                          style: TextStyle(
                            color: ColorsManager.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 5.0,),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              ListTile(
                onTap: (){

                  /*  CacheHelper.removeData(key: "uId").then((value){
                      navigateAndFinish(context, LoginScreen());
                  });*/

                },
                tileColor: ColorsManager.primary,
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                ),
              ),
              SizedBox(height: 5.0,),
            ],
          ):Center(child: CircularProgressIndicator()),
        );
      }
    );
  }
}
