import 'package:flutter/material.dart';
import 'package:organix/view/home_view/home_view.dart';
import 'package:organix/view/login_view/login_view.dart';
import 'package:organix/view/splash_view/splash_view.dart';

Map<String, WidgetBuilder> get routes {
  return {
    '/splash': (context) => SplashView(),
    '/login': (context) => const LoginView(),
  };
}
