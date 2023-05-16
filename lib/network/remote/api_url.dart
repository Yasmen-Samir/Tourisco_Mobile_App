import 'package:toursim/helper/constants.dart';

class ApiUrl{
  static const String baseLink="https://tourisco.onrender.com";
  static const String baseUrl="https://tourisco.onrender.com/api/";
  static const String createUser="createUser/";
  static const String loginUser="token/";
  static  String govAllGovs()=>"$language/governorates/";
  static  String govDetails(int id)=>"$language/governorates/$id";
  static  String getLandMarkForGov(int id)=>"$language/governorate_landmarks/$id/";
  static  String userData(int id)=>"users/$id";
}