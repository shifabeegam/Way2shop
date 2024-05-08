import 'package:a/customer/Caccount.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/GradButton.dart';
import 'Cproductlist.dart';
import 'Cshops.dart';
import 'Ctrending.dart';
import 'Ordersummery.dart';
import 'Wishlist.dart';
import 'cartpage.dart';

class Ccategory extends StatelessWidget {
  String userId;
  String userName;
  String userPhone;
   Ccategory({super.key,required this.userId,required this.userName,
  required this.userPhone});

  @override
  Widget build(BuildContext context) {
   MainProvider provider = Provider.of<MainProvider>(context,listen: true);
    return Scaffold(



      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:const Color(0xffFFFFFF),

        title: const Text("Way2Shop",
          style: TextStyle(color:Color(0xff650015),fontSize: 20,fontWeight: FontWeight.bold),


        ),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(width:double.infinity ,
              height: 90,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffBDBBBB), Colors.white,],

                  begin: Alignment.bottomCenter, end: Alignment.topCenter,

                ),
                border: Border(
                  bottom: BorderSide(
                    color:  Color(0xffD6D6D6), // Change this color to the desired bottom border color
                    width: 2, // Change this width to the desired bottom border width
                  ),
                ),
              ),

              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 50,
                      width:360 ,

                      child: Consumer<MainProvider>(
                        builder: (context,val,child) {
                          return  TextField(
                            onChanged: (value) {
                              val.searchCategory(value);
                            },
                            decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white10), borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),),
                            fillColor: Colors.white10,
                            filled: true,
                            focusedBorder: InputBorder.none,
                            hintText:"Search",
                            hintStyle:TextStyle(color:  Color(0xffBDBBBB)),

                            suffixIcon: Icon(Icons.search,color: Color(0xffBDBBBB)),
                          ),
                          );
                        }
                      ),
                    ),
                  ),
                  //SizedBox(height: 10,),
                  const SizedBox(height: 30,),

                ],
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
                    itemCount: value.filtercategorylist.length,
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
                          value.getItem(value.filtercategorylist[index].id);
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              Productlist(categoryid:value.filtercategorylist[index].id ,
                                categoryname: value.filtercategorylist[index].name,
                                userId: userId, shopId: '', userName: userName, userPhone: userPhone,) ,));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,left: 2),
                          child: Container(
                            width: 100,
                            height: 70,
                            decoration: BoxDecoration(
                              color:Colors.white ,



                              //color: backgroundColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border(
                                left: BorderSide(color:Color(0xffBDBBBB)),
                                top: BorderSide(color:Color(0xffBDBBBB)),
                                right: BorderSide(color:Color(0xffBDBBBB)),
                                bottom: BorderSide(width: 1.20, color: Color(0xffBDBBBB)),
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
                                      value.filtercategorylist[index].photo,
                                      height: 120,
                                      width: 120,
                                    ),
                                  ),
                                  Text(value.filtercategorylist[index].name,
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
