import 'package:flutter/material.dart';
import 'package:organix/constant/color.dart';
import 'package:organix/extension/app_extension.dart';
import 'package:organix/services/register_service.dart';
import 'package:organix/view/register_view/validator.dart';
import 'package:organix/view_model/register.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final GlobalKey<FormState> loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final RegisterViewwModel registerViewwModel =
        Provider.of<RegisterViewwModel>(context);

    String? _validatePassword1(String? value) {
      if (value == null || value.isEmpty) {
        return 'Bu alan boş geçilemez';
      }
      if (value.length < 8) {
        return 'Lütfen uzun şifre giriniz';
      }
      return null;
    }

    String? _validatePassword2(String? value) {
      if (value == null || value.isEmpty) {
        return 'Bu alan zorunludur';
      }
      if (value != registerViewwModel.password1.text) {
        return 'Şifre alanları uyuşmamaktadır.';
      }
      return null;
    }

    return Scaffold(
      body: Padding(
        padding: context.pageRLPadding.padding,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logos.png", width: context.sWidth * 0.40),
              context.emptyWidgetset(0.10),
              Form(
                  key: loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Üye Ol",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .merge(TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      context.emptyWidgetset(0.04),
                      TextFormField(
                        controller: registerViewwModel.first_name,
                        validator: validatorRegister,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Adınız",
                          prefixIcon: const Icon(Icons.person_2_outlined),
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
                        controller: registerViewwModel.last_name,
                        validator: validatorRegister,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Soyadınız",
                          prefixIcon: const Icon(Icons.person_2_outlined),
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
                        controller: registerViewwModel.email,
                        validator: validatorRegister,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "E-Posta Adresiniz",
                          prefixIcon: const Icon(Icons.mail_outline_outlined),
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
                        controller: registerViewwModel.username,
                        validator: validatorRegister,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Kullanıcı Adınız",
                          prefixIcon: const Icon(Icons.lock_outline),
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
                        controller: registerViewwModel.password1,
                        validator: _validatePassword1,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Şifreniz",
                          prefixIcon: const Icon(Icons.lock_outline),
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
                        controller: registerViewwModel.password2,
                        validator: _validatePassword2,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Şifreniz Tekrar",
                          prefixIcon: const Icon(Icons.lock_outline),
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
                      context.emptyWidgetset(0.04),
                      ElevatedButton(
                          onPressed: () async {
                            //Navigator.pushNamed(context, "/register");
                            if (loginFormKey.currentState!.validate()) {
                              await RegisterService().registerService(context,
                                  username: registerViewwModel.username.text,
                                  password1: registerViewwModel.password1.text,
                                  password2: registerViewwModel.password2.text,
                                  firstName: registerViewwModel.first_name.text,
                                  lastName: registerViewwModel.last_name.text,
                                  email: registerViewwModel.email.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: AppColor.secondary,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(context.sWidth)),
                              minimumSize: Size(
                                  double.infinity, context.sHeight * 0.07)),
                          child: const Text(
                            "Kayıt Ol",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          )),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
