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
        // androidsmall3itb (11:98)
        width: double.infinity,
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(15*fem),
          color: Color(0xffffffff),
          image: DecorationImage (
            fit: BoxFit.cover,
            image: AssetImage (
              'assets/page-1/images/whatsapp-image-2023-04-27-at-2214-1-bg.png',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogrouppbkq9DD (REEWNC5xsEdXEpaR9APbKq)
              padding: EdgeInsets.fromLTRB(18*fem, 0*fem, 0*fem, 240*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // pngegg1RAj (11:105)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 205*fem),
                    width: 60*fem,
                    height: 36*fem,
                    child: Image.asset(
                      'assets/page-1/images/pngegg-1-bcP.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // autogroupyerf61y (REEVxxFghCz4hdqtaMYErf)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 17*fem, 34*fem),
                    padding: EdgeInsets.fromLTRB(8*fem, 3*fem, 158*fem, 4.08*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0x99000000)),
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(15*fem),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0*fem, 4*fem),
                          blurRadius: 2*fem,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // iconlockfco (11:114)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.08*fem, 0*fem),
                          width: 42.92*fem,
                          height: 41.92*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-lock-A7m.png',
                            width: 42.92*fem,
                            height: 41.92*fem,
                          ),
                        ),
                        Container(
                          // newpasswordJvf (11:113)
                          margin: EdgeInsets.fromLTRB(0*fem, 1.08*fem, 0*fem, 0*fem),
                          child: Text(
                            'new password',
                            style: TextStyle (

                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              color: Color(0x56000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupa8h9Ya7 (REEW8wy2kGoyuBH3Mea8h9)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 17*fem, 0*fem),
                    padding: EdgeInsets.fromLTRB(8*fem, 3*fem, 128*fem, 4.08*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0x99000000)),
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(15*fem),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0*fem, 4*fem),
                          blurRadius: 2*fem,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // iconlockvKm (11:122)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.08*fem, 0*fem),
                          width: 42.92*fem,
                          height: 41.92*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-lock.png',
                            width: 42.92*fem,
                            height: 41.92*fem,
                          ),
                        ),
                        Container(
                          // confirmpasswordZ7q (11:121)
                          margin: EdgeInsets.fromLTRB(0*fem, 1.08*fem, 0*fem, 0*fem),
                          child: Text(
                            'confirm  password',
                            style: TextStyle (

                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              color: Color(0x56000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // navbardarkCRh (11:100)
              padding: EdgeInsets.fromLTRB(87*fem, 7*fem, 90*fem, 7*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xff000000),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // backU8K (I11:100;4:9)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 67*fem, 0*fem),
                    width: 16*fem,
                    height: 16*fem,
                    child: Image.asset(
                      'assets/page-1/images/back.png',
                      width: 16*fem,
                      height: 16*fem,
                    ),
                  ),
                  Container(
                    // homeiconLwD (I11:100;4:5)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 68*fem, 0*fem),
                    width: 20*fem,
                    height: 20*fem,
                    child: Image.asset(
                      'assets/page-1/images/home-icon-3cX.png',
                      width: 20*fem,
                      height: 20*fem,
                    ),
                  ),
                  Container(
                    // recentsiconE11 (I11:100;4:8)
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