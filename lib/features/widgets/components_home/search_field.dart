import 'package:flutter/material.dart';
import 'package:nectar/features/const/color.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {super.key,
      this.suffixIcon,
      this.onChange,
      this.onTap,
      this.readOnly,
      required this.controller});

  final IconButton? suffixIcon;
  final Function(String)? onChange;
  final VoidCallback? onTap;
  final bool? readOnly;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      onChanged: onChange,
      readOnly: readOnly ?? false,
      style: const TextStyle(
          color: ColorConst.titleTextColor, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
        prefixIcon: const Icon(Icons.search_outlined),
        suffixIcon: suffixIcon,
        filled: true,
        hintText: 'Search Store',
        hintStyle: const TextStyle(
          color: ColorConst.titleTextColor,
          fontWeight: FontWeight.bold,
        ),
        fillColor: ColorConst.searchField,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none),
      ),
    );
  }
}
