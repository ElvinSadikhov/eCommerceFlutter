// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/utils/helpers/product.dart';
import 'package:flutter/material.dart'; 
import 'dart:convert';

 
class Purchase {
    Purchase({
        required this.product,
        required this.size,
        required this.color,
        required this.count,
    });

    final Product product;
    final String size;
    final Color color; 
    int count;

    factory Purchase.fromRawJson(String str) => Purchase.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
        product: Product.fromJson(json["product"]),
        size: json["size"],
        color: Color(int.parse(json["colorValueAsString"])),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "size": size,
        "colorValueAsString": color.value.toString(),
        "count": count,
    };

    Purchase decrementCount() { 
      this.count -= 1;
      return this;
    }

    Purchase incrementCount() {
      this.count += 1;
      return this;
    }

    @override
    operator ==(o) =>
        o is Purchase &&
        o.product == product &&
        o.size == size &&
        o.color == color;

    @override
    int get hashCode => hashValues(product, size, color);

}


// // ignore_for_file: unnecessary_this

// import 'package:e_commerce_app/utils/helpers/product.dart';
// import 'package:flutter/material.dart';

// class Purchase { 
//   Product product;
//   String size;
//   Color color; 
//   int count;
 
//   Purchase({
//     required this.product,
//     required this.size,
//     required this.color, 
//     required this.count, 
//   }); 

//   Purchase decrementCount() {
//     this.count -= 1;
//     return this;
//   }

//   Purchase incrementCount() {
//     this.count += 1;
//     return this;
//   }

//   @override
//   operator ==(o) =>
//       o is Purchase &&
//       o.product == product &&
//       o.size == size &&
//       o.color == color;

//   @override
//   int get hashCode => hashValues(product, size, color);
 
// }