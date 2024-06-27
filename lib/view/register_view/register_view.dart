import 'package:flutter/material.dart';
import 'package:organix/constant/color.dart';
import 'package:organix/extension/app_extension.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Adınız Soyadınız",
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
                      onPressed: () {
                        //Navigator.pushNamed(context, "/register");
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColor.secondary,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(context.sWidth)),
                          minimumSize:
                              Size(double.infinity, context.sHeight * 0.07)),
                      child: const Text(
                        "Kayıt Ol",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: Colors.white),
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
