import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller; 
  final Function(String?) validator;
  final String labelText;
  final Function(String) onChanged;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters; 
  final TextInputType? keyboardType;

  const CustomTextFormField({ Key? key,
    required this.controller, 
    required this.validator,
    required this.labelText,
    required this.onChanged,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters, 
    this.keyboardType, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      focusNode: focusNode,
      keyboardType: keyboardType,
      validator: (value) => validator(value),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: ColorConsts.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ColorConsts.grey),
        ),
      ),
      onChanged: (value) {
        onChanged(value);
      },
    );   
  }
} 