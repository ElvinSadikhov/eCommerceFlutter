import 'package:e_commerce_app/consts/color_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField { 

  CustomTextFormField._();
 
  static TextFormField getFormField({
    required TextEditingController controller, 
    required Function(String?) validator,
    required String labelText,
    required Function(String) onChanged,
    FocusNode? focusNode,
    TextInputAction textInputAction = TextInputAction.next,
    List<TextInputFormatter>? inputFormatters, 
    TextInputType? keyboardType,
      }) {

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