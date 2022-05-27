class Products {

  Products._(); 

  static const List<Map<String, String>> _products = [
    {
      "type": "Classy",
      "title": "Rocktall Dress",
      "price": "€ 48.99",
      "image": "assets/images/classy_rocktall_dress.webp"  
    },
    {
      "type": "Casual",
      "title": "Jeans Shoes",
      "price": "€ 178.99",
      "image": "assets/images/casual_jeans_shoes.jpg"  
    },
    {
      "type": "Beach",
      "title": "Crochet Lace",
      "price": "€ 39.99",
      "image": "assets/images/beach_crochet_lace.jpg"  
    }, 
  ]; 

  static List<Map<String, String>> get products => _products;

}

class Product {
  final String type;
  final String title;
  final String price;
  final String image; 

  Product({
    required this.type, 
    required this.title, 
    required this.price, 
    required this.image
  });
}