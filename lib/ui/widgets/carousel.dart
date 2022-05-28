// ignore_for_file: unnecessary_this

import 'package:carousel_slider/carousel_slider.dart'; 
import 'package:e_commerce_app/data/products.dart';
import 'package:e_commerce_app/ui/widgets/product_item.dart';
import 'package:flutter/material.dart'; 

class Carousel extends StatelessWidget {

  final Size sizeOfScreen;
  
  const Carousel({ Key? key, required this.sizeOfScreen }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CarouselSlider(
      items: [
        ...(Products.products).map(
          (product) => ProductItem(
            height: this.sizeOfScreen.height * 0.35,
            width: this.sizeOfScreen.width * 0.6, 
            product: product
          )
        )
      ],  
      options: CarouselOptions(
        enlargeCenterPage: true,  
        initialPage: 1,
        height: sizeOfScreen.height * 0.35 + 120,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1,
        enableInfiniteScroll: false,  
        autoPlayCurve: Curves.elasticInOut,
      ),
    );

  }
}