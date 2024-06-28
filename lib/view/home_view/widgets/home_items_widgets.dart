import 'package:flutter/material.dart';
import 'package:organix/constant/color.dart';
import 'package:organix/extension/app_extension.dart';

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.sWidth * 0.40,
          height: context.sWidth * 0.40,
          color: Colors.grey.shade200,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.all(context.sWidth * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    child: IconButton(
                        style: const ButtonStyle(),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: AppColor.primary,
                        )),
                  )),
              Center(
                  child: Image.asset(
                "assets/logo.png",
                width: context.sWidth * .30,
              ))
            ],
          ),
        ),
        context.emptyWidget,
        Text(
          "48.50 ₺",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .merge(TextStyle(fontWeight: FontWeight.bold)),
        ),
        context.emptyWidgetset(0.003),
        Text(
          "Milagro Yerli Muz - 600 Gr",
          style: Theme.of(context).textTheme.labelSmall,
        )
      ],
    );
  }
}
