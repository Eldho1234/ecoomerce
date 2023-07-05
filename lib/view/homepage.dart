import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controller/shopprovider.dart';
import 'package:ecommerce/model/bottomnavbar.dart';
import 'package:ecommerce/model/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final productProvider = Provider.of<ShopProvider>(context, listen: false);
    productProvider.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProviderr = Provider.of<ShopProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    productProviderr.products.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : CarouselSlider(
                            items: productProviderr.products.map((image) {
                              return Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      image.image.toString(),
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 180.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              viewportFraction: 0.8,
                            ),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    productProviderr.products.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : StaggeredGridView.countBuilder(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            itemCount: productProviderr.products.length,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  final id = Provider.of<ShopProvider>(context,
                                          listen: false)
                                      .products[index];
                                  productProviderr.fetchDetails(id.toString());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SecondScreen(id: id.toString()),
                                      ));
                                },
                                child: ProductTile(
                                    productProviderr.products[index]),
                              );
                            },
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1),
                          ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
