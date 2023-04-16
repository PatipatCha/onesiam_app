
import 'dart:convert';

import 'package:onesiam_app/features/product/domain/domain.dart';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
        required this.productItems,
    });

    List<ProductItem> productItems;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productItems: List.from(json["product_items"]).map((x) => ProductItem.fromJson(x)).toList(),
    );

    Map<String, dynamic> toJson() => {
        "product_items": List<dynamic>.from(productItems.map((x) => x.toJson())),
    };

    List<ProductItemEntity> toEntity() => productItems.map((e) => ProductItemEntity(
      id: e.id,
      name: e.name,
      imageUrl: e.imageUrl,
      price: e.price,
      saved: false
    )).toList();
     
}

class ProductItem {
    ProductItem({
        required this.id,
        this.name,
        this.imageUrl,
        this.price,
    });

    int id;
    String? name;
    String? imageUrl;
    double? price;

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
