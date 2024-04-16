import 'package:a/customer/Caccount.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/GradButton.dart';
import 'Cshops.dart';
import 'Ctrending.dart';

class Ccategory extends StatelessWidget {
  const Ccategory({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider =   Provider.of<MainProvider>(context, listen: false);
    mainProvider.getcategoy();



    return Scaffold(



      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:const Color(0xff650015),

        title: const Text("Way2Shop",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),


        ),
      ),
      body:
      SingleChildScrollView(
        child: Column(
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
                  //SizedBox(height: 10,),
                  const SizedBox(height: 30,),
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff650015), Color(0xff7E0922)],

                  begin: Alignment.bottomCenter, end: Alignment.topCenter,
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Shops",style: TextStyle(fontSize: 20),),
            ),
            //ListView(
            // children: [

            Consumer<MainProvider>(
              builder: (context,value,child) {
                return GridView.builder(
                    itemCount: value.categorylist.length,
                    physics: ScrollPhysics(),
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8
                    ),
                    itemBuilder: (BuildContext context,int index){
                      return  InkWell(
                        onTap: (){},
                        child: Container(
                          width: 146,
                          height: 144,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff8FC7C3), Colors.white],

                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),

                            //color: backgroundColor,
                            borderRadius: BorderRadius.circular(15),
                            border: Border(
                              left: BorderSide(color:Colors.white),
                              top: BorderSide(color:Colors.white),
                              right: BorderSide(color:Colors.white),
                              bottom: BorderSide(width: 1.20, color: Colors.white),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
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
                                  child: Image.network(
                                    value.categorylist[index].photo,
                                    height: 95,
                                    width: 95,
                                  ),
                                ),
                                Text(value.categorylist[index].name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
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







                     });
              }
            ),

            SizedBox(height: 10,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     SizedBox(width: 1,),
            //
            //     SizedBox(width: 1,),
            //     GradButtonImg(text: 'text', assetImage: AssetImage('assets/img.png')),
            //     SizedBox(width: 1,),
            //   ],
            // ),





          ],
        ),
      ),




    );
  }
}
