import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Costfield extends StatelessWidget {
  final String hintText;

  Costfield({super.key,
    this.width,
     this.hight,
    required this.hintText,
    this.ItemController,


  });
  TextEditingController? ItemController;
  double? width;
  double? hight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??296,
      height: hight??50,
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

      child: TextField(controller: ItemController,decoration: InputDecoration(
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
