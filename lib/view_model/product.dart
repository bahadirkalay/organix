import 'package:flutter/material.dart';
import 'package:organix/models/product_model.dart';
import 'package:organix/models/register_model.dart';
import 'package:organix/services/register_service.dart';

class ProductViewModel extends ChangeNotifier {
  List<ProductModel> _productModel = [ProductModel()];
  int _sayac = 0;

  List<ProductModel> _basket = [];

  List<ProductModel> get productModel => _productModel;

  List<ProductModel> get basket => _basket;

  int get sayac => _sayac;

  set productModel(List<ProductModel> productModel) {
    _productModel = productModel;
    notifyListeners();
  }

  set basket(List<ProductModel> basket) {
    _basket = basket;

    notifyListeners();
  }

  set sayac(int value) {
    _sayac = value;

    notifyListeners();
  }
}
