import 'package:flutter/material.dart';

import '../shared/styles/colors.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    required this.text,
    required this.onTap,
    this.textSize = 17,
    this.radius = 14,
    this.height = 52,
    this.width = double.infinity,
    this.color,
    this.textColor,
});


  double height;
  double width;
  double radius;
  double textSize;
  Color? color;
  String text;
  Color? textColor;
  VoidCallback onTap;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color??defaultColor,
          borderRadius: BorderRadiusDirectional.circular(radius),
          border: Border.all(color:defaultColor )
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          text,
          style: TextStyle(
            color: textColor??Colors.white,
            fontSize: textSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
