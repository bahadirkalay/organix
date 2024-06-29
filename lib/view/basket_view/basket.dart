import 'package:flutter/material.dart';
import 'package:organix/constant/color.dart';
import 'package:organix/extension/app_extension.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          width: context.sWidth * 0.15,
        ),
      ),
      body: Padding(
        padding: context.pageRLPadding.padding,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade200),
            width: context.sWidth,
            height: context.sHeight * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: context.sWidth * 0.05),
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2013/07/13/11/29/cherries-158241_1280.png",
                    width: context.sWidth * 0.19,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                      top: context.sHeight * 0.04,
                      bottom: context.sHeight * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kiraz",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .merge(TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Spacer(),
                      Text(
                        "20 ₺",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .merge(TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 6,
                )
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: context.sHeight * 0.05),
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
                      "Ödemeyi Tamamla",
                      style: TextStyle(color: Colors.white),
                    ))),
          ),
        ]),
      ),
    );
  }
}
