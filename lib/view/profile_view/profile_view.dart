import 'package:flutter/material.dart';
import 'package:organix/constant/color.dart';
import 'package:organix/extension/app_extension.dart';
import 'package:organix/view_model/login.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          width: context.sWidth * 0.15,
        ),
      ),
      body: Padding(
        padding: context.pageRLPadding.padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0), // Kenarlık genişliği
                  decoration: BoxDecoration(
                    color: Colors.green, // Kenarlık rengi
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1640951613773-54706e06851d?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                    maxRadius: context.sWidth * 0.17,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: context.sHeight * 0.04, left: context.sWidth * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            loginViewModel.loginModel.user?.firstName
                                    .toString() ??
                                "",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .merge(TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Text(
                            loginViewModel.loginModel.user?.lastName
                                    .toString() ??
                                "",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .merge(TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Text(
                        "Müşteri",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .merge(TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                context.emptyWidget,
                Container(
                  padding: EdgeInsets.only(
                      top: context.sWidth * 0.04,
                      bottom: context.sWidth * 0.04,
                      left: context.sWidth * 0.02),
                  width: context.sWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade300.withOpacity(0.5)),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        profileItem(context, "Adı : ",
                            loginViewModel.loginModel.user?.firstName ?? ""),
                        profileItem(context, "Soyadı : ",
                            loginViewModel.loginModel.user?.lastName ?? ""),
                        profileItem(context, "E-Posta : ",
                            loginViewModel.loginModel.user?.email ?? ""),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            /* Padding(
              padding: EdgeInsets.only(bottom: context.sHeight * 0.20),
              child: SizedBox(
                  height: context.sHeight * 0.07,
                  width: context.sWidth,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                      ),
                      onPressed: () {
                        // logout(context, userBloc);
                      },
                      child: Text(
                        "Çıkış Yap",
                        style: TextStyle(color: Colors.white),
                      ))),
            ), */
          ],
        ),
      ),
    );
  }
}

Widget profileItem(BuildContext context, String title, String desc) {
  return Padding(
    padding: EdgeInsets.only(bottom: context.sWidth * 0.01),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: context.sWidth * 0.27,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.end,
            )),
        Text(desc.toString())
      ],
    ),
  );
}
