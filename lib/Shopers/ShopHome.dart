import 'package:a/providers/MainProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:a/Shopers/Stockdt.dart';
import 'package:a/widgets/HomeButton.dart';
import 'package:a/widgets/Lists.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../Admin/ViewRequest.dart';

class ShopHome extends StatelessWidget {
  String shopid;
  String shopName;
  String placeName;

  ShopHome({
    super.key,
    required this.shopid,
    required this.shopName,
    required this.placeName,
  });

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0xff650015),
        title: const Text(
          "Way2Shop",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(color: Color(0xff650015)),
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: 316,
                    height: 35,
                    decoration: ShapeDecoration(
                      color: Colors.black26,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.black26),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        shopName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      Consumer<MainProvider>(builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            value.getItemshop(shopid);

                            print('clicled');

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Stockdt(
                                        shopid: shopid,
                                        shopName: shopName,
                                        shopPlace: placeName,
                                      )),
                            );
                          },
                          child: HomeButton(
                            textColor: Colors.white,
                            backgroundColor: Colors.black26,
                            boxshadowColor: Colors.black12,
                            borderColor: Colors.black26,
                            text: "Stock details",
                            hight: 61,
                            width: 147,
                            fondSize: 18,
                          ),
                        );
                      }),
                      HomeButton(
                        textColor: Colors.white,
                        backgroundColor: Colors.black26,
                        boxshadowColor: Colors.black12,
                        borderColor: Colors.black26,
                        text: "Posters",
                        hight: 61,
                        width: 147,
                        fondSize: 18,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: 280,
                    height: 28,
                    decoration: ShapeDecoration(
                      color: Colors.black26,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.black26),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Achivements',
                          style: TextStyle(
                            color: Color(0xFF00FF0A),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        Text(
                          '203',
                          style: TextStyle(
                            color: Color(0xFF00FF0A),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 280,
                    height: 28,
                    decoration: ShapeDecoration(
                      color: Colors.black26,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.black26),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Rejections',
                          style: TextStyle(
                            color: Color(0xFFFF0000),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        Text(
                          '31',
                          style: TextStyle(
                            color: Color(0xFFFF0000),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Colors.white,
              ),
              child: Text(
                "Order Placed",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // ListView(
            //   shrinkWrap: true,
            //   children: [
            //     Lists(
            //       width: double.infinity,
            //       hight: 66,
            //       custNm: 'anees',
            //       custPh: '8923541289',
            //       itemName: 'Red bag ',
            //       itemPrice: '680',
            //     ),
            //     SizedBox(
            //       height: 1,
            //     ),
            //     Lists(
            //       width: double.infinity,
            //       hight: 66,
            //       custNm: 'anees',
            //       custPh: '8923541289',
            //       itemName: 'Red bag ',
            //       itemPrice: '680',
            //     ),
            //     SizedBox(
            //       height: 1,
            //     ),
            //     Lists(
            //       width: double.infinity,
            //       hight: 66,
            //       custNm: 'anees',
            //       custPh: '8923541289',
            //       itemName: 'Red bag ',
            //       itemPrice: '680',
            //     ),
            //     SizedBox(
            //       height: 1,
            //     ),
            //     Lists(
            //       width: double.infinity,
            //       hight: 66,
            //       custNm: 'anees',
            //       custPh: '8923541289',
            //       itemName: 'Red bag ',
            //       itemPrice: '680',
            //     ),
            //   ],
            // ),
            Consumer<MainProvider>(builder: (context, value, child) {
              return Container(
                width: double.infinity,
                //  decoration: BoxDecoration(color: Colors.grey),
                height: 400,

                child: ListView.builder(
                    itemCount: value.shopOrderModelList.length,
                    itemBuilder: (context, index) {
                      var items = value.shopOrderModelList[index];

                      print(
                          value.shopOrderModelList.length.toString() + "jhbhv");

                      return SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        items.customerName,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.red),
                                      ),
                                      Text(
                                        items.phone,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.red),
                                      ),

                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [


                                      Text(
                                        items.productName,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.red),
                                      ),
                                      Text(
                                        items.productPrice,
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  Consumer<MainProvider>(
                                    builder: (context,mainPro,_) {
                                      return items.status!="DISPATCHED"&&items.status!="CANCELED" ?Row(
                                        children: [
                                          // InkWell(
                                          //   onTap:(){
                                          //
                                          //     if(items.duration.inHours > 24){
                                          //       print("fhefgr");
                                          //     }else{
                                          //       print("kerhgfiehd");
                                          //
                                          //     }
                                          //
                                          //   },
                                          //   child: Container(
                                          //     width: 60,
                                          //     height: 30,
                                          //     color: Colors.red,
                                          //     child: Text("Cancel",style: TextStyle(color: Colors.white)),
                                          //   ),
                                          // ),
                                          InkWell(
                                            onTap: (){
                                      mainPro.dispatchFunction(items.productId,items.orderId,shopid);
                                            },
                                            child: Container(
                                              width: 60,
                                              height: 30,
                                              color: Colors.green,
                                              child: Text("Dispatch",style: TextStyle(color: Colors.white),),

                                            ),
                                          ),
                                        ],
                                      ):Text(items.status);
                                    }
                                  )

                                ],
                              ),
                              Divider(
                                height: 2,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    // SizedBox(height: 0.5,);

                    ),
              );
            }),
            /*Stack(children: [
        SizedBox(height: 1,),
        Lists(width: double.infinity,
          hight: 66,
          custNm: 'anees', custPh: '8923541289', itemName: 'Red bag ', itemPrice: '680',),
        
            ],)*/
          ],
        ),
      ),
    );
  }
}
