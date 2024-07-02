import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:organix/models/product_model.dart';
import 'package:organix/models/register_model.dart';
import 'package:organix/services/const_url.dart';
import 'package:organix/view_model/product.dart';
import 'package:organix/view_model/register.dart';
import 'package:provider/provider.dart';

final dio = Dio();

class ProductService {
  Future<List<ProductModel>?> productService(BuildContext context) async {
    ProductViewModel _pvm =
        Provider.of<ProductViewModel>(context, listen: false);

    try {
      Response response = await dio.get(URLService.product);
      log(response.toString());

      if (response.statusCode == 200 && response.data != null) {
        List<ProductModel> productModel = (response.data as List)
            .map((data) => ProductModel.fromJson(data))
            .toList();
        _pvm.productModel = productModel;
        return productModel;
      } else {
        throw Exception(
            'HTTP ${response.statusCode}, response data: ${response.data}');
      }
    } catch (e) {
      // Hata durumunda uyarı gösterimi yerine burada loglama yapılabilir veya uygun şekilde kullanıcıya geri bildirim verilebilir
      log('Hata oluştu: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Hata"),
            content: Text(
                "Servis veri çekerken bir hata oluştu. Lütfen tekrar deneyin."),
            actions: [
              TextButton(
                child: Text("Tamam"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return null;
    }
  }
}
