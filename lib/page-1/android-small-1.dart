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
        // androidsmall1u9M (8:39)
        width: double.infinity,
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(15*fem),
          color: const Color(0xffffffff),
          image: const DecorationImage (
            fit: BoxFit.cover,
            image: AssetImage (
              'assets/page-1/images/whatsapp-image-2023-04-27-at-2214-1-bg-jB1.png',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogrouposrohb1 (REEbnsNxxtvYpZr2tpoSro)
              padding: EdgeInsets.fromLTRB(15*fem, 0*fem, 0*fem, 142*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // pngegg1MvT (11:82)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                    width: 60*fem,
                    height: 36*fem,
                    child: Image.asset(
                      'assets/page-1/images/pngegg-1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // group10000015271k7 (17:34)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 82.25*fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(7*fem, 4.48*fem, 58.92*fem, 4.48*fem),
                        width: double.infinity,
                        height: 51.94*fem,
                        decoration: BoxDecoration (
                          border: Border.all(color: const Color(0xffffffff)),
                          color: const Color(0xfffbd536),
                          borderRadius: BorderRadius.circular(66*fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroup7za3m71 (REEcFc7R4CQgH6HGEV7Za3)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 43.08*fem, 0*fem),
                              width: 163*fem,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                color: const Color(0xfffde686),
                                borderRadius: BorderRadius.circular(46*fem),
                              ),
                              child: const Center(
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style:TextStyle(),
                                ),
                              ),
                            ),
                            Container(
                              // signupvu1 (17:36)
                              margin: EdgeInsets.fromLTRB(0*fem, 4.06*fem, 0*fem, 0*fem),
                              child: Text(
                                'Signup',
                                textAlign: TextAlign.center,
                                style: TextStyle (
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2125*ffem/fem,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // autogroupcfp1ngK (REEb948e8ZcdT8gumoCFP1)
                    margin: EdgeInsets.fromLTRB(2.5*fem, 0*fem, 17.5*fem, 29.93*fem),
                    padding: EdgeInsets.fromLTRB(11.5*fem, 12.81*fem, 223.5*fem, 6.9*fem),
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
                          // iconmailMN3 (11:211)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12.71*fem, 0*fem),
                          width: 37.29*fem,
                          height: 29.29*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-mail-D1V.png',
                            width: 37.29*fem,
                            height: 29.29*fem,
                          ),
                        ),
                        Container(
                          // emailny9 (11:210)
                          margin: EdgeInsets.fromLTRB(0*fem, 1.71*fem, 0*fem, 0*fem),
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
                    // autogroupcysueVZ (REEbJJNEdVuQJxcdFCCYsu)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 20.88*fem),
                    padding: EdgeInsets.fromLTRB(10*fem, 5.88*fem, 190*fem, 1.2*fem),
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
                          // iconlockQt3 (11:45)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.08*fem, 0*fem),
                          width: 42.92*fem,
                          height: 41.92*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-lock-ThD.png',
                            width: 42.92*fem,
                            height: 41.92*fem,
                          ),
                        ),
                        Container(
                          // passwordrk3 (8:48)
                          margin: EdgeInsets.fromLTRB(0*fem, 1.08*fem, 0*fem, 0*fem),
                          child: Text(
                            'password',
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
                    // autogroupyfnkj39 (REEbTDH3zbjSo8m32QyFnK)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14.08*fem, 56.08*fem),
                    width: 151.92*fem,
                    height: 25.92*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // line1PNb (10:29)
                          left: 0*fem,
                          top: 21*fem,
                          child: Align(
                            child: SizedBox(
                              width: 123*fem,
                              height: 2*fem,
                              child: Container(
                                decoration: const BoxDecoration (
                                  color: Color(0xfff4ba27),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // forgotpasswordqVV (10:28)
                          left: 0.0000038147*fem,
                          top: 4*fem,
                          child: Align(
                            child: SizedBox(
                              width: 125*fem,
                              height: 19*fem,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle (
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w800,
                                    height: 1.2125*ffem/fem,
                                    color: const Color(0xfff4ba27),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // iconquestionmarkdw9 (11:56)
                          left: 118.0000038147*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 33.92*fem,
                              height: 25.92*fem,
                              child: Image.asset(
                                'assets/page-1/images/icon-question-mark.png',
                                width: 33.92*fem,
                                height: 25.92*fem,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupmz2kUB5 (REEbcsfcuq6dd2Qt7XmZ2K)
                    margin: EdgeInsets.fromLTRB(84*fem, 0*fem, 90*fem, 0*fem),
                    width: double.infinity,
                    height: 49*fem,
                    decoration: BoxDecoration (
                      border: Border.all(color: const Color(0x99000000)),
                      color: const Color(0xfff4ba27),
                      borderRadius: BorderRadius.circular(15*fem),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x3f000000),
                          offset: Offset(0*fem, 4*fem),
                          blurRadius: 2*fem,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'login',
                        style: TextStyle (
                          fontSize: 20*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125*ffem/fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // navbardarkEpT (8:56)
              padding: EdgeInsets.fromLTRB(87*fem, 7*fem, 90*fem, 7*fem),
              width: double.infinity,
              decoration: const BoxDecoration (
                color: Color(0xff000000),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // backtu1 (I8:56;4:9)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 67*fem, 0*fem),
                    width: 16*fem,
                    height: 16*fem,
                    child: Image.asset(
                      'assets/page-1/images/back-AXm.png',
                      width: 16*fem,
                      height: 16*fem,
                    ),
                  ),
                  Container(
                    // homeiconxts (I8:56;4:5)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 68*fem, 0*fem),
                    width: 20*fem,
                    height: 20*fem,
                    child: Image.asset(
                      'assets/page-1/images/home-icon-YBu.png',
                      width: 20*fem,
                      height: 20*fem,
                    ),
                  ),
                  Container(
                    // recentsiconcyR (I8:56;4:8)
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