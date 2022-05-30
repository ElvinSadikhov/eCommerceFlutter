import 'dart:convert';

import 'package:e_commerce_app/utils/helpers/product.dart';

class ProductList {
  ProductList({
    required this.products,
  });

  final List<Product> products;

  factory ProductList.fromRawJson(String str) => ProductList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductList.fromJson(Map<String, dynamic> json) =>  
    ProductList(
      products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );
  

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}