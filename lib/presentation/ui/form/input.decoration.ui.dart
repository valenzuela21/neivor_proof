import 'package:flutter/material.dart';
class InputDecorations {
  static InputDecoration generalInputDecoration(
      {required String hinText,
        required String labelText,
        required Color colorInput,
        required BorderRadius borderRadius,
        Color colorError = const Color(0xffab2626),
        IconData? prefixIcon,
        IconData? suffixIcon}) {

    return InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        border: OutlineInputBorder(
             borderRadius: borderRadius,
            borderSide: BorderSide(color: colorInput, width: 1.0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: colorInput, width: 1.5)),
        hintText: hinText,
        labelText: labelText,
        fillColor: colorInput,
        focusColor: colorInput,
        hoverColor: colorInput,
        counter: const Offstage(),
        labelStyle: TextStyle(color: colorInput, fontWeight: FontWeight.w400),
        hintStyle: TextStyle(fontSize: 18.0, color: colorInput,  fontWeight: FontWeight.w400),
        errorStyle: TextStyle(color: colorError, height: 1.4),
        errorBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: colorError, width: 1.3 )),
        focusedErrorBorder:  OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: colorError, width: 1.5)),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: colorInput) : null,
        prefixIcon:
        prefixIcon != null ? Icon(prefixIcon, color: colorInput) : null);

    }
}