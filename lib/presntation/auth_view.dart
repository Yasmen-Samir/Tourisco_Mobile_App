import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toursim/componats/componants.dart';
import 'package:toursim/controller/Auth_controller.dart';
import 'package:toursim/controller/state.dart';
import 'package:toursim/models/person.dart';

import 'package:toursim/utils/color_manager.dart';
import 'package:toursim/utils/componants/my_button.dart';
import 'package:toursim/utils/strings_manager.dart';
import '../controller/constant.dart';
import '../utils/componants/componants.dart';

class AuthView extends GetWidget<AuthController> {
  bool login = true;
  bool isMale = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return myScaffoldBackground(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: GetX<AuthController>(
              init: AuthController(),
              builder: (controller) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: controller.loginPage.value
                      ? _loginWidget(context, controller)
                      : _registerWidget(context, controller),
                );
              }),
        ),
      ),
    );
  }

  List<Widget> _loginWidget(context, AuthController controller) => [
        Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsetsDirectional.fromSTEB(5, 30, 5, 100),
          padding: const EdgeInsetsDirectional.all(3.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffffffff)),
            color: ColorsManager.primary,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  controller.changePage(true);
                },
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                      EdgeInsetsDirectional.zero),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
                ),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: ColorsManager.lightYellow,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'Signup',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.black,
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.changePage(false);
                  },
                ),
              ),
            ],
          ),
        ),
        Center(
          heightFactor: 1.5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myFromField(
                  context: context,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: AppStrings.email.tr,
                  prefix: Icons.email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.invalidEmail;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                myFromField(
                  context: context,
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  labelText: AppStrings.password.tr,
                  prefix: Icons.password,
                  isPassword: controller.isPasswordVisible.value,
                  suffix: controller.isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  suffixOnPressed: () {
                    controller.visibility();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.passwordInvalid;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed("/forgetPassword");
                    },
                    child: const Text(
                      AppStrings.forgetPassword,
                      style: TextStyle(
                        color: ColorsManager.lightYellow,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                myElevatedButton(
                  title: AppStrings.login,
                  onPressed: () {
                    controller.loginUser(
                        email: _emailController.text,
                        password: _passwordController.text);
                    //Get.offNamed("/homeView");
                  },
                ),
              ],
            ),
          ),
        ),
      ];

  List<Widget> _registerWidget(context, AuthController controller) => [
        Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsetsDirectional.fromSTEB(5, 30, 5, 50),
          padding: const EdgeInsetsDirectional.all(3.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffffffff)),
            color: ColorsManager.primary,
            borderRadius: BorderRadius.circular(25),
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
                    child: const Text(
                      'login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.changePage(true);
                  },
                ),
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: ColorsManager.lightYellow,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              myFromField(
                context: context,
                controller: _userNameController,
                keyboardType: TextInputType.text,
                labelText: AppStrings.username.tr,
                prefix: Icons.person,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.userNameInvalid;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              myFromField(
                context: context,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: AppStrings.email.tr,
                prefix: Icons.email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.invalidEmail;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              myFromField(
                context: context,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                hintText: AppStrings.mobileNumber.tr,
                formatter: [
                  // FilteringTextInputFormatter.digitsOnly,
                ],
                prefix: Icons.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.mobileNumberInvalid;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Icon(
                    Icons.accessibility,
                    color: ColorsManager.lightYellow,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Gender ",
                    style: TextStyle(
                        color: ColorsManager.lightYellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorsManager.lightYellow,
                        border: Border.all(
                          color: ColorsManager.primary,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: DropdownButton(
                          value: controller.isMale.value,
                          borderRadius: BorderRadius.circular(30.0),
                          style: Theme.of(context).textTheme.bodyMedium,
                          dropdownColor: ColorsManager.lightYellow,
                          underline: const SizedBox(),
                          items: [
                            DropdownMenuItem(
                              value: true,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.male,
                                    color: controller.isMale.value
                                        ? ColorsManager.primary
                                        : ColorsManager.gray,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'male',
                                    style: TextStyle(
                                      color: controller.isMale.value
                                          ? ColorsManager.primary
                                          : ColorsManager.gray,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                              value: false,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.female,
                                    color: controller.isMale.value
                                        ? ColorsManager.gray
                                        : ColorsManager.primary,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Female',
                                    style: TextStyle(
                                      color: controller.isMale.value
                                          ? ColorsManager.gray
                                          : ColorsManager.primary,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            controller.changeGender(value!);
                          }),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              myFromField(
                context: context,
                prefix: Icons.nature_people_outlined,
                controller: _nationalityController,
                hintText: "Nationality",
                readOnly: true,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: ColorsManager.lightYellow,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: nationalities.length,
                        itemBuilder: (context, index) => ListTile(
                          tileColor: ColorsManager.lightYellow,
                          title: Text(
                            nationalities.entries.toList()[index].value,
                            textAlign: TextAlign.center,
                            style: const TextStyle(),
                          ),
                          onTap: () {
                            _nationalityController.text =
                                nationalities.entries.toList()[index].value;
                            print(_nationalityController.text);
                            Navigator.pop(context);
                          },
                        ),
                        separatorBuilder: (context, index) => const Divider(
                          color: ColorsManager.primary,
                          height: 1,
                        ),
                      ),
                    ),
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.chooseNationality;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              myFromField(
                context: context,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                labelText: AppStrings.password.tr,
                prefix: Icons.password,
                isPassword: controller.isPasswordVisible.value,
                suffix: controller.isPasswordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                suffixOnPressed: () {
                  controller.visibility();
                },
                validator: (value) {
                  if (value!.isEmpty && value.length >= 8) {
                    return AppStrings.passwordInvalid;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              myFromField(
                context: context,
                controller: _confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                labelText: AppStrings.confirmPassword.tr,
                prefix: Icons.password,
                isPassword: controller.isConfirmPasswordVisible.value,
                suffix: controller.isConfirmPasswordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                suffixOnPressed: () {
                  controller.confirmVisibility();
                },
                validator: (value) {
                  if (_confirmPasswordController.text != value) {
                    return AppStrings.passwordInvalid;
                  }
                  if (_passwordController.text !=
                      _confirmPasswordController.text) {
                    return AppStrings.passwordInvalid;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              myElevatedButton(
                title: AppStrings.signUp,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String code = nationalities.entries
                        .where((element) {
                          return element.value == _nationalityController.text;
                        })
                        .toList()[0]
                        .key;

                    myPerson = Person(
                      username: _userNameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      gender: isMale ? "male" : "female",
                      nationality: code,
                      password: _passwordController.text,
                    );
                    controller.createUser();
                    print("register");
                  }
                },
              ),
            ],
          ),
        ),
      ];

  Map<String, String> nationalities = {
    "AF": "Afghanistan",
    "AL": "Albania",
    "DZ": "Algeria",
    "US": "United States",
    "AD": "Andorra",
    "AO": "Angola",
    "AG": "Antigua and Barbuda",
    "AR": "Argentina",
    "AM": "Armenia",
    "AU": "Australia",
    "AT": "Austria",
    "AZ": "Azerbaijan",
    "BS": "Bahamas",
    "BH": "Bahrain",
    "BD": "Bangladesh",
    "BB": "Barbados",
    "BY": "Belarus",
    "BE": "Belgium",
    "BZ": "Belize",
    "BJ": "Benin",
    "BT": "Bhutan",
    "BO": "Bolivia",
    "BA": "Bosnia and Herzegovina",
    "BR": "Brazil",
    "GB": "United Kingdom",
    "BN": "Brunei",
    "BG": "Bulgaria",
    "BF": "Burkina Faso",
    "BI": "Burundi",
    "KH": "Cambodia",
    "CM": "Cameroon",
    "CA": "Canada",
    "CV": "Cape Verde",
    "CF": "Central African Republic",
    "TD": "Chad",
    "CL": "Chile",
    "CN": "China",
    "CO": "Colombia",
    "KM": "Comoros",
    "CD": "Congo, Democratic Republic of the",
    "CG": "Congo, Republic of the",
    "CR": "Costa Rica",
    "HR": "Croatia",
    "CU": "Cuba",
    "CY": "Cyprus",
    "CZ": "Czech Republic",
    "DK": "Denmark",
    "DJ": "Djibouti",
    "DM": "Dominica",
    "DO": "Dominican Republic",
    "TL": "East Timor",
    "EC": "Ecuador",
    "EG": "Egypt",
    "SV": "El Salvador",
    "GQ": "Equatorial Guinea",
    "ER": "Eritrea",
    "EE": "Estonia",
    "ET": "Ethiopia",
    "FJ": "Fiji",
    "FI": "Finland",
    "FR": "France",
    "GA": "Gabon",
    "GM": "Gambia",
    "GE": "Georgia",
    "DE": "Germany",
    "GH": "Ghana",
    "GR": "Greece",
    "GD": "Grenada",
    "GT": "Guatemala",
    "GN": "Guinea",
    "GW": "Guinea-Bissau",
    "GY": "Guyana",
    "HT": "Haiti",
    "HN": "Honduras",
    "HU": "Hungary",
    "IS": "Iceland",
    "IN": "India",
    "ID": "Indonesia",
    "IR": "Iran",
    "IQ": "Iraq",
    "IE": "Ireland",
    "IL": "Israel",
    "IT": "Italy",
    "CI": "Ivory Coast",
    "JM": "Jamaica",
    "JP": "Japan",
    "JO": "Jordan",
  };
}
