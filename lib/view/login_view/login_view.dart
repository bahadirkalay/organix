import 'package:flutter/material.dart';
import 'package:organix/constant/color.dart';
import 'package:organix/extension/app_extension.dart';
import 'package:organix/services/login_service.dart';
import 'package:organix/view/login_view/validator.dart';
import 'package:organix/view_model/login.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final GlobalKey<FormState> loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(
          right: context.sWidth * 0.02, left: context.sWidth * 0.02),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: context.sHeight * 0.05),
            child: Center(
              child: Image.asset(
                "assets/logos.png",
                width: context.sWidth * 0.40,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: context.sHeight * 0.15,
              ),
              child: Form(
                key: loginFormKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "HOŞGELDİN!",
                        style: Theme.of(context).textTheme.titleLarge!.merge(
                            TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: context.sWidth * 0.07)),
                      ),
                      context.emptyWidgetset(0.10),
                      TextFormField(
                        validator: validatorUsername,
                        controller: loginViewModel.username,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Kullanıcı Adı",
                          prefixIcon: Icon(Icons.mail_outline_outlined),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide.none),
                          labelStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {},
                      ),
                      context.emptyWidget,
                      TextFormField(
                        validator: validatorPassword,
                        controller: loginViewModel.password,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Şifreniz",
                          prefixIcon: const Icon(Icons.lock_outlined),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: BorderSide.none),
                          labelStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {},
                      ),
                    ]),
              )),
          context.emptyWidgetset(0.07),
          ElevatedButton(
              onPressed: () async {
                if (loginFormKey.currentState!.validate()) {
                  await LoginService().loginService(context,
                      username: loginViewModel.username.text,
                      password: loginViewModel.password.text);
                }

                print(loginViewModel.username);
                print(loginViewModel.password);
                //Navigator.of(context).pushNamed("/home");
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.sWidth)),
                  minimumSize: Size(double.infinity, context.sHeight * 0.07)),
              child: const Text(
                "GİRİŞ",
                style:
                    TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
              )),
          context.emptyWidget,
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/register");
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColor.secondary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.sWidth)),
                  minimumSize: Size(double.infinity, context.sHeight * 0.07)),
              child: const Text(
                "Üye Ol",
                style:
                    TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
              )),
        ],
      ),
    ));
  }
}
