import 'package:ecommerce/controller/shopprovider.dart';
import 'package:ecommerce/model/product_model.dart';

import 'package:ecommerce/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ShopProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      );
}
