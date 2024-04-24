import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nectar/features/const/color.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChange,
    this.readOnly,
    this.textInputType,
    this.validator,
    this.maxLength,
    this.inputFormatter,
    this.obscureText,
    this.obscuringCharacter,
    this.maxLine = 1,
    this.contentPadding,
  });

  final TextEditingController controller;
  final String? hintText, labelText;
  final String? obscuringCharacter;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final VoidCallback? onTap;
  final Function(String? value)? onChange;
  final bool? readOnly, obscureText;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLine;
  final double? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscuringCharacter: obscuringCharacter ?? '●',
      obscureText: obscureText ?? false,
      inputFormatters: inputFormatter,
      maxLength: maxLength,
      validator: validator,
      autofocus: false,
      keyboardType: textInputType,
      readOnly: readOnly ?? false,
      onTap: onTap,
      maxLines: maxLine,
      controller: controller,
      style: const TextStyle(
        fontSize: ColorConst.kDefaultPadding / 1.40,
        color: ColorConst.titleTextColor,
        fontWeight: FontWeight.w600,
      ),
      onChanged: onChange,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          counterText: '',
          prefixIcon: prefixIcon,
          contentPadding: EdgeInsets.symmetric(horizontal: contentPadding!),
          suffixIcon: suffixIcon,
          errorMaxLines: 1,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: ColorConst.primaryColor,
          ))),
    );
  }
}
