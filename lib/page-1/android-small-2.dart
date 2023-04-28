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
        // androidsmall2Wdy (8:20)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(15*fem),
          color: const Color(0xffffffff),
          image: const DecorationImage (
            fit: BoxFit.cover,
            image: AssetImage (
              'assets/page-1/images/whatsapp-image-2023-04-27-at-2214-1-bg-9pf.png',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupblxdhiT (REEYj3Kc7BS758fxv9BLXd)
              padding: EdgeInsets.fromLTRB(14*fem, 0*fem, 0*fem, 56.2*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // pngegg19qM (11:81)
                    margin: EdgeInsets.fromLTRB(286*fem, 0*fem, 0*fem, 0*fem),
                    width: 60*fem,
                    height: 36*fem,
                    child: Image.asset(
                      'assets/page-1/images/pngegg-1-tQK.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // togglebuttonCod (17:67)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 19*fem, 17*fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(65*fem, 5*fem, 5*fem, 5*fem),
                        width: 327*fem,
                        height: 58*fem,
                        decoration: BoxDecoration (
                          border: Border.all(color: const Color(0xffffffff)),
                          color: const Color(0xfffbd536),
                          borderRadius: BorderRadius.circular(66*fem),
                        ),
                        child: TextButton(
                          // buttonleftyT1 (I17:67;55:4523)
                          onPressed: () {},
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(46*fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroupuwmzeZ9 (REEZkLx89uU9X5iGDYuWMZ)
                                  margin: EdgeInsets.fromLTRB(0*fem, 15*fem, 51*fem, 13*fem),
                                  width: 43*fem,
                                  height: double.infinity,
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      textAlign: TextAlign.center,
                                      style: TextStyle (

                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2125*ffem/fem,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroup336bG4j (REEZrvbVaA55PhPY9Y336b)
                                  width: 163*fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    color: const Color(0xfffde686),
                                    borderRadius: BorderRadius.circular(46*fem),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Signup',
                                      textAlign: TextAlign.center,
                                      style: TextStyle (

                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2125*ffem/fem,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // autogroupopyxHVd (REEXLuxT7jbQHyK6phoPYX)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 21.62*fem),
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
                          // iconpencilfWB (11:66)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16.79*fem, 0*fem),
                          width: 27*fem,
                          height: 33.5*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-pencil-d8o.png',
                            width: 27*fem,
                            height: 33.5*fem,
                          ),
                        ),
                        Container(
                          // usernameJJF (8:36)
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
                    // autogroupeswoxtb (REEXauZ8npx5yL7uv7eSWo)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 17.38*fem),
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
                          // iconmailXKR (11:197)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12.71*fem, 0*fem),
                          width: 37.29*fem,
                          height: 35.15*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-mail.png',
                            width: 37.29*fem,
                            height: 35.15*fem,
                          ),
                        ),
                        Container(
                          // emailPMd (17:79)
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
                    // group1000001528e2f (11:448)
                    margin: EdgeInsets.fromLTRB(34*fem, 0*fem, 53.98*fem, 19.02*fem),
                    padding: EdgeInsets.fromLTRB(5.52*fem, 4.4*fem, 39.69*fem, 4.4*fem),
                    width: double.infinity,
                    height: 50.98*fem,
                    decoration: BoxDecoration (
                      border: Border.all(color: const Color(0xffffffff)),
                      color: const Color(0xfffbd536),
                      borderRadius: BorderRadius.circular(66*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupsk2bFYF (REEZR71BbuMTTiMPxrsK2B)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 27.2*fem, 0*fem),
                          width: 128.62*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: const Color(0xfffde686),
                            borderRadius: BorderRadius.circular(46*fem),
                          ),
                          child: Center(
                            child: Text(
                              'male',
                              textAlign: TextAlign.center,
                              style: TextStyle (

                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.2125*ffem/fem,
                                color: const Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // femaleScj (11:450)
                          margin: EdgeInsets.fromLTRB(0*fem, 4.36*fem, 0*fem, 0*fem),
                          child: Text(
                            'Female',
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
                  Container(
                    // autogroupsjouJQ3 (REEXoQCKMfEUyFurPjSJou)
                    margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 20*fem, 25*fem),
                    padding: EdgeInsets.fromLTRB(5*fem, 4*fem, 201*fem, 4*fem),
                    width: double.infinity,
                    height: 49*fem,
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
                          // iconlock5ZD (11:455)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10.08*fem, 5.1*fem),
                          width: 35.92*fem,
                          height: 35.9*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-lock-kjM.png',
                            width: 35.92*fem,
                            height: 35.9*fem,
                          ),
                        ),
                        Text(
                          // passwordjdm (11:454)
                          'password',
                          style: TextStyle (

                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125*ffem/fem,
                            color: const Color(0x56000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroup4c8bEaX (REEXzEDcFKDE6voGQU4C8b)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 28*fem),
                    padding: EdgeInsets.fromLTRB(5*fem, 7*fem, 142*fem, 6.1*fem),
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
                          // iconlockQ7d (11:461)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.08*fem, 0*fem),
                          width: 35.92*fem,
                          height: 35.9*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-lock-VUf.png',
                            width: 35.92*fem,
                            height: 35.9*fem,
                          ),
                        ),
                        Container(
                          // confirmpassword4T5 (11:466)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2.9*fem),
                          child: Text(
                            'confirm password',
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
                    // autogroupw6usJsD (REEY9Pd1TntKNLn9xKW6Us)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 23*fem),
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
                          // iconphonesYw (11:410)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10.38*fem, 0*fem),
                          width: 28.92*fem,
                          height: 34.7*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-phone.png',
                            width: 28.92*fem,
                            height: 34.7*fem,
                          ),
                        ),
                        Container(
                          // phonenumbervXD (11:431)
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
                    // autogroup3cnob7Z (REEYHyD3h4FdUs9G3N3Cno)
                    margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 20*fem, 40*fem),
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
                          // iconworldN1q (11:205)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
                          width: 34*fem,
                          height: 33.6*fem,
                          child: Image.asset(
                            'assets/page-1/images/icon-world.png',
                            width: 34*fem,
                            height: 33.6*fem,
                          ),
                        ),
                        Container(
                          // nationality1Kh (11:185)
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
                  Container(
                    // autogroupv795UDH (REEYT8cSuXvikH89bDV795)
                    margin: EdgeInsets.fromLTRB(83*fem, 0*fem, 92*fem, 0*fem),
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
                        'Sign Up',
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
              // navbardarkcD1 (8:26)
              padding: EdgeInsets.fromLTRB(87*fem, 10*fem, 90*fem, 10.8*fem),
              width: double.infinity,
              decoration: const BoxDecoration (
                color: Color(0xff000000),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // backTzK (I8:26;4:9)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 67*fem, 0*fem),
                    width: 16*fem,
                    height: 16*fem,
                    child: Image.asset(
                      'assets/page-1/images/back-QKd.png',
                      width: 16*fem,
                      height: 16*fem,
                    ),
                  ),
                  Container(
                    // homeiconXjH (I8:26;4:5)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 68*fem, 0*fem),
                    width: 20*fem,
                    height: 20*fem,
                    child: Image.asset(
                      'assets/page-1/images/home-icon-qv3.png',
                      width: 20*fem,
                      height: 20*fem,
                    ),
                  ),
                  Container(
                    // recentsiconQHH (I8:26;4:8)
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