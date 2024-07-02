import 'package:flutter/material.dart';
import 'package:organix/constant/color.dart';
import 'package:organix/extension/app_extension.dart';

// ignore: must_be_immutable
class HomeItemWidget extends StatelessWidget {
  String? title;
  String? images;
  String? pay;
  Function()? onpressed;
  HomeItemWidget(
      {super.key, this.title, this.images, this.pay, this.onpressed});

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
              Center(
                  child: Image.network(
                images ??
                    "https://images.unsplash.com/photo-1481349518771-20055b2a7b24?q=80&w=2739&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                width: context.sWidth * .30,
              )),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.all(context.sWidth * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    child: IconButton(
                        style: const ButtonStyle(),
                        onPressed: onpressed,
                        icon: const Icon(
                          Icons.add,
                          color: AppColor.primary,
                        )),
                  ))
            ],
          ),
        ),
        context.emptyWidget,
        Text(
          pay.toString() + " ₺ ",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .merge(TextStyle(fontWeight: FontWeight.bold)),
        ),
        context.emptyWidgetset(0.003),
        Text(
          title.toString(),
          style: Theme.of(context).textTheme.labelSmall,
        )
      ],
    );
  }
}
