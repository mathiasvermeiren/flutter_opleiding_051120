import 'package:flutter/material.dart';
import 'package:flutter_opleiding_051120/pages/home_page.dart';
import 'package:flutter_opleiding_051120/screens/main_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (x) => HomePage());
      case "/sessions":
        return MaterialPageRoute(builder: (x) => MainScreen(index: 0));
      case "/speakers":
        return MaterialPageRoute(builder: (x) => MainScreen(index: 1));
      case "/signup":
        return MaterialPageRoute(builder: (x) => MainScreen(index: 2));
      default:
        return _errorPage();
    }
  }

  static Route<dynamic> _errorPage() {
    return MaterialPageRoute(builder: (x) {
      return Scaffold(
        body: Center(
          child: Text('404: Page not found.'),
        ),
      );
    });
  }
}
