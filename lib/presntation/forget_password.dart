import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/componants/componants.dart';
import '../core/componants/my_button.dart';
import '../core/utils/strings_manager.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return myScaffoldBackground(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                myFromField(
                  context: context,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: AppStrings.email.tr,
                  prefix: Icons.email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.invalidEmail.tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                myElevatedButton(title:AppStrings.resetPassword, onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
