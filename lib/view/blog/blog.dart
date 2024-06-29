import 'package:flutter/material.dart';
import 'package:organix/extension/app_extension.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          width: context.sWidth * .14,
        ),
      ),
      body: Padding(
        padding: context.pageRLPadding.padding,
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: context.sWidth,
                  height: context.sHeight * .25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1525026198548-4baa812f1183?q=80&w=2834&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                          fit: BoxFit.cover),
                      color: Colors.grey.shade300),
                  child: Center(
                    child: Image.asset(
                      "assets/play.png",
                      width: context.sWidth * 0.20,
                    ),
                  ),
                ),
                context.emptyWidget,
                Text(
                  "Çiftçiler Hakında Açıklama",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .merge(TextStyle(fontWeight: FontWeight.bold)),
                ),
                context.emptyWidgetset(0.006),
                Text(
                  "Lorem ipsum " * 8,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .merge(TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
