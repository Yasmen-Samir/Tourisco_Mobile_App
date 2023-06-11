import 'package:toursim/helper/constants.dart';

class ApiUrl{
  static const String baseLink="https://tourisco.onrender.com";
  static const String baseUrl="https://tourisco.onrender.com/api/";
  static const String createUser="createUser/";
  static const String loginUser="token/";
  static const String landmarks="landmarks/";
  static  String tourismCategories="$language/tourism_categories/";
  static  String govAllGovs()=>"$language/governorates/";
  static  String govDetails(int id)=>"$language/governorates/$id";
  static  String getLandMarkForGov(int id)=>"$language/governorate_landmarks/$id/";
  static  String getEventForLandMark(int id)=>"$language/$id/landmark_events";
  static  String getTicketForEvent(int id)=>"$language/tickets/$id/";
  static  String userData(int id)=>"users/$id";
}