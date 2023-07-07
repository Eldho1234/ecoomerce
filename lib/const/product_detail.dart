import 'package:ecommerce/const/body.dart';
import 'package:ecommerce/controller/shopprovider.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  final String id;

  SecondScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blue,
      body: Body(produtid: id),
    );
  }
}
