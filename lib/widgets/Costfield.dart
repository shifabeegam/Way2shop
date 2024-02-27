import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Costfield extends StatelessWidget {
  double width;
  double hight;
  final String hintText;

  Costfield({super.key,
    required this.width,
    required this.hight,
    required this.hintText,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hight,
      decoration: BoxDecoration(
        color: Color(0xFFDBE3E3),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),

      child: TextField(decoration: InputDecoration(
        //border: OutlineInputBorder(),),
       // fillColor: Colors.white24,
        filled: true,
        focusedBorder: InputBorder.none,
        hintText:hintText,
        hintStyle:TextStyle(color: Colors.grey),
       // prefixIcon: Icon(Icons.search,color: Colors.white,),
       // suffixIcon: Icon(Icons.mic,color: Colors.white,),
      ),
      ),
    );
  }
}
