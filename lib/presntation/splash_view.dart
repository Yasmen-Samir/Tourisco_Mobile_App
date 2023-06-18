import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toursim/controller/constant.dart';
import 'package:toursim/network/local/cache_helper.dart';

import '../core/utils/assets_manager.dart';
import '../core/utils/color_manager.dart';


class SplashView extends StatelessWidget {


  const SplashView({super.key});

  _startDelay()  {
     Future.delayed(const Duration(seconds: 5)).then((value){
       _goNext();
    });
  }

  _goNext() async {
    myId=await CacheHelper.getData(key: "myId",);
    myAccess=await CacheHelper.getData(key: "myAccess",);
    print("======$myId==========");
    if(myId!=null){
      Get.offNamed("/homeView");

    }else {
      Get.offNamed("/authView");
    }
  }


  @override
  Widget build(BuildContext context) {
    _startDelay();
    return   Scaffold(
      backgroundColor: ColorsManager.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Image(image:AssetImage(ImagesManager.logo2) ,
            ),
            Image(
              image:AssetImage(ImagesManager.tourisco) ,
            ),
          ],
        ),
      ),
    );
  }
}
