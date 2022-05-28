// ignore_for_file: unnecessary_this
 
import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/providers/size_state.dart';
import 'package:e_commerce_app/ui/widgets/choise_option.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SizeOption extends StatefulWidget {
  final String label; 
  final double fontSize; 
  
  const SizeOption({ Key? key, 
  required this.label,   
  required this.fontSize}) : super(key: key);

  @override
  State<SizeOption> createState() => _SizeOptionState();
} 

class _SizeOptionState extends State<SizeOption> {
  
  @override
  void initState() { 
    super.initState(); 
  }

 
  @override
  Widget build(BuildContext context) {

    return Consumer<SizeState>(
      builder: (context, SizeState sizeState, _) { 
        return ChoiseOption(
          label: widget.label, 
          fontSize: widget.fontSize, 
          state: sizeState, 
          defaultBoxColor: ColorConsts.white, 
          selectedBoxColor: ColorConsts.orange,
          defaultTextColor: ColorConsts.black, 
          selectedTextColor: ColorConsts.white,
        );
      } 
    );
  }
}