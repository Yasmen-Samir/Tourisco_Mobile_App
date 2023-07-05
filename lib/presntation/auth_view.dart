import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toursim/controller/Auth_controller.dart';
import 'package:toursim/models/person.dart';
import 'package:toursim/core/utils/strings_manager.dart';
import '../helper/constant.dart';
import '../core/componants/componants.dart';
import '../core/componants/my_button.dart';
import '../core/utils/color_manager.dart';

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
    return  GetX<AuthController>(
        init: AuthController(),
        builder: (controller) {
        return myScaffoldBackground(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent
            ),
            titleSpacing: 0,
            toolbarHeight: 80,
            title: SafeArea(
              child: Row(
                children: [
                  const SizedBox(width: 3,),
                  CircleAvatar(
                    radius: 20,
                    child: TextButton(
                        onPressed: (){
                          if(Get.locale==const Locale('ar')) {
                              language="en";
                            Get.updateLocale(const Locale('en'));
                          }else{
                            language="ar";
                            Get.updateLocale(const Locale('ar'));
                          }
                          print(language);
                        }, child:  Text(AppStrings.langCode.tr,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorsManager.white,
                      ),)),
                  ),
                  const SizedBox(width: 3,),
                  selectAuth(context,controller),
                  const SizedBox(width: 3,),
                ],
              ),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                  child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        controller.loginPage.value
                            ? _loginWidget(context, controller)
                      : _registerWidget(context, controller),
                        const SizedBox(height: 20,),

                      ],
                    )
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _loginWidget(context, AuthController controller) => Center(
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
                      return AppStrings.invalidEmail.tr;
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
                      return AppStrings.passwordInvalid.tr;
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
                    child:  Text(
                      AppStrings.forgetPassword.tr,
                      style: const TextStyle(
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
                condition(
                  condition: !controller.isLoading.value,
                  child: myElevatedButton(
                    title: AppStrings.login.tr,
                    onPressed: () {
                      if(_formKey.currentState!.validate()) {
                        controller.loginUser(
                          email: _emailController.text,
                          password: _passwordController.text);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );

  Widget _registerWidget(context, AuthController controller) => Padding(
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
                    return AppStrings.userNameInvalid.tr;
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
                    return AppStrings.invalidEmail.tr;
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
                    return AppStrings.mobileNumberInvalid.tr;
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
                   Text(
                    AppStrings.gender.tr,
                    style: const TextStyle(
                        color: ColorsManager.lightYellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  const SizedBox(width: 3,),
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
                                    AppStrings.male.tr,
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
                                    AppStrings.female.tr,
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
                hintText: AppStrings.nationality.tr,
                readOnly: true,
                onTap: () {
                  Map<String,String> nation=nationalitiesEn;
                  if(language=="ar"){
                    nation=nationalitiesAr;
                  }
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: ColorsManager.lightYellow,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: nation.length,
                        itemBuilder: (context, index) => ListTile(
                          tileColor: ColorsManager.lightYellow,
                          title: Text(
                            nation.entries.toList()[index].value,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          onTap: () {
                            _nationalityController.text =
                                nation.entries.toList()[index].value;
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
                    return AppStrings.chooseNationality.tr;
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
                    return AppStrings.passwordInvalid.tr;
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
                    return AppStrings.passwordInvalid.tr;
                  }
                  if (_passwordController.text !=
                      _confirmPasswordController.text) {
                    return AppStrings.passwordInvalid.tr;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              condition(
                condition: !controller.isLoading.value,
                child: myElevatedButton(
                  title: AppStrings.signUp.tr,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String code = (language=="en"?nationalitiesEn:nationalitiesAr).entries
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
              ),
            ],
          ),
        );

  Widget selectAuth(context,AuthController controller){

  if(controller.loginPage.value){
    return  Expanded(
      child: Container(
        height: 50,
        padding: const EdgeInsetsDirectional.all(3),
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
                width: 160,
                decoration: BoxDecoration(
                  color: ColorsManager.lightYellow,
                  borderRadius: BorderRadius.circular(25),
                ),
                child:  Center(
                  child: Text(
                    AppStrings.login.tr,
                    style: const TextStyle(
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
                  child:  Text(
                    AppStrings.signUp.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
    );
}else{
    return  Expanded(
      child: Container(
        height: 50,
        padding: const EdgeInsetsDirectional.all(3),
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
                  child:  Text(
                    AppStrings.login.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
              width: 160,
              decoration: BoxDecoration(
                color: ColorsManager.lightYellow,
                borderRadius: BorderRadius.circular(25),
              ),
              child:  Center(
                child: Text(
                  AppStrings.signUp.tr,
                  style: const TextStyle(
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
    );
}
}

  Decoration itemDecoration(controller)=>BoxDecoration(
    color:controller.isDark.value
        ?ColorsManager.dark:ColorsManager.white,// const Color(0xff4d596c),
    borderRadius: BorderRadius.circular(35.5 ),
    boxShadow:  [
      BoxShadow(
        color: const Color(0xe5363e4c),
        offset: Offset.fromDirection(6,6),
        blurRadius: 7.5 ,
      ),
      BoxShadow(
        color: const Color(0xe593632d),
        offset: Offset.fromDirection(-6,-6),
        blurRadius: 6 ,
      ),
      BoxShadow(
        color: const Color(0x33363e4c),
        offset: Offset.fromDirection(6,-6),
        blurRadius: 6 ,
      ),
      BoxShadow(
        color: ColorsManager.primary,
        offset: Offset.fromDirection(6,6),
        blurRadius: 6 ,
      ),
    ],
  );

  Map<String, String> nationalitiesEn = {
  "AF": "Afghan",
  "AL": "Albanian",
  "DZ": "Algerian",
  "US": "American",
  "AD": "Andorran",
  "AO": "Angolan",
  "AG": "Antiguan",
  "AR": "Argentinian",
  "AM": "Armenian",
  "AU": "Australian",
  "AT": "Austrian",
  "AZ": "Azerbaijani",
  "BS": "Bahamian",
  "BH": "Bahraini",
  "BD": "Bangladeshi",
  "BB": "Barbadian",
  "BY": "Belarusian",
  "BE": "Belgian",
  "BZ": "Belizean",
  "BJ": "Beninese",
  "BT": "Bhutanese",
  "BO": "Bolivian",
  "BA": "Bosnian",
  "BR": "Brazilian",
  "GB": "British",
  "BN": "Bruneian",
  "BG": "Bulgarian",
  "BF": "Burkinabe",
  "BI": "Burundian",
  "KH": "Cambodian",
  "CM": "Cameroonian",
  "CA": "Canadian",
  "CV": "Cape Verdean",
  "CF": "Central African",
  "TD": "Chadian",
  "CL": "Chilean",
  "CN": "Chinese",
  "CO": "Colombian",
  "KM": "Comorian",
  "CD": "Congolese",
  "CG": "Congolese",
  "CR": "Costa Rican",
  "HR": "Croatian",
  "CU": "Cuban",
  "CY": "Cypriot",
  "CZ": "Czech",
  "DK": "Danish",
  "DJ": "Djiboutian",
  "DM": "Dominican",
  "DO": "Dominican",
  "TL": "East Timorese",
  "EC": "Ecuadorean",
  "EG": "Egyptian",
  "SV": "Salvadoran",
  "GQ": "Equatorial Guinean",
  "ER": "Eritrean",
  "EE": "Estonian",
  "ET": "Ethiopian",
  "FJ": "Fijian",
  "FI": "Finnish",
  "FR": "French",
  "GA": "Gabonese",
  "GM": "Gambian",
  "GE": "Georgian",
  "DE": "German",
  "GH": "Ghanaian",
  "GR": "Greek",
  "GD": "Grenadian",
  "GT": "Guatemalan",
  "GN": "Guinean",
  "GW": "Guinea-Bissauan",
  "GY": "Guyanese",
  "HT": "Haitian",
  "HN": "Honduran",
  "HU": "Hungarian",
  "IS": "Icelandic",
  "IN": "Indian",
  "ID": "Indonesian",
  "IR": "Iranian",
  "IQ": "Iraqi",
  "IE": "Irish",
  "IL": "Israeli",
  "IT": "Italian",
  "CI": "Ivorian",
  "JM": "Jordan",
  };
  Map<String, String> nationalitiesAr = {
  "AF": "أفغانستاني",
  "AL": "ألباني",
  "DZ": "جزائري",
  "US": "أمريكي",
  "AD": "أندوري",
  "AO": "أنغولي",
  "AG": "أنتيغوي",
  "AR": "أرجنتيني",
  "AM": "أرميني",
  "AU": "أسترالي",
  "AT": "نمساوي",
  "AZ": "أذربيجاني",
  "BS": "باهامي",
  "BH": "بحريني",
  "BD": "بنغلاديشي",
  "BB": "برباديان",
  "BY": "بيلاروسي",
  "BE": "بلجيكي",
  "BZ": "بليزي",
  "BJ": "بنيني",
  "BT": "بوتاني",
  "BO": "بوليفي",
  "BA": "بوسني",
  "BR": "برازيلي",
  "GB": "بريطاني",
  "BN": "بروناي",
  "BG": "بلغاري",
  "BF": "بوركينابي",
  "BI": "بوروندي",
  "KH": "كمبودي",
  "CM": "كاميروني",
  "CA": "كندي",
  "CV": "كابو فيردي",
  "CF": "أفريقي",
  "TD": "تشادي",
  "CL": "تشيلي",
  "CN": "صيني",
  "CO": "كولومبي",
  "KM": "قمري",
  "CD": "كونغولي",
  "CG": "كونغولي",
  "CR": "كوستاريكي",
  "HR": "كرواتي",
  "CU": "كوبي",
  "CY": "قبرصي",
  "CZ": "تشيكي",
  "DK": "دنماركي",
  "DJ": "جيبوتي",
  "DM": "دومينيكي",
  "DO": "دومينيكي",
  "TL": "تيموري",
  "EC": "إكوادوري",
  "EG": "مصري",
  "SV": "سلفادوري",
  "GQ": "غينيا الاستوائية",
  "ER": "إريتري",
  "EE": "إستوني",
  "ET": "إثيوبي",
  "FJ": "فيجي",
  "FI": "فنلندي",
  "FR": "فرنسي",
  "GA": "غابوني",
  "GM": "غامبي",
  "GE": "جورجي",
  "DE": "ألاوردن",
  };

}
