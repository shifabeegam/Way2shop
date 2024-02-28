import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:a/Shopers/Stockdt.dart';
import 'package:a/widgets/HomeButton.dart';
import 'package:a/widgets/Lists.dart';

class ShopHome extends StatelessWidget {
  const ShopHome({super.key});

  @override
  Widget build(BuildContext context) {

      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0xff00655F),
        title: const Text(
          "Way2Shop",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 280,
            decoration: BoxDecoration(color: Color(0xFF10706A)),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: 316,
                  height: 35,
                  decoration: ShapeDecoration(
                    color: Color(0xFF00645E),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF10585D)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Shop Name',
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Stockdt()),
                        );
                      },
                      child: InkWell(
                        onTap: () {
                          print('clicled');



                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const Stockdt()),
                          // );
                        },
                        child: HomeButton(
                          textColor: Colors.white,
                          backgroundColor: Color(0xff0066B65),
                          boxshadowColor: Color(0x3F000000),
                          borderColor: Color(0xff0066B65),
                          text: "Stock details",
                          hight: 61,
                          width: 147,
                          fondSize: 18,
                        ),
                      ),
                    ),
                    HomeButton(
                      textColor: Colors.white,
                      backgroundColor: Color(0xff0066B65),
                      boxshadowColor: Color(0x3F000000),
                      borderColor: Color(0xff0066B65),
                      text: "",
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
                    color: Color(0xFF00645E),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF10585D)),
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
                    color: Color(0xFF00645E),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF10585D)),
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
              color: Colors.black,
            ),
            child: Text(
              "Order Placed",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              Lists(
                width: double.infinity,
                hight: 66,
                custNm: 'anees',
                custPh: '8923541289',
                itemName: 'Red bag ',
                itemPrice: '680',
              ),
              SizedBox(
                height: 1,
              ),
              Lists(
                width: double.infinity,
                hight: 66,
                custNm: 'anees',
                custPh: '8923541289',
                itemName: 'Red bag ',
                itemPrice: '680',
              ),
              SizedBox(
                height: 1,
              ),
              Lists(
                width: double.infinity,
                hight: 66,
                custNm: 'anees',
                custPh: '8923541289',
                itemName: 'Red bag ',
                itemPrice: '680',
              ),
              SizedBox(
                height: 1,
              ),
              Lists(
                width: double.infinity,
                hight: 66,
                custNm: 'anees',
                custPh: '8923541289',
                itemName: 'Red bag ',
                itemPrice: '680',
              ),
            ],
          ),
          /*Stack(children: [
      SizedBox(height: 1,),
      Lists(width: double.infinity,
        hight: 66,
        custNm: 'anees', custPh: '8923541289', itemName: 'Red bag ', itemPrice: '680',),

    ],)*/
        ],
      ),
    );
  }
}
