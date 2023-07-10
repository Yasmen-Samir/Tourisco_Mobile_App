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
            //private code here
            //private code here
          ],
        ),
      ),
    );
  }
}
