import 'package:flutter/material.dart';
import '../constants/constants.dart';


// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final double height;
  final bool isFilled;
  final IconData prefixIconData;
  final Color iconColor;
  final Color filledColor;
  final String hintText;
  final String labelText;
  final bool isEnable ;
  final Color focusesBorderColor;
  final Color enableBorderColor;
  final double borderRadius;
  final bool obscureText;
  final Function(String)? onChange;
  final TextInputType keyboardType;
  final AutovalidateMode autoValidateMode;
   String? Function(String?)? validate;

   CustomTextField({
    super.key,
    required this.prefixIconData,
    required this.iconColor,
    required this.hintText,
    this.onChange,
    this.height = 15,
    this.isFilled = true,
    this.focusesBorderColor = Constants.kMainColor,
    this.enableBorderColor = Colors.black,
    this.borderRadius = 10,
    this.obscureText = false,
    this.filledColor = Colors.white70,
    this.keyboardType = TextInputType.emailAddress,
    this.validate,
    this.autoValidateMode = AutovalidateMode.disabled,
    required this.labelText, 
     this.isEnable  = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnable,
      autovalidateMode: autoValidateMode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChange,
      validator: validate,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.all(height),
        hintText: hintText,
        fillColor: filledColor,
        filled: isFilled,
        prefixIcon: Icon(
          prefixIconData,
          color: iconColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: focusesBorderColor,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: enableBorderColor,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
