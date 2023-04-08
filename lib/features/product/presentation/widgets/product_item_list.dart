// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:onesiam_app/models/product_model.dart';

Widget ListViewProduct(List<ProductItem> products) {
  return Expanded(
    child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (_, index) {
          return Container(
            height: 500,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    products[index].imageUrl,
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Text(products[index].name),
                  // Text('฿${products[index].price}')
                ],
              ),
            ),
          );
        }),
  );
}
