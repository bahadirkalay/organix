import 'package:flutter/material.dart';
import 'package:organix/view/basket_view/basket.dart';
import 'package:organix/view/blog/blog.dart';
import 'package:organix/view/home_view/home_view.dart';
import 'package:organix/view/login_view/login_view.dart';
import 'package:organix/view/profile_view/profile_view.dart';
import 'package:organix/view/register_view/register_view.dart';
import 'package:organix/view/splash_view/splash_view.dart';

Map<String, WidgetBuilder> get routes {
  return {
    '/splash': (context) => SplashView(),
    '/login': (context) => LoginView(),
    '/register': (context) => RegisterView(),
    '/home': (context) => HomeView(),
    '/blog': (context) => BlogView(),
    '/profile': (context) => ProfileView(),
    '/basket': (context) => BasketView(),
  };
}
