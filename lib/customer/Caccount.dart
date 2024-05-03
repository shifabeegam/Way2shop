import 'package:a/Shopers/Shoplog.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:provider/provider.dart';

import '../Shopers/Shopkeeperlogin.dart';
import 'Ordersummery.dart';
import 'Wishlist.dart';
import 'cartpage.dart';

class Caccount extends StatelessWidget {
  const Caccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:Color(0xff650015),

        title: Text("Way2Shop",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),


        ),
      ),
      body:
      Column(
        children: [
          Container(width:double.infinity ,
            height: 130,
            decoration: BoxDecoration(color: Color(0xff650015)),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 50,
                    width:360 ,

                    child: TextField(decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),),
                      fillColor: Colors.white24,
                      filled: true,
                      focusedBorder: InputBorder.none,
                      hintText:"Search..... ",
                      hintStyle:TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.search,color: Colors.white,),
                      suffixIcon: Icon(Icons.mic,color: Colors.white,),
                    ),
                    ),
                  ),
                ),
                //SizedBox(height: 10,),

                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (
                                  context) => const Wishlist()),
                        );
                      },
                      child: Container(

                          width:30,
                          child: Image.asset("lib/icons/img.png")),
                    ),
                    InkWell(
                      onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (
                                context) => const cartpage()),
                      );},
                      child: Container(

                          width:30,
                          child: Image.asset("lib/icons/cart.png")),
                    ),
                    InkWell(
                      onTap: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (
                                context) => const Ordersummery()),
                      );},
                      child: Container(

                          width:30,
                          child: Image.asset("lib/icons/Order.png")),
                    ),
                  ],
                ),
              ],
            ),

          ),
          Container(
            width:double.infinity ,
            height: 39,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff650015), Color(0xff7E0922)],

                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),

          ),

          SizedBox(height: 50,),

          Text("Do you want to Add your Shop", style: TextStyle(color: Color(0xff650015),fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          Consumer<MainProvider>(
            builder: (context,value,child) {
              return InkWell(
                onTap: () {
                  value.getPlace();
                  value.handleLocationPermission(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
              builder: (context) =>  Shopkeeperlogin()),
                  );


                },
                child: Container(
                  height: 45,
                  width: 140,
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff650015),
                  ),
                  child: Center(child: Text("Next",style: TextStyle(fontSize: 18,color: Colors.white),)),
                ),
              );
            }
          ),


        ],
      ),



      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor:Colors.white ,
      //   color: Color(0xff650015),
      //   animationDuration: Duration(milliseconds: 300),
      //   onTap: (index){},
      //   items: [
      //     Icon(Icons.trending_up,color: Colors.white,),
      //     Icon(Icons.category_outlined,color: Colors.white),
      //     Icon(Icons.shop_2_outlined,color: Colors.white),
      //     Icon(Icons.account_circle_outlined,color: Colors.white)
      //
      //
      //   ],
      //
      // ),


    );
  }
}