import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:life_style_hub/pages/forget_password_page.dart';
import 'package:life_style_hub/pages/landing_page.dart';
import 'package:life_style_hub/pages/login_page.dart';
import 'package:life_style_hub/pages/registration_page.dart';

class RouteGenerator{
  static Route<dynamic> generateRoutes(RouteSettings settings){

    final args = settings.arguments;

    switch(settings.name){
      case 'login':
        return MaterialPageRoute(builder:(_)=> LoginPage());
      case 'register':
        return MaterialPageRoute(builder:(_)=> RegisterPage());
      case 'forget':
        return MaterialPageRoute(builder:(_)=> ForgetPasswordPage());
      case 'landing-page':
        return MaterialPageRoute(builder:(_)=> LandingPage());
      default:
        return MaterialPageRoute(builder:(_)=> LandingPage());
    }

  }
}