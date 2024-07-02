import 'package:flutter/material.dart';
import 'package:organix/constant/routes.dart';
import 'package:organix/models/product_model.dart';
import 'package:organix/view/splash_view/splash_view.dart';
import 'package:organix/view_model/login.dart';
import 'package:organix/view_model/post.dart';
import 'package:organix/view_model/product.dart';
import 'package:organix/view_model/register.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider<RegisterViewwModel>(
          create: (_) => RegisterViewwModel(),
        ),
        ChangeNotifierProvider<ProductViewModel>(
          create: (_) => ProductViewModel(),
        ),
        ChangeNotifierProvider<PostViewModel>(
          create: (_) => PostViewModel(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SplashView(),
          initialRoute: "/",
          routes: routes),
    );
  }
}
