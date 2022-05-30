import 'package:e_commerce_app/data/image_resources.dart';
import 'package:e_commerce_app/utils/helpers/product.dart';

class Products {

  Products._(); 

  static final List<Product> _products = [
    Product(style: "Classy", title: "Rocktall Dress", price: "€ 48.99", image: ImageResources.rocktallDressAsset),
    Product(style: "Casual", title: "Jeans Shoes", price: "€ 178.99", image: ImageResources.jeansShoes),
    Product(style: "Beach", title: "Crochet Lace", price: "€ 39.99", image: ImageResources.crochetLace), 
  ]; 

  static List<Product> get products => _products;

}

