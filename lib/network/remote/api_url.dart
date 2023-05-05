class ApiUrl{
  static const String baseLink="https://tourisco.onrender.com";
  static const String baseUrl="https://tourisco.onrender.com/api/";
  static const String createUser="createUser/";
  static const String loginUser="token/";
  static const String governorates="governorates/";
  static  String govDetails(int id)=>"en/governorates/$id";
  static  String userData(int id)=>"users/$id";
}