import 'dart:ui';
import 'dart:convert';
 
 
class Product {
  Product({
    required this.style,
    required this.title,
    required this.price,
    required this.image,
  });

  final String style;
  final String title;
  final String price;
  final String image;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    style: json["style"],
    title: json["title"],
    price: json["price"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "style": style,
    "title": title,
    "price": price,
    "image": image,
  };

  @override
  operator ==(o) =>
      o is Product &&
      o.style == style &&
      o.title == title &&
      o.price == price &&
      o.image == image;

  @override
  int get hashCode => hashValues(style, title, price, image);

}