import 'package:e_commerce_app/utils/product.dart';

class Products {

  Products._(); 

  static final List<Product> _products = [
    Product(style: "Classy", title: "Rocktall Dress", price: "€ 48.99", image: "assets/images/classy_rocktall_dress.webp"),
    Product(style: "Casual", title: "Jeans Shoes", price: "€ 178.99", image: "assets/images/casual_jeans_shoes.jpg"),
    Product(style: "Beach", title: "Crochet Lace", price: "€ 39.99", image: "assets/images/beach_crochet_lace.jpg"), 
  ]; 

  static List<Product> get products => _products;

}

