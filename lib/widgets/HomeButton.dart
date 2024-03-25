import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class HomeButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color boxshadowColor;
  final Color borderColor;
  final String text;
  double width;
  double hight;
  double fondSize;

  HomeButton({super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.boxshadowColor,
     required this.borderColor,

     required this.text,
     required this.hight,
     required this.width,
    required this.fondSize,



  }
       );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hight,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border(
          left: BorderSide(color:borderColor),
          top: BorderSide(color:borderColor),
          right: BorderSide(color:borderColor),
          bottom: BorderSide(width: 1.20, color: borderColor),
        ),
        boxShadow: [
          BoxShadow(

            color: boxshadowColor,
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
        child: Center(
          child: Text(text,

            style: TextStyle(

              color: textColor,
              fontSize: fondSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ) ,



    );

  }

}







