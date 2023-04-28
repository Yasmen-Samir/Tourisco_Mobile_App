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
        // androidsmall4MX9 (11:470)
        width: double.infinity,
        decoration: BoxDecoration (
          color: const Color(0xffc29f77),
          borderRadius: BorderRadius.circular(15*fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // autogroupoon3nsM (REETRXVLQz3nWthQZGoon3)
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // pngwing6d9 (11:508)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 113*fem, 0*fem),
                    width: 205*fem,
                    height: 174*fem,
                    child: Image.asset(
                      'assets/page-1/images/pngwing.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // pngegg2NKm (11:473)
                    margin: EdgeInsets.fromLTRB(0*fem, 8*fem, 0*fem, 0*fem),
                    width: 60*fem,
                    height: 36*fem,
                    child: Image.asset(
                      'assets/page-1/images/pngegg-2-PeB.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupj5wbS4j (REEUHFZUpwLKjN2gh7J5Wb)
              padding: EdgeInsets.fromLTRB(17*fem, 45*fem, 17*fem, 134.68*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupn5zttxK (REETcrVo1PidD3Fn7Gn5zT)
                    margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 21.62*fem),
                    padding: EdgeInsets.fromLTRB(10.21*fem, 6.39*fem, 193*fem, 9.11*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      border: Border.all(color: const Color(0x99000000)),
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(15*fem),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x3f000000),
                          offset: Offset(0*fem, 4*fem),
                          blurRadius: 2*fem,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // iconpencilrGs (11:504)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16.79*fem, 0*fem),
                          width: 27*fem,
                          height: 33.5*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-pencil.png',
                            width: 27*fem,
                            height: 33.5*fem,
                          ),
                        ),
                        Container(
                          // usernametsm (11:503)
                          margin: EdgeInsets.fromLTRB(0*fem, 1.8*fem, 0*fem, 0*fem),
                          child: Text(
                            'user name',
                            style: TextStyle (

                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              color: const Color(0x56000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroup1z5qtFV (REETnS4AeAU8SWxoGr1z5q)
                    margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 30.38*fem),
                    padding: EdgeInsets.fromLTRB(4*fem, 6.92*fem, 231*fem, 6.92*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      border: Border.all(color: const Color(0x99000000)),
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(15*fem),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x3f000000),
                          offset: Offset(0*fem, 4*fem),
                          blurRadius: 2*fem,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // iconmailr5q (11:498)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12.71*fem, 0*fem),
                          width: 37.29*fem,
                          height: 35.15*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-mail-xbD.png',
                            width: 37.29*fem,
                            height: 35.15*fem,
                          ),
                        ),
                        Container(
                          // emailh6T (11:497)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.24*fem),
                          child: Text(
                            'email',
                            style: TextStyle (

                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              color: const Color(0x56000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupch4wZeT (REETxWbhygujEULmygcH4w)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 23*fem),
                    padding: EdgeInsets.fromLTRB(14.71*fem, 6*fem, 164*fem, 8.3*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      border: Border.all(color: const Color(0x99000000)),
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(15*fem),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x3f000000),
                          offset: Offset(0*fem, 4*fem),
                          blurRadius: 2*fem,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // iconphoneMaK (11:492)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10.38*fem, 0*fem),
                          width: 28.92*fem,
                          height: 34.7*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-phone-9dV.png',
                            width: 28.92*fem,
                            height: 34.7*fem,
                          ),
                        ),
                        Container(
                          // phonenumber195 (11:495)
                          margin: EdgeInsets.fromLTRB(0*fem, 4.3*fem, 0*fem, 0*fem),
                          child: Text(
                            'phone number',
                            style: TextStyle (

                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              color: const Color(0x56000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupeblxSkB (REEU6WNPDjyGC766bvEbLX)
                    margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                    padding: EdgeInsets.fromLTRB(9*fem, 7*fem, 190*fem, 8.4*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      border: Border.all(color: const Color(0x99000000)),
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(15*fem),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x3f000000),
                          offset: Offset(0*fem, 4*fem),
                          blurRadius: 2*fem,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // iconworldEg3 (11:484)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
                          width: 34*fem,
                          height: 33.6*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-world-6hy.png',
                            width: 34*fem,
                            height: 33.6*fem,
                          ),
                        ),
                        Container(
                          // nationalityUqH (11:483)
                          margin: EdgeInsets.fromLTRB(0*fem, 1.4*fem, 0*fem, 0*fem),
                          child: Text(
                            'nationality',
                            style: TextStyle (

                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              color: const Color(0x56000000),
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
              // navbardarkYKM (11:472)
              padding: EdgeInsets.fromLTRB(87*fem, 7*fem, 90*fem, 7.32*fem),
              width: double.infinity,
              decoration: const BoxDecoration (
                color: Color(0xff000000),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // backboR (I11:472;4:9)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 67*fem, 0*fem),
                    width: 16*fem,
                    height: 16*fem,
                    child: Image.asset(
                      'assets/page-1/images/back-iR1.png',
                      width: 16*fem,
                      height: 16*fem,
                    ),
                  ),
                  Container(
                    // homeicon5yV (I11:472;4:5)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 68*fem, 0*fem),
                    width: 20*fem,
                    height: 20*fem,
                    child: Image.asset(
                      'assets/page-1/images/home-icon-3Fy.png',
                      width: 20*fem,
                      height: 20*fem,
                    ),
                  ),
                  Container(
                    // recentsiconLeX (I11:472;4:8)
                    width: 12*fem,
                    height: 12*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(1*fem),
                      color: const Color(0xffc4c4c4),
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