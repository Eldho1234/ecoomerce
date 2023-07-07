import 'dart:io';

import 'package:ecommerce/const/cart.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/shopprovider.dart';

class Body extends StatelessWidget {
  final produtid;

  Body({required this.produtid});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, productProvider, child) {
        final products = productProvider.products;
        final selectedProduct =
            products.firstWhere((product) => product.id.toString() == produtid);
        final Size = MediaQuery.of(context).size;
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Size.height,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: Size.height * 0.3),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24))),
                      padding: EdgeInsets.only(
                          top: Size.height * 0.12, left: 20, right: 20),
                      child: Column(children: [
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Category\n",
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: selectedProduct.category,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Rating\n",
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: "${selectedProduct.rating!.rate}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Discription\n",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: selectedProduct.description,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          height: 70,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CartPAge(
                                        cid: produtid,
                                      ),
                                    ));
                              },
                              child: Text("Add To Cart")),
                        )
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Text(
                            selectedProduct.title.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Price\n",
                                      style: TextStyle(color: Colors.white)),
                                  TextSpan(
                                      text: "\$${selectedProduct.price}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))
                                ]),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            selectedProduct.image.toString()),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
