import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class GradButton extends StatelessWidget {
  final Color? textColor;
  final Color? backgroundColor;
  final Color? boxshadowColor;
  final Color? borderColor;
  final String? text;
  //final AssetImage assetImage;
  double? width;
  double? hight;
  double? fondSize;

  GradButton({super.key,
     this.textColor,
    this.backgroundColor,
    this.boxshadowColor,
     this.borderColor,

     this.text,
   // required this.assetImage,
     this.hight,
     this.width,
    this.fondSize,



  }
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: width??185,
        height: hight??55,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff8FC7C3), Colors.white],

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border(
            left: BorderSide(color:borderColor??Colors.white),
            top: BorderSide(color:borderColor??Colors.white),
            right: BorderSide(color:borderColor??Colors.white),
            bottom: BorderSide(width: 1.20, color: borderColor??Colors.white),
          ),
          boxShadow: [
            BoxShadow(
              color: boxshadowColor??Colors.grey,
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Column(
            children: [

              //Image(image:assetImage), // Using AssetImage

               // height: 95,),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(text??"",
                  style: TextStyle(
                    color: textColor,
                    fontSize: fondSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ) ,



      ),
    );

  }

}

class GradButtonImg extends StatelessWidget {
  final Color? textColor;
  final Color? backgroundColor;
  final Color? boxshadowColor;
  final Color? borderColor;
  final String text;
  AssetImage assetImage;
  double? width;
  double? hight;
  double? fondSize;
   GradButtonImg({super.key,
     this.textColor,
     this.backgroundColor,
     this.boxshadowColor,
     this.borderColor,

     required this.text,
     required this.assetImage,
     this.hight,
     this.width,
     this.fondSize,
   });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: width??146,
        height: hight??144,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff8FC7C3), Colors.white],

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),

          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border(
            left: BorderSide(color:borderColor??Colors.white),
            top: BorderSide(color:borderColor??Colors.white),
            right: BorderSide(color:borderColor??Colors.white),
            bottom: BorderSide(width: 1.20, color: borderColor??Colors.white),
          ),
          boxShadow: [
            BoxShadow(
              color: boxshadowColor??Colors.grey,
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                    image: assetImage,
                    height: 95,
                    width: 95,
                  ),
              ),
              Text(text,
                style: TextStyle(
                  color: textColor,
                  fontSize: fondSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ) ,



      ),
    );
  }
}

class  imgSlide extends StatelessWidget {

   imgSlide({super.key,
    required this.Pruduct_image,
     this.img_number,

  });
  AssetImage Pruduct_image;
  String? img_number;

  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: Image (image: Pruduct_image,
            height: 100,
            width: 100,
            ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 20,
            width: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: Center(child: Text(img_number??'',
             style: TextStyle(fontSize: 12),),),
          ),
        )
      ],
    );
  }
}







