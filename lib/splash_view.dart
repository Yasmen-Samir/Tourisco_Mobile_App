import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:toursim/home.dart';

import 'utils/assets_manager.dart';


class SplashView extends StatelessWidget {


  const SplashView({super.key});

  _startDelay()  {
     Future.delayed(const Duration(seconds: 5)).then((value){
       _goNext();
    });
   // _timer = Timer(const Duration(seconds: 5), _goNext);
  }

  _goNext() {
          Get.offNamed("/authView");
  }


  @override
  Widget build(BuildContext context) {
    _startDelay();
    return   Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Image(
              image:AssetImage(ImagesManager.logo2) ,
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
