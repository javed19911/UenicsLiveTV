import 'package:flutter/material.dart';
import 'package:unics_live_tv/ui/dashboard/DashboardActivity.dart';
import 'package:unics_live_tv/ui/dashboard/vmDashboard.dart';
import 'package:unics_live_tv/ui/login/loginActivity.dart';
import 'package:unics_live_tv/ui/login/vmLogin.dart';
import 'package:unics_live_tv/ui/splash/SplashActivity.dart';
import 'package:unics_live_tv/ui/splash/vmSplash.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  create: (context) => vmSplash(),
                  child: SplashActivity(),
                ));
      case '/login':
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  create: (context) => vmLogin(),
                  child: LoginActivity(),
                ));
      case '/camera':
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  create: (context) => vmLogin(),
                  child: LoginActivity(),
                ));
      case '/dashboard':
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                  create: (context) => vmDashboard(),
                  child: DashboardActivity(),
                ));
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

enum Activity { LOGIN, MOVIE }
