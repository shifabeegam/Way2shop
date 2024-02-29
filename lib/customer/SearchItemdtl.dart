import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class SearchItemdtl extends StatelessWidget {
  const SearchItemdtl({super.key});
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
            height: 80,
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

               /* Container(
                  decoration: BoxDecoration( image: DecorationImage(image: AssetImage("assets/img.png", )),),
                  width:30,),
*/







              ],

            ),


          ),
          SizedBox(height: 30,),
          Row(
            children: [
              Container(
                height: 210,
                width: 200,
                color: Colors.black,
              ),
              InkWell(
                onTap: (){},
                child: Container(

                    width:30,
                    child: Image.asset("lib/icons/img.png",color: Colors.grey,)),
              ),
            ],
          ),


        ],
      ),












    );
  }
}
