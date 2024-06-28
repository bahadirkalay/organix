import 'package:flutter/material.dart';
import 'package:organix/constant/color.dart';
import 'package:organix/extension/app_extension.dart';
import 'package:organix/view/home_view/widgets/home_items_widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: context.sHeight * .05),
            child: Center(
              child: Image.asset(
                "assets/logo.png",
                width: context.sWidth * 0.20,
              ),
            ),
          ),
          Image.asset(
            "assets/banner.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: context.pageRLPadding.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.emptyWidget,
                Text(
                  "Kategoriler",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .merge(TextStyle(fontWeight: FontWeight.bold)),
                ),
                context.emptyWidget,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: context.sWidth * 0.02),
                        child: InputChip(
                          onPressed: () {},
                          selectedColor: Colors.transparent,
                          selected: false,
                          label: Text(
                            "Meyve & Sebze",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: AppColor.primary,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: AppColor.primary),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: context.sWidth * 0.02),
                        child: InputChip(
                          showCheckmark: false,
                          selected: true,
                          selectedColor: Colors.transparent,
                          onPressed: () {
                            print("Basılsı");
                          },
                          label: Text(
                            "Meyve & Sebze",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: context.sWidth * 0.02),
                        child: InputChip(
                          showCheckmark: false,
                          selected: true,
                          selectedColor: Colors.transparent,
                          onPressed: () {
                            print("Basılsı");
                          },
                          label: Text(
                            "Meyve & Sebze",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: context.sWidth * 0.02),
                        child: InputChip(
                          showCheckmark: false,
                          selected: true,
                          selectedColor: Colors.transparent,
                          onPressed: () {
                            print("Basılsı");
                          },
                          label: const Text(
                            "Sağlık Ürünleri",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: context.sHeight * 0.55,
                  child: ListView(
                    shrinkWrap: true,
                    children: const [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Wrap(
                              spacing:
                                  50, // Öğeler arasındaki yatay boşluk (İsteğe bağlı)
                              runSpacing:
                                  50, // Öğeler arasındaki dikey boşluk (İsteğe bağlı)
                              children: [
                                HomeItemWidget(),
                                HomeItemWidget(),
                                HomeItemWidget(),
                                HomeItemWidget(),
                                HomeItemWidget(),
                                HomeItemWidget(),
                                HomeItemWidget(),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
