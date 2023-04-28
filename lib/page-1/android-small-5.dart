import 'package:flutter/material.dart';
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
        // androidsmall5MHd (11:510)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffc19e74),
          borderRadius: BorderRadius.circular(15*fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupccp3zdR (REESksw4k4b3DL62Coccp3)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 427.68*fem),
              padding: EdgeInsets.fromLTRB(300*fem, 0*fem, 0*fem, 0*fem),
              width: double.infinity,
              height: 189*fem,
              decoration: BoxDecoration (
                border: Border.all(color: Color(0x63000000)),
                image: DecorationImage (
                  fit: BoxFit.cover,
                  image: AssetImage (
                    'assets/page-1/images/image-1-bg.png',
                  ),
                ),
              ),
              child: Align(
                // pngegg2HF9 (11:512)
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 60*fem,
                  height: 36*fem,
                  child: Image.asset(
                    'assets/page-1/images/pngegg-2-d2K.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              // navbardarkKhd (11:511)
              padding: EdgeInsets.fromLTRB(87*fem, 7*fem, 90*fem, 7.32*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xff000000),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // backNfu (I11:511;4:9)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 67*fem, 0*fem),
                    width: 16*fem,
                    height: 16*fem,
                    child: Image.asset(
                      'assets/page-1/images/back-PpX.png',
                      width: 16*fem,
                      height: 16*fem,
                    ),
                  ),
                  Container(
                    // homeiconeNX (I11:511;4:5)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 68*fem, 0*fem),
                    width: 20*fem,
                    height: 20*fem,
                    child: Image.asset(
                      'assets/page-1/images/home-icon.png',
                      width: 20*fem,
                      height: 20*fem,
                    ),
                  ),
                  Container(
                    // recentsiconh5u (I11:511;4:8)
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
          ],
        ),
      ),
          );
  }
}