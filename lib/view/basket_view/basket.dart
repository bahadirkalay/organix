import 'package:flutter/material.dart';
import 'package:organix/constant/color.dart';
import 'package:organix/extension/app_extension.dart';
import 'package:organix/view_model/product.dart';
import 'package:provider/provider.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductViewModel productViewModel =
        Provider.of<ProductViewModel>(context);
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
          SizedBox(
            height: context.sHeight * 0.75,
            child: ListView.builder(
                itemCount: productViewModel.basket.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, i) {
                  return Container(
                    margin: EdgeInsets.only(bottom: context.sHeight * .03),
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
                            productViewModel.basket[i].image.toString(),
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
                                productViewModel.basket[i].title.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .merge(
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Spacer(),
                              Text(
                                productViewModel.basket[i].pay.toString() +
                                    " ₺ ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .merge(
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 6,
                        )
                      ],
                    ),
                  );
                }),
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
                      double total = 0;
                      productViewModel.basket.forEach((element) {
                        var a = element.pay;
                        total += a!;

                        print(total);
                      });

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog.adaptive(
                            title: const Text("Ödemeyi Tamamla"),
                            content: Text(
                                "Ödemeniz gereken tutar ${total.toString()} ' TL dir,  "),
                            actions: [
                              TextButton(
                                child: const Text("Tamam"),
                                onPressed: () {
                                  productViewModel.basket.clear();
                                  productViewModel.sayac = 0;
                                  Navigator.pushNamed(context, "/home");
                                },
                              ),
                            ],
                          );
                        },
                      );
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
