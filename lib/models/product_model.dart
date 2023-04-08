// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
        required this.productItems,
    });

    List<ProductItem> productItems;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productItems: List<ProductItem>.from(json["product_items"].map((x) => ProductItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product_items": List<dynamic>.from(productItems.map((x) => x.toJson())),
    };
}

class ProductItem {
    ProductItem({
        required this.id,
        required this.name,
        required this.imageUrl,
        required this.price,
    });

    int id;
    String name;
    String imageUrl;
    double price;

    factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "price": price,
    };
}
