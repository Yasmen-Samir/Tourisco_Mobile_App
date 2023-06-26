import 'package:toursim/helper/constants.dart';

class ApiUrl{
  static const String baseLink="https://tourisco.onrender.com";
  static const String baseUrl="https://tourisco.onrender.com/api/";
  static const String createUser="create_user/";
  static const String loginUser="token/";
  static const String landmarks="landmarks/";
  static const String landmarksWithBase='https://tourisco.onrender.com/api/landmarks/';
  static  String tourismCategories="$language/tourism_categories/";
  static const String hotels='https://booking-com.p.rapidapi.com/v1/hotels/locations';
  static  String govAllGovs()=>"$language/governorates/";
  static  String govDetails(int id)=>"$language/governorates/$id";
  static  String getLandMarkForGov(int id)=>"$language/governorate_landmarks/$id/";
  static  String getEventForLandMark(int id)=>"$language/$id/landmark_events";
  static  String getTicketForEvent(int id)=>"$language/$id/tickets/";
  static  String userData(int id)=>"users/$id";
  static  String addReviewByIdWithBase(int id)=>'https://tourisco.onrender.com/api/landmark_reviews_with_images/$id/';

}
