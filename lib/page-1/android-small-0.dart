import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // androidsmall0zzX (17:81)
        width: double.infinity,
        height: 646*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(15*fem),
        ),
        child: Stack(
          children: [
            Positioned(
              // whatsappimage20230427at22141rm (11:468)
              left: 0*fem,
              top: 0*fem,
              child: Align(
                child: SizedBox(
                  width: 360*fem,
                  height: 640*fem,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15*fem),
                    child: Image.asset(
                      'assets/page-1/images/whatsapp-image-2023-04-27-at-2214-1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // navbardarkexb (17:83)
              left: 0*fem,
              top: 611.6812744141*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(87*fem, 7*fem, 90*fem, 7.32*fem),
                width: 360*fem,
                height: 34.32*fem,
                decoration: BoxDecoration (
                  color: Color(0xff000000),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // backsaT (I17:83;4:9)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 67*fem, 0*fem),
                      width: 16*fem,
                      height: 16*fem,
                      child: Image.asset(
                        'assets/page-1/images/back-rps.png',
                        width: 16*fem,
                        height: 16*fem,
                      ),
                    ),
                    Container(
                      // homeiconk8T (I17:83;4:5)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 68*fem, 0*fem),
                      width: 20*fem,
                      height: 20*fem,
                      child: Image.asset(
                        'assets/page-1/images/home-icon-H6K.png',
                        width: 20*fem,
                        height: 20*fem,
                      ),
                    ),
                    Container(
                      // recentsiconCm9 (I17:83;4:8)
                      width: 12*fem,
                      height: 12*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(1*fem),
                        color: Color(0xffc4c4c4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // pngegg2WWw (11:469)
              left: 300*fem,
              top: 0*fem,
              child: Align(
                child: SizedBox(
                  width: 60*fem,
                  height: 36*fem,
                  child: Image.asset(
                    'assets/page-1/images/pngegg-2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}