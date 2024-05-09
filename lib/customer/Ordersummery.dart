import 'package:a/providers/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/GradButton.dart';

import '../widgets/HomeButton.dart';

class Ordersummery extends StatelessWidget {
  const Ordersummery({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0xff650015),
        title: const Text(
          "Way2Shop",
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<MainProvider>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xFF650015)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "Order Summary",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width,
                        child: Consumer<MainProvider>(
                          builder: (context3, value4, child) {
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: value4.userOrdersList.length,
                              itemBuilder: (context, index) {
                                var items = value4.userOrdersList[index];

                                return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: width / 1.2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [


                                        items.itemImage.isNotEmpty
                                            ? Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(items.itemImage),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        )
                                            : Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0xff650015),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),


                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(items.itemName, style: TextStyle(fontSize: 16)),
                                              SizedBox(height: 7),
                                              Text("₹${items.price}", style: TextStyle(fontSize: 16)),
                                              SizedBox(height: 7),
                                              Text("${items.orderTime}", style: TextStyle(fontSize: 16)),
                                              SizedBox(height: 7),
                                              Text("${items.shopName}", style: TextStyle(fontSize: 16)),
                                              SizedBox(height: 7),
                                              Text("${items.shopPlace}", style: TextStyle(fontSize: 16)),
                                              SizedBox(height: 7),
                                              Text(
                                                items.status,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: items.status != "CANCELLED" ? Colors.green : Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      // Row(
                      //   children: [
                      //     GradButton(width: 100, hight: 130, borderColor: Colors.white, boxshadowColor: Colors.grey, backgroundColor: const Color(0xff650015)),
                      //     SizedBox(width: 30),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text("House of Quirk Electric"),
                      //         SizedBox(height: 5),
                      //         Text(
                      //           "grey",
                      //           style: TextStyle(
                      //             fontSize: 15,
                      //             color: Colors.grey,
                      //           ),
                      //         ),
                      //         Row(
                      //           children: [
                      //             Text(
                      //               "20% off",
                      //               style: TextStyle(
                      //                 fontSize: 15,
                      //                 color: Colors.lightGreen,
                      //               ),
                      //             ),
                      //             SizedBox(width: 30),
                      //             Text(
                      //               "₹8,999",
                      //               style: TextStyle(
                      //                 fontSize: 23,
                      //                 color: Colors.black,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //         SizedBox(height: 7),
                      //         Text(
                      //           "Collect Item Before 24 ",
                      //           style: TextStyle(
                      //             fontSize: 14,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 20),
                      // Container(
                      //   width: 80,
                      //   height: 35,
                      //   child: Row(
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.all(6.0),
                      //         child: Text(
                      //           "Qty :",
                      //           style: TextStyle(
                      //             fontSize: 15,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //       ),
                      //       InkWell(
                      //         onTap: () {},
                      //         child: SizedBox(
                      //           width: 23,
                      //           height: 20,
                      //           child: Icon(Icons.arrow_drop_down_outlined, color: Colors.black, size: 30),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      //   decoration: ShapeDecoration(
                      //     color: Colors.white,
                      //     shape: RoundedRectangleBorder(
                      //       side: BorderSide(width: 1, color: Colors.grey),
                      //       borderRadius: BorderRadius.circular(20),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Text(
                  "Ordered Item will be cancelled After 24 hrs  ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
                Consumer<MainProvider>(
                  builder: (context3,val3,child) {
                    return InkWell(
                      onTap: (){
                        val3.goToMap();
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        color: Colors.grey,
                        child: Text("go to map"),
                      ),
                    );
                  }
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "KidoNex",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Phone: 075930 30800 Hours: Open ⋅ Closes 9 pm",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                              width: 23,
                              height: 20,
                              child: Icon(Icons.location_on_outlined, color: Colors.black26, size: 40),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " SH 72, Down Hill, Malappuram, Kerala 676505",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "show map",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(height: 1),
              ],
            ),
          );
        },
      ),
      // bottomNavigationBar: Container(
      //   height: 90,
      //   color: Colors.white,
      //   child: Padding(
      //     padding: const EdgeInsets.all(15.0),
      //     child: Column(
      //       children: [
      //         Container(
      //           width: double.infinity,
      //           height: 3,
      //           color: Colors.grey,
      //         ),
      //         Row(
      //           children: [
      //             Icon(Icons.currency_rupee, color: Colors.black, size: 22),
      //             Text(
      //               '4600',
      //               style: TextStyle(
      //                 color: Colors.black,
      //                 fontSize: 25,
      //               ),
      //             ),
      //             SizedBox(width: 180),
      //             Container(
      //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      //               child: MaterialButton(
      //                 onPressed: () {
      //                   // mainProvider.Shopupload();
      //                 },
      //                 child: const Text("Place Order"),
      //                 highlightColor: Color(0xff0C630A),
      //                 splashColor: Colors.grey,
      //                 color: Colors.green,
      //               ),
      //             )
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}