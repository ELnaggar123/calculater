import 'package:calculater/core/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.textColor = appcolors.textcolor,
      required this.text,
      this.backgroundColor = appcolors.darkgrey,
      required this.onTap});
  Color textColor;
  String text;
  Color backgroundColor;
  void Function(String value) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          onTap(text);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(16)),
          child: text.isEmpty
              ? Icon(
                  Icons.backspace_outlined,
                  size: 29,
                  color: textColor,
                )
              : Text(
                  text,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 29,
                      height: 1.5,
                      fontWeight: FontWeight.w400),
                ),
        ),
      ),
    );
  }
}
