// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/utils/product.dart';
import 'package:flutter/material.dart';

class Purchase { 
  Product product;
  String size;
  Color color; 
  int count;
 
  Purchase({
    required this.product,
    required this.size,
    required this.color, 
    required this.count, 
  }); 

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