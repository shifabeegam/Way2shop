import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:a/customer/Caccount.dart';
import 'package:a/customer/Ccategory.dart';
import 'package:a/customer/Cshops.dart';
import 'package:a/customer/Ctrending.dart';

class Custhome extends StatelessWidget {
  const Custhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:const Color(0xff10706A),

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
              decoration: const BoxDecoration(color: Color(0xff10706A)),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 50,
                      width:360 ,

                      child: const TextField(decoration: InputDecoration(
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
            Container(
              width:double.infinity ,
              height: 39,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff10706A), Color(0xff249992)],

                    begin: Alignment.bottomCenter, end: Alignment.topCenter,
                  ),
                ),

            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text("For You",style: TextStyle(fontSize: 20),),
                  Text("View All",style: TextStyle(fontSize: 18)),
                ],

              ),//Text("For You",style: TextStyle(fontSize: 20),),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height:220 ,
                    width: 120,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration( image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/kurta1.png", )),
                             // borderRadius: BorderRadius.circular(20)
                          ),
                          height: 180,
                          width: 120,


                        ),
                        const Text("kurtas",style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height:220 ,
                    width: 120,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration( image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/veg.png", )),
                              border: Border(),
                             // borderRadius: BorderRadius.circular(20)
                          ),
                          height: 180,
                          width: 120,


                        ),
                        const Text("vegitable",style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height:220 ,
                    width: 120,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration( image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/toys.png", )),
                             // borderRadius: BorderRadius.circular(20)
                          ),
                          height: 180,
                          width: 120,


                        ),
                        const Text("Toys",style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height:220 ,
                    width: 120,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration( image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/veg.png", )),
                              //borderRadius: BorderRadius.circular(20)
                          ),
                          height: 180,
                          width: 120,


                        ),
                        const Text("Vegitables",style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5,),

            Container(
              decoration: const BoxDecoration( image: DecorationImage(image: AssetImage("assets/img_1.png", )),),
              width:double.infinity,
            height: 359,),
            const SizedBox(height: 5,),

            Container(
              decoration: const BoxDecoration( image: DecorationImage(image: AssetImage("assets/img_1.png", )),),
              width:double.infinity,
              height: 359,)
          ],
        ),
      ),



bottomNavigationBar: CurvedNavigationBar(
  backgroundColor:Colors.white ,
  color: const Color(0xff10706A),
  animationDuration: const Duration(milliseconds: 300),
  onTap: (index){},
  items: [
  InkWell(onTap: (){ Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const Ctrending()),
    );
    },child: const Icon(Icons.trending_up,color: Colors.white,)),
  InkWell(onTap: (){Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => const Ccategory()),
  );}, child: const Icon(Icons.category_outlined,color: Colors.white)),
  InkWell(onTap: (){Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => const Cshops()),
  );}, child: const Icon(Icons.shop_2_outlined,color: Colors.white)),
  InkWell(onTap: (){Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => const Caccount()),
  );}, child: const Icon(Icons.account_circle_outlined,color: Colors.white))
  
  
],

),


    );
  }
}
