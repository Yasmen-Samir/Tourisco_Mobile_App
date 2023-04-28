import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool login=true;
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / 2;
    double ffem = fem * 0.97;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/splash2.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            //d
            if(login)
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffffffff)),
                  color: const Color(0xffd5b4a3),
                  borderRadius: BorderRadius.circular(66 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        login=true;
                        setState(() {

                        });
                      },
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                      ),
                      child: Container(
                        width: 200,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffeea284),
                          borderRadius: BorderRadius.circular(46 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Signup',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      onPressed: () {
                        login=false;
                        setState(() {

                        });
                      },
                    ),
                  ],
                ),
              ),
            if(!login)
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffffffff)),
                  color: const Color(0xffd5b4a3),
                  borderRadius: BorderRadius.circular(66 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                        onPressed: () {
                          login=true;
                          setState(() {

                          });
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        login=false;
                        setState(() {

                        });
                      },
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                      ),
                      child: Container(
                        width: 200,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffeea284),
                          borderRadius: BorderRadius.circular(46 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'SignUp',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            //d
//sssssss
          ],
        ),
      ),
    );
  }
}
