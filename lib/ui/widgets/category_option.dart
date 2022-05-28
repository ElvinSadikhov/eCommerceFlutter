// ignore_for_file: unnecessary_this
 
import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/providers/category_state.dart'; 
import 'package:e_commerce_app/ui/widgets/choise_option.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryOption extends StatefulWidget {
  final String label; 
  final double fontSize; 
  
  const CategoryOption({ Key? key, 
  required this.label,   
  required this.fontSize}) : super(key: key);

  @override
  State<CategoryOption> createState() => _CategoryOptionState();
} 

class _CategoryOptionState extends State<CategoryOption> {
  
  @override
  void initState() { 
    super.initState(); 
  }

 
  @override
  Widget build(BuildContext context) {

    return Consumer<CategoryState>(
      builder: (context, CategoryState categoryState, _) { 
        return ChoiseOption(
          label: widget.label, 
          fontSize: widget.fontSize, 
          state: categoryState,
          defaultBoxColor: ColorConsts.white, 
          selectedBoxColor: ColorConsts.black,
          defaultTextColor: ColorConsts.black, 
          selectedTextColor: ColorConsts.white,
        );
      } 
    );
  }
}