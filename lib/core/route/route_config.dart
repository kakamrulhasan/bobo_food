part of 'route_import_path.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteName.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case RouteName.signupScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case RouteName.forgetScreen:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());
      case RouteName.forgetByEmailScr:
        return MaterialPageRoute(builder: (context) => ForgetByEmail());
      case RouteName.forgetPassByOtp:
        return MaterialPageRoute(builder: (context) => ForgetOtpScreen());
      case RouteName.newPassAddForgetScr:
        return MaterialPageRoute(builder: (context) => CreateNewPassScreen());
      case RouteName.signupForgetByEmailScr:
        return MaterialPageRoute(builder: (context) => SignUpForgetByEmail());
      case RouteName.signupForgetPassByOtp:
        return MaterialPageRoute(builder: (context) => SignUpForgetOtpScreen());
      case RouteName.createNewProfile:
        return MaterialPageRoute(builder: (context) => CreateNewProfile());
      case RouteName.addNewAddress:
        return MaterialPageRoute(builder: (context) => AddNewAddress());
      case RouteName.subScriptionScreen:
        return MaterialPageRoute(builder: (context) => SubScriptionScreen());
      case RouteName.bottomNavScreen:
        return MaterialPageRoute(builder: (context) => BottomNavScreen());
      case RouteName.cartScreen:
        return MaterialPageRoute(builder: (context) => CartScreen());
      case RouteName.emptyCardScreen:
        return MaterialPageRoute(builder: (context) => CartEmptyScreen());
      case RouteName.addCouponScreen:
        return MaterialPageRoute(builder: (context) => AddCouponScreen());
      case RouteName.changeAddressScreen:
        return MaterialPageRoute(builder: (context) => ChangeAddressScreen());
      case RouteName.changeCardScreen:
        return MaterialPageRoute(builder: (context) => ChangeCardScreen());
      case RouteName.checkoutScreen:
        return MaterialPageRoute(builder: (context) => CheckoutScreen());
      case RouteName.noCouponAdded:
        return MaterialPageRoute(builder: (context) => NoCouponAddedScreen());
      case RouteName.orderPlacedScreen:
        return MaterialPageRoute(builder: (context) => OrderPlacedScreen());
      case RouteName.profileScreen:
        return MaterialPageRoute(builder: (context) => ProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('No Screen Found!'))),
        );
    }
  }
}
