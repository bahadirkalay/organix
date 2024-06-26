import 'package:flutter/material.dart';
import 'package:organix/view/home_view/home_view.dart';
import 'package:organix/view/login_view/login_view.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _AuthState();
}

class _AuthState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF00BF63),
      child: Image.asset(
        "assets/logo_white.png",
      ),
    );
  }
}
