import 'package:a/customer/Caccount.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/GradButton.dart';
import 'Cproductlist.dart';
import 'Cshops.dart';
import 'Ctrending.dart';

class Ccategory extends StatelessWidget {
  const Ccategory({super.key});

  @override
  Widget build(BuildContext context) {
   MainProvider provider = Provider.of<MainProvider>(context,listen: true);
   provider.getcategoy();
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
              child: Text("Category",style: TextStyle(fontSize: 20),),
            ),
            //ListView(
            // children: [

            Consumer<MainProvider>(
              builder: (context,value,child) {
                return GridView.builder(
                    itemCount: value.categorylist.length,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.9
                    ),
                    itemBuilder: (BuildContext context, index){
                      return  InkWell(
                        onTap: (){
                          value.getItem(value.categorylist[index].id);
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>Productlist(categoryid:value.categorylist[index].id ,categoryname: value.categorylist[index].name,) ,));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 2),
                          child: Container(
                            width: 100,
                            height: 70,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xffB99AA0), Colors.white],

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
                                    padding: const EdgeInsets.all(20),
                                    child: Image.network(
                                      value.categorylist[index].photo,
                                      height: 120,
                                      width: 120,
                                    ),
                                  ),
                                  Text(value.categorylist[index].name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ) ,



                          ),
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
