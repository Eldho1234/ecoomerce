import 'package:ecommerce/controller/shopprovider.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  final String id;

  SecondScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: FutureBuilder<ProductsModel>(
        future: ApiService.fetchProd,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ID: ${user.id}'),
                Text('Name: ${user.name}'),
                Text('Email: ${user.email}'),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
