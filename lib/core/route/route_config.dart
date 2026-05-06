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

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('No Screen Found!'))),
        );
    }
  }
}
