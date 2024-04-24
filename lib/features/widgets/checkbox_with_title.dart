import 'package:flutter/material.dart';
import 'package:nectar/features/const/color.dart';

class CheckBoxWithTitle extends StatefulWidget {
  CheckBoxWithTitle({
    Key? key,
    required this.isChecked,
    required this.title,
  }) : super(key: key);

  bool isChecked;
  String title;

  @override
  State<CheckBoxWithTitle> createState() => _CheckBoxWithTitleState();
}

class _CheckBoxWithTitleState extends State<CheckBoxWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: const BorderSide(
              width: 1.5,
            ),
            activeColor: ColorConst.primaryColor,
            value: widget.isChecked,
            onChanged: (value) {
              setState(() {
                widget.isChecked = value!;
              });
            },
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            color: widget.isChecked == true
                ? ColorConst.primaryColor
                : ColorConst.titleTextColor,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
