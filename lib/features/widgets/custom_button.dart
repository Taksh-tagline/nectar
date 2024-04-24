import 'package:flutter/material.dart';
import 'package:nectar/features/const/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.color,
    this.icon,
    required this.onTap,
  });

  final String title;
  final Color color;
  final Widget? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.89,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(19.0),
        ),
        child: icon == null
            ? Center(
                child: Text(
                title,
                style: CustomTextStyle.customButtonTextStyle,
              ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  icon!,
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
