/*

class Routes{
  static const String splashRoute="/";
  static const String onBoardingRoute="/onBoarding";
  static const String loginRoute="/login";
  static const String registerRoute="/register";
  static const String forgotPasswordRoute="/forgotPassword";
  static const String mainRoute="/main";
  static const String storeDetailsRoute="/storeDetails";
}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashView(),);
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (context) => const OnBoardingView(),);
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (context) => const LoginView(),);
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (context) => const RegisterView(),);
      case Routes.forgotPasswordRoute:
        initForgetPasswordModule();
        return MaterialPageRoute(builder: (context) => const ForgetPasswordView(),);
      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (context) => const MainView(),);
      case Routes.storeDetailsRoute:
        initStoreDetailsModule();
        return MaterialPageRoute(builder: (context) => const StoreDetailsView(),);
    default:
      return unDefineRoute();
    }
  }
  static Route<dynamic> unDefineRoute(){
    return MaterialPageRoute(builder: (context) => Scaffold(
      appBar: AppBar(
        title:  Text(AppStrings.noRouteFound.tr()),
      ),
      body:  Center(child: Text(AppStrings.noRouteFound.tr()),),
    ),);
  }
}*/
