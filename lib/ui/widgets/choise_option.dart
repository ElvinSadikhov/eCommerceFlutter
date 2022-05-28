// ignore_for_file: unnecessary_this

import 'package:e_commerce_app/consts/color_consts.dart'; 
import 'package:flutter/material.dart'; 

class ChoiseOption extends StatefulWidget {
  final String label; 
  final double fontSize;  
  final dynamic state;

  final Color defaultBoxColor;
  final Color selectedBoxColor;
  final Color defaultTextColor;
  final Color selectedTextColor;
  
  const ChoiseOption({ Key? key, 
  required this.label,   
  required this.fontSize,
  required this.defaultBoxColor, 
  required this.selectedBoxColor, 
  required this.defaultTextColor, 
  required this.selectedTextColor, 
  required this.state }) : super(key: key);

  @override
  State<ChoiseOption> createState() => _ChoiseOptionState();
} 

class _ChoiseOptionState extends State<ChoiseOption> {
  
  @override
  void initState() { 
    super.initState(); 
  }

 
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () { 
        widget.state.chooseOption(widget.label);
        setState(() { }); 
      },
      child: Card( 
        color: widget.state.options[widget.label]! ? widget.selectedBoxColor : widget.defaultBoxColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(width: 1, color: ColorConsts.grey)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(widget.label, style: TextStyle(
            color: widget.state.options[widget.label]! ? widget.selectedTextColor : widget.defaultTextColor,
            fontSize: widget.fontSize,
            fontWeight: FontWeight.w500
            ),
          ),
        )
      ),
    );
  }
}