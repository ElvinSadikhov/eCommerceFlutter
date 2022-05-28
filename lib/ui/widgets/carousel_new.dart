import 'dart:math';
 
import 'package:e_commerce_app/data/products.dart';
import 'package:e_commerce_app/ui/screens/selection_screen.dart';
import 'package:e_commerce_app/ui/widgets/product_item.dart';
import 'package:e_commerce_app/utils/helpers/product.dart';
import 'package:flutter/material.dart';

class CarouselNew extends StatefulWidget {
  const CarouselNew({Key? key}) : super(key: key);

  @override
  _CarouselNewState createState() => _CarouselNewState();
}

class _CarouselNewState extends State<CarouselNew> {
  late PageController _pageController;
  final int _currentPage = 0;

  @override
  void initState() { 
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() { 
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size; 

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: PageView.builder(
              itemCount: Products.products.length,
              physics: const ClampingScrollPhysics(),
              controller: _pageController,
              itemBuilder: (context, index) {
                return carouselView(sizeOfScreen, index);
              }),
          )
        ]
      ),
    );
  }

  Widget carouselView(Size sizeOfScreen, int index) {  
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1); 
        }
        return Transform.rotate(
          angle: pi * value,
          child: ProductItem(
            height: sizeOfScreen.height * 0.35,
            width: sizeOfScreen.width * 0.6, 
            product: Products.products[index]
          ),
        );
      },
    );
  } 
}