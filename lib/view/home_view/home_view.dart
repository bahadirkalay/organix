import 'package:flutter/material.dart';
import 'package:organix/constant/color.dart';
import 'package:organix/extension/app_extension.dart';
import 'package:organix/services/product_service.dart';
import 'package:organix/view/home_view/widgets/home_items_widgets.dart';
import 'package:organix/view_model/product.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ProductService().productService(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProductViewModel productViewModel =
        Provider.of<ProductViewModel>(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Anasayfa"),
        BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/blog");
                },
                child: Icon(Icons.favorite)),
            label: "Blog"),
        BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/profile");
                },
                child: Icon(Icons.person_2_outlined)),
            label: "Profil")
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: context.sHeight * .05),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(), // İlk Spacer, logoyu sola kaydırır
                    Padding(
                      padding: EdgeInsets.only(left: context.sWidth * 0.10),
                      child: Image.asset(
                        "assets/logo.png",
                        width: MediaQuery.of(context).size.width * 0.20,
                      ),
                    ),
                    Spacer(), // İkinci Spacer, logoyu ortalar
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Badge(
                        label: Text(productViewModel.sayac.toString()),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/basket");
                          },
                          icon: Icon(
                            Icons.shopping_basket_outlined,
                            size: context.sWidth * .08,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
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
                    height: context.sHeight * 0.45,
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // İki sütunlu bir grid
                        crossAxisSpacing: 20, // Yatayda sütunlar arası boşluk
                        mainAxisSpacing: 10, // Dikeyde satırlar arası boşluk
                        childAspectRatio:
                            0.76, // Öğelerin genişlik-yükseklik oranı
                      ),
                      itemCount: productViewModel.productModel.length,
                      itemBuilder: (context, index) {
                        return HomeItemWidget(
                          title: productViewModel.productModel[index].title,
                          images: productViewModel.productModel[index].image,
                          pay: productViewModel.productModel[index].pay
                              .toString(),
                          onpressed: () {
                            productViewModel.basket
                                .add(productViewModel.productModel[index]);
                            productViewModel.sayac += 1;
                            print(productViewModel.productModel[index].title);
                          },
                        );
                      },
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
