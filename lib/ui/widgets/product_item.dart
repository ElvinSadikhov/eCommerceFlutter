// ignore_for_file: unnecessary_this
 
import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/size_consts.dart';
import 'package:e_commerce_app/utils/helpers/product.dart'; 
import 'package:e_commerce_app/providers/favourite_state.dart'; 
import 'package:e_commerce_app/ui/screens/selection_screen.dart';
import 'package:e_commerce_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  final double height;
  final double width;  
  final double iconSize;
  final Product product; 
  
  const ProductItem({ Key? key, 
    required this.height, 
    required this.width, 
    this.iconSize = SizeConsts.kDefaultIconSize, 
    required this.product }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}
  
class _ProductItemState extends State<ProductItem> {
 
  final GetStorage localStorage = GetStorage("Favourites");
  final FavouriteState favouriteState = FavouriteState();
   
  @override
  Widget build(BuildContext context) { 

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectionScreen(product: widget.product)),
            );
          },
          child: Stack(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      widget.product.image,
                      fit: BoxFit.cover,
                      height: widget.height,
                      width: widget.width,
                    ),
                  ),
                  WidgetMethods.verticalSpace(15),
                  Text(
                    "${widget.product.style} ${widget.product.title}",
                    style: const TextStyle(
                      color: ColorConsts.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  WidgetMethods.verticalSpace(5),
                  Text.rich(
                     TextSpan(
                       text: widget.product.price.substring(0, 2),
                       style: const TextStyle(
                        color: ColorConsts.orange,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                      children: [
                        TextSpan(
                          text: widget.product.price.substring(2),
                          style: const TextStyle(
                            color: ColorConsts.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          )
                        )
                      ],
                     ), 
                  )
                ],
              ),
              Positioned(
                top: 15,
                right: 12,
                child: Consumer<FavouriteState>(
                  builder: (context, FavouriteState favouriteState, _) {
                    return GestureDetector(
                      onTap: () {
                        debugPrint("Like button has been pressed!"); 
                        favouriteState.changeState(widget.product);
                        // List data = localStorage.read("favourites") ?? []; 
                        // data.add(widget.product); 
                        // localStorage.write("favourites", data); 
                      }, 
                      child: favouriteState.isFavourite(widget.product) ? 
                        Icon(Icons.favorite, color: ColorConsts.red, size: widget.iconSize,) :
                          Icon(Icons.favorite_border_outlined, size: widget.iconSize,),
                    );
                  }, 
                ),  
              ), 
            ],
          ),
        ),
      ],
    );
  }
} 