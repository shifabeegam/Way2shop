import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../IntegrateGoogleMap.dart';
import '../providers/MainProvider.dart';
import 'Cproduct.dart';

class ShopProducts extends StatelessWidget {
  String shopid,Shopname;
  double latitude,longitude;

  ShopProducts({super.key,required this.shopid,required this.Shopname,required this.latitude,required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(centerTitle: false,
        backgroundColor:const Color(0xff650015),

        title: const Text("Way2Shop",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),


        ),
      ),
      body:  SingleChildScrollView(
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
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(
                  onTap: (){
                    MapUtils.launchMaps(latitude,longitude,value.latitude,value.longitude);
                  },
                  child: Container(
                    width:double.infinity ,
                    height: 39,
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined,color: Colors.white,),
                        Text("View Location",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ],
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff650015), Color(0xff7E0922)],

                        begin: Alignment.bottomCenter, end: Alignment.topCenter,
                      ),
                    ),

                  ),
                );
              }
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
              child: Text(Shopname,style: TextStyle(fontSize: 20),),
            ),
            //ListView(
            // children: [

            Consumer<MainProvider>(
                builder: (context,value,child) {
                  return GridView.builder(
                      itemCount: value.allAdditem.length,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8
                      ),
                      itemBuilder: (BuildContext context, index){
                        var item=value.allAdditem[index];
                        return  InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Cproduct(itemid: item.itemid,
                              photo: item.photo,itemname: item.itemname,price: item.price,category: item.category,categoryid: item.categoryid,
                              description: item.description,itemquartity: item.itemquartity,offers: item.offers,color: item.color,brand: item.brand,productdiemension: item.productdiemension,
                              assmbly: item.assmbly,     instruction: item.instruction,shopname: item.shopname,phone: item.shopname,shopdetails: item.shopdetails,place: item.place,
                            ),));
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
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Image.network(
                                        value.allAdditem[index].photo.first,
                                        height: 120,
                                        width: 120,
                                      ),
                                    ),
                                    Text(value.allAdditem[index].itemname,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    Text(value.allAdditem[index].description,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
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
