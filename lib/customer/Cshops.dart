import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:a/widgets/GradButton.dart';
import 'package:provider/provider.dart';

import '../IntegrateGoogleMap.dart';
import '../providers/MainProvider.dart';
import 'Caccount.dart';
import 'Ccategory.dart';
import 'Cproductlist.dart';
import 'Ctrending.dart';
import 'Ordersummery.dart';
import 'ShopProducts.dart';
import 'Wishlist.dart';
import 'cartpage.dart';

class Cshops extends StatelessWidget {

  String userId;
  String userName;
  String userPhone;
   Cshops({super.key,required this.userId,required this.userName,
    required this.userPhone});

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context,listen: true);
    // provider.getshop();
    print("eeee $userName");
    print("eee $userId");
    print("eeee $userPhone");

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
              decoration: const BoxDecoration(                        gradient: LinearGradient(
                colors: [Color(0xffBDBBBB), Colors.white,],

                begin: Alignment.bottomCenter, end: Alignment.topCenter,

              ),
                border: Border(
                  bottom: BorderSide(
                    color:  Color(0xffD6D6D6), // Change this color to the desired bottom border color
                    width: 2, // Change this width to the desired bottom border width
                  ),
                ),),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 50,
                      width:360 ,

                      child:  Consumer<MainProvider>(
                        builder: (context,val,child) {
                          return TextField(onChanged: (value) {
                            val.searchShop(value);
                          },
                            decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white10), borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),),
                            fillColor: Colors.white10,
                            filled: true,
                            focusedBorder: InputBorder.none,
                            hintText:"Search",
                            hintStyle:TextStyle(color:  Color(0xffBDBBBB)),
                            suffixIcon: Icon(Icons.search,color:  Color(0xffBDBBBB),),
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
    child: Text("Shops",style: TextStyle(fontSize: 20),),
    ),
    //ListView(
    // children: [
            Consumer<MainProvider>(
                builder: (context,value,child) {
                  return GridView.builder(
                      itemCount: value.filtershoplist.length,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2
                      ),
                      itemBuilder: (BuildContext context, index){
                        return  InkWell(
                          onTap: (){

                            // MapUtils.launchMaps(-3.823216,-38.481700);

                            ///getroutrmap
                            // MapUtils.launchMaps(value.filtershoplist[index].latitude,value.filtershoplist[index].longitude,value.latitude,value.longitude);




                           value.getshopitem(value.filtershoplist[index].id);
                           Navigator.push(context, MaterialPageRoute(builder: (context) =>
                               ShopProducts(shopid:value.filtershoplist[index].id ,
                                 Shopname:value.filtershoplist[index].shopname ,
                                 latitude:value.filtershoplist[index].latitude,
                                 longitude: value.filtershoplist[index].longitude,
                                 userId: userId, userName: userName, userPhone: userPhone,
                               ) ,));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10,left: 2),
                            child: Container(
                              width: 100,
                              height: 20,
                              decoration: BoxDecoration(
                                color:  Colors.white,
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



                                    child :Text(value.filtershoplist[index].shopname,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),


                              ) ,



                            ),
                          ),
                        );

                      });
                }
            ),

    ],
    ),
      ),



    );
  }
}


