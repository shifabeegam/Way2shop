import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/MainProvider.dart';
import 'Cproduct.dart';

class SearchedProducts extends StatelessWidget {
  String userId;
  String userName;
  String userPhone;

  SearchedProducts({super.key,required this.userId,required this.userName,
    required this.userPhone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(centerTitle: false,
        backgroundColor:const Color(0xff800026),

        title: const Text("Way2Shop",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),


        ),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(width:double.infinity ,
              height: 80,
              decoration: const BoxDecoration(color: Color(0xffFFFF)),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 50,
                      width:360 ,

                      child: const TextField(decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white10),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),),
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     InkWell(
                  //       onTap: (){},
                  //       child: Container(
                  //
                  //           width:30,
                  //           child: Image.asset("lib/icons/img.png")),
                  //     ),
                  //     InkWell(
                  //       onTap: (){},
                  //       child: Container(
                  //
                  //           width:30,
                  //           child: Image.asset("lib/icons/cart.png")),
                  //     ),
                  //     InkWell(
                  //       onTap: (){},
                  //       child: Container(
                  //
                  //           width:30,
                  //           child: Image.asset("lib/icons/Order.png")),
                  //     ),
                  //   ],
                  // ),
                ],
              ),

            ),
            // Container(
            //   width:double.infinity ,
            //   height: 39,
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [Color(0xff650015), Color(0xff7E0922)],
            //
            //       begin: Alignment.bottomCenter, end: Alignment.topCenter,
            //     ),
            //   ),
            //
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Text(categoryname,style: TextStyle(fontSize: 20),),
            // ),
            //ListView(
            // children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return GridView.builder(
                        itemCount: value.searchAllitem.length,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 3,
                            childAspectRatio: 0.7 ,
                        ),
                        itemBuilder: (BuildContext context, index){
                          var item=value.searchAllitem[index];
                          return  InkWell(
                            onTap: (){
                              print("sihsuiudhn");
                              value.fetchShopDetails(item.shopId);
print(value.filtershoplist.length);
print("eorfheirgfiu");
                              value.getshopitem(value.searchAllitem[index].itemid);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Cproduct(itemid: item.itemid,
                                photo: item.photo,itemname: item.itemname,price: item.price,category: item.category,categoryid: item.categoryid,
                                description: item.description,itemquartity: item.itemquartity,offers: item.offers,color: item.color,brand: item.brand,productdiemension: item.productdiemension,
                                assmbly: item.assmbly,instruction: item.instruction,
                                shopname: item.shopname,phone: value.shopPhone,shopdetails: value.shopDetails,
                                place: item.place,  userId: userId, shopid: item.shopId, userName: userName, userPhone: userPhone,latitude:value.latShop,
                                  longitude: value.longShop,
                              ),));
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
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Image.network(
                                          value.searchAllitem[index].photo.first,
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),
                                      Text(value.searchAllitem[index].itemname,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),

                                      Text(value.searchAllitem[index].price,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                      Text("${value.searchAllitem[index].offers} % OFF",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                      Text(value.searchAllitem[index].brand,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                      Text(value.searchAllitem[index].shopname,
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
