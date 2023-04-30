import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toursim/utils/assets_manager.dart';
import 'package:toursim/utils/color_manager.dart';
import 'package:toursim/utils/componants/my_button.dart';
import 'package:toursim/utils/strings_manager.dart';
import 'package:country_picker/country_picker.dart';
import 'utils/componants/componants.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ImagesManager.back3,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: login ? _loginWidget(context) : _registerWidget(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _loginWidget(context) => [
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
                  login = true;
                  setState(() {});
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
                    login = false;
                    setState(() {});
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
                  isPassword: true,
                  suffix: Icons.visibility,
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
                    onPressed: (){
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
                    if (_formKey.currentState!.validate()) {
                      print("login");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ];

  List<Widget> _registerWidget() => [
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
                    login = true;
                    setState(() {});
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  login = false;
                  setState(() {});
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
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
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
                  FilteringTextInputFormatter.digitsOnly,
                ],
                prefix: Icons.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.invalidEmail;
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
                          value: isMale,
                          borderRadius: BorderRadius.circular(30.0),
                          style: Theme.of(context).textTheme.bodyMedium,
                          dropdownColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          underline: const SizedBox(),
                          items: [
                            DropdownMenuItem(
                              value: true,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.male,
                                    color: isMale
                                        ? ColorsManager.primary
                                        : ColorsManager.gray,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'male',
                                    style: TextStyle(
                                      color: isMale
                                          ? ColorsManager.primary
                                          : ColorsManager.gray,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                            DropdownMenuItem(
                              value: false,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.female,
                                    color: isMale
                                        ? ColorsManager.gray
                                        : ColorsManager.primary,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Female',
                                    style: TextStyle(
                                      color: isMale
                                          ? ColorsManager.gray
                                          : ColorsManager.primary,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                          ],
                          onChanged: (value) {}),
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
                            nationalities[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(),
                          ),
                          onTap: () {
                            _nationalityController.text = nationalities[index];
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
                isPassword: true,
                suffix: Icons.visibility,
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
                isPassword: true,
                suffix: Icons.visibility,
                validator: (value) {
                  if (_passwordController.text != value) {
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
                    print("register");
                  }
                },
              ),

            ],
          ),
        ),
      ];

  List<String> nationalities = [
    'Afghan',
    'Albanian',
    'Algerian',
    'American',
    'Andorran',
    'Angolan',
    'Antiguans',
    'Argentinean',
    'Armenian',
    'Australian',
    'Austrian',
    'Azerbaijani',
    'Bahamian',
    'Bahraini',
    'Bangladeshi',
    'Barbadian',
    'Barbudans',
    'Batswana',
    'Belarusian',
    'Belgian',
    'Belizean',
    'Beninese',
    'Bhutanese',
    'Bolivian',
    'Bosnian',
    'Brazilian',
    'British',
    'Bruneian',
    'Bulgarian',
    'Burkinabe',
    'Burmese',
    'Burundian',
    'Cambodian',
    'Cameroonian',
    'Canadian',
    'Cape Verdean',
    'Central African',
    'Chadian',
    'Chilean',
    'Chinese',
    'Colombian',
    'Comoran',
    'Congolese',
    'Costa Rican',
    'Croatian',
    'Cuban',
    'Cypriot',
    'Czech',
    'Danish',
    'Djibouti',
    'Dominican',
    'Dutch',
    'East Timorese',
    'Ecuadorean',
    'Egyptian',
    'Emirian',
    'Equatorial Guinean',
    'Eritrean',
    'Estonian',
    'Ethiopian',
    'Fijian',
    'Filipino',
    'Finnish',
    'French',
    'Gabonese',
    'Gambian',
    'Georgian',
    'German',
    'Ghanaian',
    'Greek',
    'Grenadian',
    'Guatemalan',
    'Guinea-Bissauan',
    'Guinean',
    'Guyanese',
    'Haitian',
    'Herzegovinian',
    'Honduran',
    'Hungarian',
    'I-Kiribati',
    'Icelander',
    'Indian',
    'Indonesian',
    'Iranian',
    'Iraqi',
    'Irish',
    'Israeli',
    'Italian',
    'Ivorian',
    'Jamaican',
    'Japanese',
    'Jordanian',
    'Kazakhstani',
    'Kenyan',
    'Kittian and Nevisian',
    'Kuwaiti',
    'Kyrgyz',
    'Laotian',
    'Latvian',
    'Lebanese',
    'Liberian',
    'Libyan',
    'Liechtensteiner',
    'Lithuanian',
    'Luxembourger',
    'Macedonian',
    'Malagasy',
    'Malawian',
    'Malaysian',
    'Maldivan',
    'Malian',
    'Maltese',
    'Marshallese',
    'Mauritanian',
    'Mauritian',
    'Mexican',
    'Micronesian',
    'Moldovan',
    'Monacan',
    'Mong',
  ];
}
