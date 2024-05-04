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
  const Cshops({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context,listen: true);
    // provider.getshop();

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
                            hintStyle:TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.search,color: Colors.white,),
                            suffixIcon: Icon(Icons.mic,color: Colors.white,),
                          ),
                          );
                        }
                      ),
                    ),
                  ),
                  //SizedBox(height: 10,),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (
                                    context) => const cartpage()),
                          );
                        },
                        child: Container(

                            width:30,
                            child: Image.asset("lib/icons/cart.png")),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (
                                    context) => const Ordersummery()),
                          );
                        },
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
                           Navigator.push(context, MaterialPageRoute(builder: (context) =>ShopProducts(shopid:value.filtershoplist[index].id ,Shopname:value.filtershoplist[index].shopname ,latitude:value.filtershoplist[index].latitude,longitude: value.filtershoplist[index].longitude ,) ,));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10,left: 2),
                            child: Container(
                              width: 100,
                              height: 20,
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


