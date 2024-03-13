import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/GradButton.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:const Color(0xff650015),

        title: const Text("Way2Shop",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),


        ),
      ),
    body:
    Column(
    children: [
      Container(width:double.infinity ,
        height: 130,
        decoration: const BoxDecoration(color: Color(0xff650015)),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 50,
                width:360 ,

                child: const TextField(decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white10), borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),),
                  fillColor: Colors.white10,
                  filled: true,
                  focusedBorder: InputBorder.none,
                  hintText:"Search",
                  hintStyle:TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search,color: Colors.white,),
                  suffixIcon: Icon(Icons.mic,color: Colors.white,),
                ),
                ),
              ),
            ),
            //SizedBox(height: 10,),Box(height: 10,),

    Container(
    decoration: const BoxDecoration( image: DecorationImage(image: AssetImage("assets/img.png", )),),
    width:30,),








    ],
    ),

    ),
        Container(
          width:double.infinity ,
          height: 39,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff650015), Color(0xff7E0922)],

              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,

            ),
          ),

          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:CrossAxisAlignment.center ,
              children: [

              InkWell(
              onTap: (){},

          child: SizedBox(

              width:30,

              child: Image.asset("lib/icons/location2.png")

          ),

        ),
        SizedBox(width: 10.0),
        Text("Choose Location",

          textAlign: TextAlign.left,
          style:TextStyle(

            fontSize: 16,color: Colors.white,
          ),
        ),

        InkWell(
        onTap: (){},
    child: SizedBox(

    width:16,
    height: 10,
    child: Image.asset("lib/icons/dropdown.png",alignment: Alignment.bottomRight,)

    ),

    ),
    ],
    ),
    ),
    const SizedBox(height: 30,),
    Container(
    height: 30,
    width: double.infinity,


    color: Colors.white,
    child: Text("  My Cart",textAlign:TextAlign.start ,style:TextStyle(fontSize: 24,color: Colors.black),
    ),
    ),
    //
    Container(
    width: double.infinity,
    height: 1,
    color: Colors.black12,
    ),
    Container(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    const Padding(
    padding: EdgeInsets.all(10),
    child: Text("Dresses",style: TextStyle(fontSize: 20),),
    ),
    //ListView(
    // children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    const SizedBox(width: 0.5,),
    GradButton(textColor: Colors.black,
    backgroundColor:const Color(0xffDBE3E3) ,
    boxshadowColor:Colors.grey ,
    borderColor: Colors.white,
    text: " ",
    hight: 100,
    width: 80,
    fondSize: 18),

    GradButton(textColor: Colors.black,
    backgroundColor:const Color(0xffDBE3E3) ,
    boxshadowColor:Colors.grey ,
    borderColor: Colors.white,
    text: " ",
    hight: 100,
    width: 80,
    fondSize: 18),
    GradButton(textColor: Colors.black,
    backgroundColor:const Color(0xffDBE3E3) ,
    boxshadowColor:Colors.grey ,
    borderColor: Colors.white,
    text: " ",
    hight: 100,
    width: 80,
    fondSize: 18),
    GradButton(textColor: Colors.black,
    backgroundColor:const Color(0xffDBE3E3) ,
    boxshadowColor:Colors.grey ,
    borderColor: Colors.white,
    text: " ",
    hight: 100,
    width: 80,
    fondSize: 18),

    const SizedBox(width: 0.5,),


    ],
    ),
    const Padding(
    padding: EdgeInsets.all(10),
    child: Text("20 items",style: TextStyle(fontSize: 16,),textAlign: TextAlign.right
    ),
    ),            ],

    ),

    ),
    Container(
    width: double.infinity,
    height: 1,
    color: Colors.black12,
    ),
    Container(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    const Padding(
    padding: EdgeInsets.all(10),
    child: Text("Kitchen Items",style: TextStyle(fontSize: 20),),
    ),
    //ListView(
    // children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    const SizedBox(width: 0.5,),
    GradButton(textColor: Colors.black,
    backgroundColor:const Color(0xffDBE3E3) ,
    boxshadowColor:Colors.grey ,
    borderColor: Colors.white,
    text: " ",
    hight: 100,
    width: 80,
    fondSize: 18),

    GradButton(textColor: Colors.black,
    backgroundColor:const Color(0xffDBE3E3) ,
    boxshadowColor:Colors.grey ,
    borderColor: Colors.white,
    text: " ",
    hight: 100,
    width: 80,
    fondSize: 18),
    GradButton(textColor: Colors.black,
    backgroundColor:const Color(0xffDBE3E3) ,
    boxshadowColor:Colors.grey ,
    borderColor: Colors.white,
    text: " ",
    hight: 100,
    width: 80,
    fondSize: 18),
    GradButton(textColor: Colors.black,
    backgroundColor:const Color(0xffDBE3E3) ,
    boxshadowColor:Colors.grey ,
    borderColor: Colors.white,
    text: " ",
    hight: 100,
    width: 80,
    fondSize: 18),

    const SizedBox(width: 0.5,),


    ],
    ),
    const Padding(
    padding: EdgeInsets.all(10),
    child: Text("15 items",style: TextStyle(fontSize: 16,),textAlign: TextAlign.right
    ),
    ),            ],

    ),

    ),
      Container(
        width: double.infinity,
        height: 1,
        color: Colors.black12,
      ),

    ],

    ),














    );
    }
}




