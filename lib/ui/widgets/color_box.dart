import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:e_commerce_app/consts/size_consts.dart';
import 'package:e_commerce_app/providers/color_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorBox extends StatefulWidget {
  final Color fillColor;
  

  const ColorBox({ Key? key, required this.fillColor }) : super(key: key);

  @override
  State<ColorBox> createState() => _ColorBoxState();
}

class _ColorBoxState extends State<ColorBox> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorState>(
      builder: (context, ColorState colorState, _) {
        return GestureDetector(
          onTap: () { colorState.select(widget.fillColor); },
          child: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Card( 
              color: colorState.isSelected(widget.fillColor) ? widget.fillColor : widget.fillColor.withOpacity(0.35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  width: 2, 
                  color: colorState.isSelected(widget.fillColor) ? ColorConsts.orange.withAlpha(240) : widget.fillColor.withOpacity(0)
                  )
              ), 
              child: const SizedBox(
                height: SizeConsts.colorBoxSize, 
                width: SizeConsts.colorBoxSize,
              ),
            ),
          ),
        );
      } 
    );
  }
}
 