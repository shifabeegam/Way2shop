import 'package:a/Shopers/Shoplog.dart';
import 'package:a/customer/varification.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:provider/provider.dart';

import '../Shopers/ShopHome.dart';
import '../Shopers/Shopkeeperlogin.dart';
import '../Shopers/Shoplogin.dart';
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
        backgroundColor:Color(0xffFFFFFF),

        title: Text("Way2Shop",
          style: TextStyle(color: Color(0xff800026),fontSize: 20,fontWeight: FontWeight.bold),


        ),
      ),
      body:
      Column(
        children: <Widget>[


         Center(
             child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(20),
                 child: Column(
                   children: [
                     Padding(
                 padding: const EdgeInsets.only(top: 20,bottom: 10),
                 child: Container(
                   child :Image(
                     image: AssetImage("assets/reg1.jpg"),
                     width: 300,
                   ),
                 ),

               ),
                   ],
                 ),
               ),
             )),
          SizedBox(height: 10,),

          Text("Do you want to Add your Shop", style: TextStyle(color:  Color(0xff800026),fontSize: 18,fontWeight: FontWeight.bold),),
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
                  width: 300,
                  decoration: BoxDecoration(border: Border.all(
                      color: Colors.white),
                    borderRadius: BorderRadius.circular(15),

                 gradient: LinearGradient(
                     colors: [Color(0xff800026), Color(0xffCB470F),Color(0xff800026)],

                     begin: Alignment.bottomLeft, end: Alignment.topRight,

                 ),
                  ),
                  child: Center(child: Text("Add Shop",style: TextStyle(fontSize: 18,color: Colors.white),)),

                ),
              );
            }
          ),


                    SizedBox(height: 10,),



                    Consumer<MainProvider>(
          builder: (context,value,child) {
            return InkWell(
              onTap: () {
               // value.getPlace();
                //value.handleLocationPermission(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  Shoplogin()),
                );


              },
              child: Container(
                height: 45,
                width: 300,
                decoration: BoxDecoration(border: Border.all(
                    color: Colors.white),
                  borderRadius: BorderRadius.circular(15),

                  gradient: LinearGradient(
                    colors: [Color(0xff800026), Color(0xffCB470F),Color(0xff800026)],

                    begin: Alignment.bottomLeft, end: Alignment.topRight,

                  ),
                ),
                child: Center(child: Text("Sign In Shop",style: TextStyle(fontSize: 18,color: Colors.white),)),

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