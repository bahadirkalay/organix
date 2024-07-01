import 'package:flutter/material.dart';
import 'package:organix/models/login_model.dart';

class LoginViewModel extends ChangeNotifier {
  LoginModel _loginModel = LoginModel();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginModel get loginModel => _loginModel;

  set loginModel(LoginModel loginModel) {
    _loginModel = loginModel;
    notifyListeners();
  }
}
