// import 'package:ecommerce/model/product_model.dart';
// import 'package:http/http.dart' as http;

// class HttpService {
//   // static var client = http.Client();

//   static Future<List<ProductsModel>> fetchProducts() async {
//     var response =
//         await http.get(Uri.parse("https://fakestoreapi.com/products"));

//     if (response.statusCode == 200) {
//       var data = response.body;
//       return productsModelFromJson(data);
//     } else {
//       // throw Exception();
//       var data = response.body;
//       return productsModelFromJson(data);
//     }
//   }
// }

import 'dart:convert';

import 'package:ecommerce/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ProductsModel>> fetchProducts() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((productJson) => ProductsModel.fromJson(productJson))
          .toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
