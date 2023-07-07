import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/material.dart';

import '../services/api_services.dart';

class CartProvider extends ChangeNotifier {
  List<ProductsModel> _cartItems = [];

  List<ProductsModel> get cartItems => _cartItems;

  void addToCart(ProductsModel product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductsModel product) {
    _cartItems.remove(product);
    notifyListeners();
  }
}
