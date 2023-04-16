import 'package:flutter/material.dart';
import 'package:onesiam_app/features/product/domain/domain.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({Key? key, required this.product}) : super(key: key);
  late ProductItemEntity product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Image.network(widget.product.imageUrl!),
          const SizedBox(height: 10),
          Text(widget.product.name!),
          const SizedBox(height: 10),
          Text(widget.product.price!.toString()),
        ],),
      ),
    );
  }
}