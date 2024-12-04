import 'package:erl_app/main.dart';
import 'package:flutter/material.dart';
import 'package:erl_app/view/onboding/onboding_screen.dart';
import 'package:erl_app/Authentikasi/register_page.dart';
import 'package:erl_app/Authentikasi/login_page.dart';
import 'package:erl_app/view/splash.dart';

class Routes {
  static const String splash = '/';
  static const String onboding = '/onbonding';
  static const String register = '/register';
  static const String login = '/login';
  static const String home = '/home';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => Splash());
      case Routes.onboding:
        return MaterialPageRoute(builder: (_) => OnbodingScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return null;
    }
  }
}
