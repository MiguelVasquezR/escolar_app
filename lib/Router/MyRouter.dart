
import 'package:escolar/Pages/HomePage.dart';
import 'package:escolar/Pages/LoginPage.dart';
import 'package:escolar/Pages/RegisterPage.dart';
import 'package:flutter/material.dart';

String ROUTE_HOME = '/';
String ROUTE_LOGIN = '/login';
String ROUTE_REGISTER = '/register';

class MyRouter{

  static Route<dynamic> generateRoute(RouteSettings rs){
    switch(rs.name){
      case "/":
        return MaterialPageRoute(builder: (context) => HomePage(),);
      case "/login":
        return MaterialPageRoute(builder: (context) => LoginPage(),);
      case "/register":
        return MaterialPageRoute(builder: (context) => RegisterPage(),);
      default:
        return MaterialPageRoute(builder: (context) => LoginPage(),);
    }
  }

}