import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:organix/models/login_model.dart';
import 'package:organix/services/const_URL.dart';
import 'package:organix/view_model/login.dart';
import 'package:provider/provider.dart';

final dio = Dio();

class LoginService {
  Future<void> loginService(BuildContext context,
      {String? username, String? password}) async {
    LoginViewModel _lvm = Provider.of<LoginViewModel>(context, listen: false);

    Response response;
    Map<String, String> data = {
      'username': username!,
      'password': password!,
    };

    try {
      //final SharedPreferences prefs = await SharedPreferences.getInstance();
      response = await dio.post(URLService.login, data: data);
      log(response.toString());
      if (response.statusCode == 200 && response.data != null) {
        LoginModel user = LoginModel.fromJson(response.data);
        _lvm.loginModel = user;
        Navigator.pushNamed(context, "/home");
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        // _lvm.statusMessage = e.response!.data['message'];

        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog.adaptive(
              title: const Text("Hata"),
              content: const Text("Kullanıcı adı veya şifreniz hatalıdır"),
              actions: [
                TextButton(
                  child: const Text("Tamam"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        log(e.requestOptions.toString());
        log(e.message.toString());
      }
    }
  }
}
