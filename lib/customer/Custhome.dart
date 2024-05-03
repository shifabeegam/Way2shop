import 'package:a/customer/Ordersummery.dart';
import 'package:a/customer/Wishlist.dart';
import 'package:a/customer/cartpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:a/customer/Caccount.dart';
import 'package:a/customer/Ccategory.dart';
import 'package:a/customer/Cshops.dart';
import 'package:a/customer/Ctrending.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/MainProvider.dart';


class Custhome extends StatelessWidget {
  const Custhome({super.key});

  //get mainProvider => null;


  @override
  Widget build(BuildContext context) {
   // mainProvider.getItem();
    int myInteger ;
    int scode;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:const Color(0xff650015),

        title: const Text("Way2Shop",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),


        ),
      ),
      body:
                Column(
                  children: [

                    Expanded(
                      flex: 5,

                      child: Consumer<MainProvider>(
                         builder: (context,value,child) {
                           return  SingleChildScrollView(
                             child: Column(
                               children: [
                                 Container(width: double.infinity,
                                   height: 130,
                                   decoration: const BoxDecoration(color: Color(
                                       0xff650015)),
                                   child: Column(
                                     children: [
                                       Center(
                                         child: Container(
                                           height: 50,
                                           width: 360,

                                           child:  TextField(

                                             onSubmitted: (text){
                                          //  value.getSearchProducts(text, );
                                           },
                                             decoration: InputDecoration(
                                               border: OutlineInputBorder(
                                                 borderSide: BorderSide(
                                                     color: Colors.white10),
                                                 borderRadius: BorderRadius
                                                     .only(
                                                     topLeft: Radius.circular(
                                                         15),
                                                     bottomRight: Radius
                                                         .circular(15)),),
                                               fillColor: Colors.white10,
                                               filled: true,
                                               focusedBorder: InputBorder.none,
                                               hintText: "Search",
                                               hintStyle: TextStyle(
                                                   color: Colors.white),
                                               prefixIcon: Icon(Icons.search,
                                                 color: Colors.white,),
                                               suffixIcon: Icon(Icons.mic,
                                                 color: Colors.white,),
                                             ),
                                           ),
                                         ),
                                       ),
                                       //SizedBox(height: 10,),
                                       const SizedBox(height: 30,),
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment
                                             .spaceAround,
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

                                                 width: 30,
                                                 child: Image.asset(
                                                     "lib/icons/img.png")),
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

                                                 width: 30,
                                                 child: Image.asset(
                                                     "lib/icons/cart.png")),
                                           ),
                                           InkWell(
                                             onTap: () {
                                               Navigator.push(
                                                 context,
                                                 MaterialPageRoute(
                                                     builder: (
                                                         context) => const Ordersummery()),
                                               );
                                             },
                                             child: Container(

                                                 width: 30,
                                                 child: Image.asset(
                                                     "lib/icons/Order.png")),
                                           ),
                                         ],
                                       ),


                                     ],
                                   ),

                                 ),
                                 Container(
                                   width: double.infinity,
                                   height: 39,
                                   decoration: const BoxDecoration(
                                     gradient: LinearGradient(
                                       colors: [
                                         Color(0xff650015),
                                         Color(0xff7E0922)
                                       ],

                                       begin: Alignment.bottomCenter,
                                       end: Alignment.topCenter,
                                     ),
                                   ),

                                 ),
                                 Consumer<MainProvider>(
                                   builder: (context,value,child) {
                                     return  Padding(
                                       padding: EdgeInsets.all(15),
                                       child: Row(
                                         //itemCount: value.allAdditem.length,

                                         mainAxisAlignment: MainAxisAlignment
                                             .spaceBetween,

                                         children: [



                                              Text("For You",
                                               style: TextStyle(fontSize: 20),),

                                           InkWell(
                                            onTap:(){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (
                                                        context) => const Ccategory()),
                                              );
                                            },
                                             child: Text("View All",
                                                 style: TextStyle(fontSize: 18)),
                                           ),
                                         ],

                                       ), //Text("For You",style: TextStyle(fontSize: 20),),
                                     );
                                   }
                                 ),
                                 SingleChildScrollView(
                                   scrollDirection: Axis.horizontal,
                                   child: Row(
                                     children: [
                                       ListView.separated(
                                        separatorBuilder: (context, index) {
                                          return SizedBox(width: 3,);
                                         // return Divider(color:Color(0xff650015),height: 3,);
                                          },
                                         itemCount: value.categorylist.length,
                                          itemBuilder: (context, index) {
                                          var items = value.categorylist[index].toString();
                                          Container(
                                                    height: 220,
                                                    width: 120,
                                                    // child: Column(
                                                    //   children: [
                                                    //   Container(
                                                    //           decoration:  BoxDecoration(
                                                    //            image: DecorationImage(
                                                    //            image: NetworkImage(value.categorylist[index].photo),
                                                    //            fit: BoxFit.fill,
                                                    //            ),
                                                    //                            // borderRadius: BorderRadius.circular(20)
                                                    //             ),
                                                    //             height: 180,
                                                    //             width: 120,
                                                    //             ),
                                                    //     const Text('',
                                                    //       style: TextStyle(fontSize: 15),),
                                                    //   ],
                                                    // ),
                                                  );
                                                 // const SizedBox(width: 8),
                                        }
                                       )
                                     ],
                                   ),
                                   // child: Row(
                                   //   children: [
                                   //     Expanded(
                                   //       child: Consumer<MainProvider>(
                                   //         builder: (context,value,child) {
                                   //           return ListView.separated(
                                   //             itemCount: value.categorylist.length,
                                   //               itemBuilder: (context, index) {
                                   //              var items = value.categorylist[index].toString();
                                   //              return Container(
                                   //                height: 220,
                                   //                  width: 120,
                                   //                  child: Column(
                                   //                    children: [
                                   //                      Container(
                                   //                        decoration:  BoxDecoration(
                                   //                          image: DecorationImage(
                                   //                            image: NetworkImage(value.categorylist[index].photo),
                                   //                            fit: BoxFit.fill,
                                   //                          ),
                                   //                          // borderRadius: BorderRadius.circular(20)
                                   //                        ),
                                   //                        height: 180,
                                   //                        width: 120,
                                   //                      ),
                                   //                      // Container(
                                   //                      //   decoration:  BoxDecoration(
                                   //                      //     image: DevaluecorationImage(
                                   //                      //         fit: BoxFit.fill,
                                   //                      //         Image.network( .allAdditem[index].photo,fit: BoxFit.fill,),
                                   //                      //        ),
                                   //                      //     // borderRadius: BorderRadius.circular(20)
                                   //                      //   ),
                                   //                      //   height: 180,
                                   //                      //   width: 120,
                                   //                      //
                                   //                      //
                                   //                      // ),
                                   //                      const Text("",
                                   //                        style: TextStyle(fontSize: 15),),
                                   //                    ],
                                   //                  ),
                                   //              );
                                   //             },
                                   //               separatorBuilder: (context, index) {
                                   //             return Divider(color:Color(0xff650015),height: 3,);
                                   //           },
                                   //
                                   //           );
                                   //         }
                                   //                                            ),
                                   //     ),
                                   //     // Container(
                                   //     //   height: 220,
                                   //     //   width: 120,
                                   //     //   child: Column(
                                   //     //     children: [
                                   //     //       Container(
                                   //     //         decoration: const BoxDecoration(
                                   //     //           image: DecorationImage(
                                   //     //               fit: BoxFit.fill,
                                   //     //               image: AssetImage(
                                   //     //                 "assets/kurta1.png",)),
                                   //     //           // borderRadius: BorderRadius.circular(20)
                                   //     //         ),
                                   //     //         height: 180,
                                   //     //         width: 120,
                                   //     //
                                   //     //
                                   //     //       ),
                                   //     //       const Text("kurtas",
                                   //     //         style: TextStyle(fontSize: 15),),
                                   //     //     ],
                                   //     //   ),
                                   //     // ),
                                   //     // const SizedBox(width: 8),
                                   //     // Container(
                                   //     //   height: 220,
                                   //     //   width: 120,
                                   //     //   child: Column(
                                   //     //     children: [
                                   //     //       Container(
                                   //     //         decoration: const BoxDecoration(
                                   //     //           image: DecorationImage(
                                   //     //               fit: BoxFit.fill,
                                   //     //               image: AssetImage(
                                   //     //                 "assets/veg.png",)),
                                   //     //           border: Border(),
                                   //     //           // borderRadius: BorderRadius.circular(20)
                                   //     //         ),
                                   //     //         height: 180,
                                   //     //         width: 120,
                                   //     //
                                   //     //
                                   //     //       ),
                                   //     //       const Text("vegitable",
                                   //     //         style: TextStyle(fontSize: 15),),
                                   //     //     ],
                                   //     //   ),
                                   //     // ),
                                   //     // const SizedBox(width: 8),
                                   //     // Container(
                                   //     //   height: 220,
                                   //     //   width: 120,
                                   //     //   child: Column(
                                   //     //     children: [
                                   //     //       Container(
                                   //     //         decoration: const BoxDecoration(
                                   //     //           image: DecorationImage(
                                   //     //               fit: BoxFit.fill,
                                   //     //               image: AssetImage(
                                   //     //                 "assets/toys.png",)),
                                   //     //           // borderRadius: BorderRadius.circular(20)
                                   //     //         ),
                                   //     //         height: 180,
                                   //     //         width: 120,
                                   //     //
                                   //     //
                                   //     //       ),
                                   //     //       const Text("Toys",
                                   //     //         style: TextStyle(fontSize: 15),),
                                   //     //     ],
                                   //     //   ),
                                   //     // ),
                                   //     // const SizedBox(width: 8),
                                   //     // Container(
                                   //     //   height: 220,
                                   //     //   width: 120,
                                   //     //   child: Column(
                                   //     //     children: [
                                   //     //       Container(
                                   //     //         decoration: const BoxDecoration(
                                   //     //           image: DecorationImage(
                                   //     //               fit: BoxFit.fill,
                                   //     //               image: AssetImage(
                                   //     //                 "assets/veg.png",)),
                                   //     //           //borderRadius: BorderRadius.circular(20)
                                   //     //         ),
                                   //     //         height: 180,
                                   //     //         width: 120,
                                   //     //
                                   //     //
                                   //     //       ),
                                   //     //       const Text("Vegitables",
                                   //     //         style: TextStyle(fontSize: 15),),
                                   //     //     ],
                                   //     //   ),
                                   //     // )
                                   //   ],
                                   // ),
                                 ),
                                 const SizedBox(height: 5,),

                                 Container(
                                   decoration: const BoxDecoration(
                                     image: DecorationImage(image: AssetImage(
                                       "assets/img_1.png",)),),
                                   width: double.infinity,
                                   height: 359,),
                                 const SizedBox(height: 5,),

                                 Container(
                                   decoration: const BoxDecoration(
                                     image: DecorationImage(image: AssetImage(
                                       "assets/img_1.png",)),),
                                   width: double.infinity,
                                   height: 359,)
                               ],
                             ),
                           );

                         }
                      ),
                    ),
                  ],
                ),





    );
  }
}
