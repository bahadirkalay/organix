import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:organix/models/register_model.dart';
import 'package:organix/services/const_url.dart';
import 'package:organix/view_model/register.dart';
import 'package:provider/provider.dart';

final dio = Dio();

class RegisterService {
  Future<void> registerService(BuildContext context,
      {required String username,
      required String password1,
      required String password2,
      required String firstName,
      required String lastName,
      required String email}) async {
    RegisterViewwModel _rvm =
        Provider.of<RegisterViewwModel>(context, listen: false);

    Response response;
    Map<String, String> data = {
      'username': username,
      'password1': password1,
      'password2': password2,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
    };

    try {
      //final SharedPreferences prefs = await SharedPreferences.getInstance();
      response = await dio.post(URLService.register, data: data);
      log(response.toString());
      if (response.statusCode == 201 && response.data != null) {
        RegisterModel user = RegisterModel.fromJson(response.data);
        _rvm.registerModel = user;
        Navigator.pushNamed(context, "/home");
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 400 &&
          e.response!.statusMessage!.isNotEmpty) {
        // _lvm.statusMessage = e.response!.data['message'];

        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog.adaptive(
              title: const Text("Hata"),
              content: const Text(
                  """Bu parola çok kısa. En az 8 karakter içermek zorunda.\n
        Bu parola çok geneldir.\n
        Bu parola tamamıyla sayısaldır."""),
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
