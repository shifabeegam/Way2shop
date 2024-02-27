import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Caccount extends StatelessWidget {
  const Caccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:Color(0xff10706A),

        title: Text("Way2Shop",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),


        ),
      ),
      body:
      Column(
        children: [
          Container(width:double.infinity ,
            height: 130,
            decoration: BoxDecoration(color: Color(0xff10706A)),
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

                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(

                          width:30,
                          child: Image.asset("lib/icons/img.png")),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(

                          width:30,
                          child: Image.asset("lib/icons/cart.png")),
                    ),
                    InkWell(
                      onTap: (){},
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
                colors: [Color(0xff10706A), Color(0xff249992)],

                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),

          )
        ],
      ),



      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:Colors.white ,
        color: Color(0xff10706A),
        animationDuration: Duration(milliseconds: 300),
        onTap: (index){},
        items: [
          Icon(Icons.trending_up,color: Colors.white,),
          Icon(Icons.category_outlined,color: Colors.white),
          Icon(Icons.shop_2_outlined,color: Colors.white),
          Icon(Icons.account_circle_outlined,color: Colors.white)


        ],

      ),


    );
  }
}