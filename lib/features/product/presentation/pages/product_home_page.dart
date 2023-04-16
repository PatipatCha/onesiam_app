import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onesiam_app/features/product/presentation/widgets/widgets.dart';
import 'package:onesiam_app/models/product_model.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  @override
  void initState(){
    setSavedProductItemList();
  }

  setSavedProductItemList(){
    productItemList.forEach((element) {
      //set default
      element.saved = false;
    });
    print(productItemList[0].saved);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('For You'),
        
      ),
      body: Column(
        children: [
          SizedBox(height: 16.0),
          ListViewProduct(products: productItemList)
        ],
      ),
    );
  }
}

ProductModel productList = ProductModel.fromJson(productMockdataList);
List<ProductItem> productItemList = productList.productItems;
Map<String, List<Map<String, Object>>> productMockdataList = {
  "product_items": [
    {
      "id": 1,
      "name": "Puma White (New)",
      "image_url": "https://images.unsplash.com/photo-1608231387042-66d1773070a5?fit=crop&w=300&q=80",
      "price": 250.0
    },
    {
      "id": 2,
      "name": "iPhone 12 Pro Black Edition",
      "image_url": "https://images.unsplash.com/photo-1573148195900-7845dcb9b127?fit=crop&w=300&q=80",
      "price": 1200.0
    },
    {
      "id": 3,
      "name": "Nintendo Switch 2021",
      "image_url": "https://images.unsplash.com/photo-1578303512597-81e6cc155b3e?fit=crop&w=300&q=80",
      "price": 599.0
    },
    {
      "id": 4,
      "name": "Black + Decker",
      "image_url": "https://images.unsplash.com/photo-1574269909862-7e1d70bb8078?fit=crop&w=300&q=80",
      "price": 149.0
    },
    {
      "id": 5,
      "name": "White Neat Mug",
      "image_url": "https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?fit=crop&w=300&q=80",
      "price": 35.0
    },
    {
      "id": 6,
      "name": "SMEG Oven - Winter Collection",
      "image_url": "https://images.unsplash.com/photo-1586208958839-06c17cacdf08?fit=crop&w=300&q=80",
      "price": 8299.0
    },
    {
      "id": 7,
      "name": "Black Table Fan with Pink Moody Cat",
      "image_url": "https://images.unsplash.com/photo-1618941716939-553df3c6c278?fit=crop&w=300&q=80",
      "price": 79.0
    }
  ]
};