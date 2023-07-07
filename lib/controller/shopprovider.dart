import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShopProvider extends ChangeNotifier {
  List _cartItems = [];

  get cartItems => _cartItems;
  List<ProductsModel> _products = [];

  List<ProductsModel> get products => _products;

  Future<void> fetchProducts() async {
    _products = await ApiService.fetchProducts();
    notifyListeners();
  }

  Future<void> fetchDetails(String id) async {
    _products = await ApiService.fetchProducts();
    notifyListeners();
  }
}
