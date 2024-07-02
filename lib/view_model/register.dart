import 'package:flutter/material.dart';
import 'package:organix/models/register_model.dart';
import 'package:organix/services/register_service.dart';

class RegisterViewwModel extends ChangeNotifier {
  RegisterModel _registerModel = RegisterModel();
  TextEditingController username = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();

  RegisterModel get registerModel => _registerModel;

  set registerModel(RegisterModel registerModel) {
    _registerModel = registerModel;
    notifyListeners();
  }
}
