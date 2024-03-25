import 'package:a/customer/Caccount.dart';
import 'package:a/customer/Ccategory.dart';
import 'package:a/customer/Cshops.dart';
import 'package:a/widgets/GradButton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';


import 'Ctrending.dart';

class Cproduct extends StatelessWidget {
  const Cproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:Color(0xff10706A),


        title: Text("Way2Shop",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),



        ),
      ),
      body:
      SingleChildScrollView(

        child: Column(
          children: [
            Container(width:double.infinity ,
              height: 130,
              decoration: BoxDecoration(color: Color(0xff10706A)),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 50,
                      width:360 ,

                      child: TextField(decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),),
                        fillColor: Colors.white24,
                        filled: true,
                        focusedBorder: InputBorder.none,
                        hintText:"Search...",
                        hintStyle:TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.search,color: Colors.white,),
                        suffixIcon: Icon(Icons.mic,color: Colors.white,),
                      ),
                      ),
                    ),
                  ),
                  //SizedBox(height: 10,),

                  Container(
                    decoration: BoxDecoration( image: DecorationImage(image: AssetImage("assets/img.png", )),),
                    width:30,),

                ],
              ),

            ),
            Container(
              width:double.infinity ,
              height: 39,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff10706A), Color(0xff249992)],

                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),

            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CarouselSlider(
                      items: [
                        imgSlide(Pruduct_image: AssetImage("assets/image_demo.png"),img_number: "1/5",),
                        imgSlide(Pruduct_image: AssetImage("assets/img_1.png"),img_number: "2/5",),
                        imgSlide(Pruduct_image: AssetImage("assets/kurta1.png"),img_number: "3/5",),
                        imgSlide(Pruduct_image: AssetImage("assets/toys.png"),img_number: "4/5",)

                      ],
                      options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                    ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                              width: double.infinity,
                              child: Text("Kidonex",style: TextStyle(fontSize: 24,color: Colors.black54),)),
                          Text("House of Quirk Electric Baby Rocker,Bassinet on Bed , "
                              "Height Adjustable Cot Bed with Comfortable Mattress,"
                              "Portable Baby Nursey with 82 cm Sleeping Basket and 5 Swing Speeds(Grey)"),
                          Row(
                            children: [
                              Text("20%off",style: TextStyle(fontSize: 18,color: Colors.green),),
                              SizedBox(width: 10,),
                              Icon(Icons.currency_rupee,size: 30,),
                              Text("8,999",style: TextStyle(fontSize: 30),),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,size:18,color: Colors.orange,),
                              Icon(Icons.star,size:18,color: Colors.orange,),
                              Icon(Icons.star,size:18,color: Colors.orange,),
                              Icon(Icons.star_half,size:18,color: Colors.orange,),
                              Icon(Icons.star_border,size:18,color: Colors.orange,),
                              SizedBox(width: 20,),
                              Text("1,014 Ratings",style: TextStyle(fontSize: 16,color: Colors.black26),),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    width: double.infinity,
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Align(alignment: Alignment.centerLeft,child: Text("Variations",style: TextStyle(fontSize: 15,color: Colors.black38),)),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Container(
                                  height: 100,
                                  width: 80,
                                  decoration: BoxDecoration(border: Border.all(color: Colors.black38),
                                  borderRadius:  BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Image(image: AssetImage("assets/Pink_kidnox.png"),width: 70,),
                                      Text("Pink",style: TextStyle(fontSize: 18),)
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Container(
                                  height: 100,
                                  width: 80,
                                  decoration: BoxDecoration(border: Border.all(color: Colors.black38),
                                      borderRadius:  BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Image(image: AssetImage("assets/blue_kidnox.png"),width: 70,),
                                      Text("Pink",style: TextStyle(fontSize: 18),)
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Container(
                                  height: 100,
                                  width: 80,
                                  decoration: BoxDecoration(border: Border.all(color: Colors.black38),
                                      borderRadius:  BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      Image(image: AssetImage("assets/Pink_kidnox.png"),width: 70,),
                                      Text("Pink",style: TextStyle(fontSize: 18),)
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    width: double.infinity,
                    color: Colors.black12,
                    child: Column(children: [
                      Container(
                        width: double.infinity,
                          color: Colors.white
                          ,child: Text("Product Details",style: TextStyle(fontSize:25),)),
                      Container(
                        height: 130,
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("dataColour           "+" Green "),
                              Text("Brand                "+" Green "),
                              Text("Product Dimensions   "+" Green "),
                              Text("Assembly Required    "+" Green "),
                              Text("Product Care         "+" Green "),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text("\u2022  "+"Space-saving and portable: this baby swing has a very strong folding function and saves space."),
                            Text("\u2022  "+"ADJUSTABLE HEIGHT: Simply change the height of the baby bed according to your needs."),
                            Text("\u2022  "+"Music: Can Be Connected to the Mobile Phone to Play the Baby‘s Favorite Music"),
                          ],),
                        ),
                      ),
                     
                    ],),
                  ),
                  Divider(),
                  Container(
                    width: double.infinity,
                    color: Colors.black12,
                    child: Column(children: [
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Align(alignment:Alignment.centerLeft ,
                                    child: Text("Shop Details",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                Align(alignment:Alignment.centerLeft ,child: Text("kidoNex",)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Align(alignment:Alignment.centerLeft ,child: Text("Phone: "+"123456789"),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Align(alignment:Alignment.centerLeft ,child: Text("Hours: "+"Open.Closes 9 pm"),),
                                ),


                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,size: 36,color: Colors.black38,),
                                    Column(
                                      children: [
                                        Text("SH 72, Down Hill, Malappuram, Kerala 676505",style: TextStyle(fontSize: 12),),
                                        Align(alignment:Alignment.centerLeft ,
                                          child: Text("Show Map",style: TextStyle(fontSize: 12,color: Colors.black38)),),

                                      ],
                                    ),
                                  ],
                                ),


                              ],
                            ),
                          ),

                      ),


                    ],),
                  ),
                  Divider(),

                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar:BottomAppBar(

        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 45,
              width: 50,
              decoration: BoxDecoration(border: Border.all(
                  color: Colors.black26),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Icon(Icons.messenger_outline,),
            ),
            Container(
              height: 45,
              width: 120,
              decoration: BoxDecoration(border: Border.all(
                  color: Colors.black26),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text("Add To Cart",style: TextStyle(fontSize: 18),)),
            ),
            Container(
              height: 45,
              width: 140,
              decoration: BoxDecoration(border: Border.all(
                  color: Colors.black26),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow[600]
              ),
              child: Center(child: Text("Place Order",style: TextStyle(fontSize: 18),)),
            ),
          ],
        ),
      ),


      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor:Colors.white ,
      //   color: Color(0xff10706A),
      //   animationDuration: Duration(milliseconds: 300),
      //   onTap: (index){},
      //   // items: [
      //   //   Icon(Icons.trending_up,color: Colors.white,),
      //   //   Icon(Icons.category_outlined,color: Colors.white),
      //   //   Icon(Icons.shop_2_outlined,color: Colors.white),
      //   //   Icon(Icons.account_circle_outlined,color: Colors.white)
      //   //
      //   // ],
      //   items: [
      //     InkWell(onTap: (){ Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const Ctrending()),
      //     );
      //     },child: const Icon(Icons.trending_up,color: Colors.white,)),
      //     InkWell(onTap: (){Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const Ccategory()),
      //     );}, child: const Icon(Icons.category_outlined,color: Colors.white)),
      //     InkWell(onTap: (){Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const Cshops()),
      //     );}, child: const Icon(Icons.shop_2_outlined,color: Colors.white)),
      //     InkWell(onTap: (){Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const Caccount()),
      //     );}, child: const Icon(Icons.account_circle_outlined,color: Colors.white))
      //
      //
      //   ],
      //
      // ),


    );
  }
}
