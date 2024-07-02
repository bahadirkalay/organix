import 'package:flutter/material.dart';
import 'package:organix/extension/app_extension.dart';
import 'package:organix/services/post_service.dart';
import 'package:organix/view_model/post.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogView extends StatefulWidget {
  const BlogView({super.key});

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await PostService().postService(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final PostViewModel postViewModel = Provider.of<PostViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          width: context.sWidth * .14,
        ),
      ),
      body: Padding(
        padding: context.pageRLPadding.padding,
        child: ListView.builder(
            itemCount: postViewModel.postModel.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, i) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.sWidth,
                    height: context.sHeight * .25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(postViewModel
                                    .postModel[i].image ??
                                "https://images.unsplash.com/photo-1525026198548-4baa812f1183?q=80&w=2834&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                            fit: BoxFit.cover),
                        color: Colors.grey.shade300),
                  ),
                  context.emptyWidget,
                  Text(
                    postViewModel.postModel[i].title ?? "",
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
              );
            }),
      ),
    );
  }
}
