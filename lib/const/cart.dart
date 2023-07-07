import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/shopprovider.dart';

class CartPAge extends StatelessWidget {
  final cid;

  const CartPAge({required this.cid});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(builder: (context, productProvider, child) {
      final products = productProvider.products;
      final selectedProduct =
          products.firstWhere((product) => product.id.toString() == cid);
      final Size = MediaQuery.of(context).size;
      return Text(selectedProduct.price.toString());
    });
  }
}
