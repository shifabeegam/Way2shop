import 'package:a/customer/Caccount.dart';
import 'package:a/customer/Ccategory.dart';
import 'package:a/customer/Cshops.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Ctrending extends StatelessWidget {
  const Ctrending({super.key});

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
                      hintText:"Search...",
                      hintStyle:TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.search,color: Colors.white,),
                      suffixIcon: Icon(Icons.mic,color: Colors.white,),
                    ),
                    ),
                  ),
                ),
                //SizedBox(height: 10,),

                Container(
                  decoration: BoxDecoration( image: DecorationImage(image: AssetImage("assets/img.png", )),),
                  width:30,),








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

          )
        ],
      ),









      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor:Colors.white ,
      //   color: Color(0xff650015),
      //   animationDuration: Duration(milliseconds: 300),
      //   onTap: (index){},
      //   // items: [
      //   //   Icon(Icons.trending_up,color: Colors.white,),
      //   //   Icon(Icons.category_outlined,color: Colors.white),
      //   //   Icon(Icons.shop_2_outlined,color: Colors.white),
      //   //   Icon(Icons.account_circle_outlined,color: Colors.white)
      //   //
      //   // ],
      //   items: [
      //     InkWell(onTap: (){ Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const Ctrending()),
      //     );
      //     },child: const Icon(Icons.trending_up,color: Colors.white,)),
      //     InkWell(onTap: (){Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const Ccategory()),
      //     );}, child: const Icon(Icons.category_outlined,color: Colors.white)),
      //     InkWell(onTap: (){Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const Cshops()),
      //     );}, child: const Icon(Icons.shop_2_outlined,color: Colors.white)),
      //     InkWell(onTap: (){Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const Caccount()),
      //     );}, child: const Icon(Icons.account_circle_outlined,color: Colors.white))
      //
      //
      //   ],
      //
      // ),


    );
  }
}
