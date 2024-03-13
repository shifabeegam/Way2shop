import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class SearchItemdtl extends StatelessWidget {
  const SearchItemdtl({super.key});
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(width:double.infinity ,
              height: 80,
              decoration: BoxDecoration(color: Color(0xff10706A)),
              child: Column(
                children: [
                  Container(
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
                  //SizedBox(height: 10,),

                 /* Container(
                    decoration: BoxDecoration( image: DecorationImage(image: AssetImage("assets/img.png", )),),
                    width:30,),
        */







                ],

              ),


            ),
            SizedBox(height: 30,),
            Row(
             crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 20,),

                Container(
                  height: 210,
                  width: 200,
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: (){},
                  child: Container(

                      width:30,
                      child: Image.asset("lib/icons/img.png",color: Colors.grey,)),
                ),

              ],
            ),
            SizedBox(height: 30,),



            Column(

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:

                  Text("Shop Name", textAlign: TextAlign.left,style: TextStyle(color: Color(0xff756E6E),fontSize: 18,)
                  ),
                ),
              ],
            ),
            Text("Item details",style: TextStyle(color: Colors.black,fontSize: 15,),textAlign: TextAlign.left,),
            SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("60% off", textAlign: TextAlign.left,style: TextStyle(color: Colors.green,fontSize: 14,)
            ),

            Text("999",style: TextStyle(color: Colors.black,fontSize: 30,),textAlign: TextAlign.left,),
                SizedBox(width: 50,)

            ],),
            SizedBox(height: 20,),

             Container(
              height: 1,
              width:double.infinity,
              color:Color(0xffDBE3E3) ,
            ),
            SizedBox(height: 20,),

            Text("Variations", textAlign: TextAlign.left,style: TextStyle(color: Color(0xff756E6E),fontSize: 18,)),
            Row(
              children: [

              ],
            ),


            Container(
              height: 1,
              width:double.infinity,
              color:Color(0xffDBE3E3) ,
            ),
            SizedBox(height: 20,),

            Text("Product Details",style: TextStyle(color: Colors.black,fontSize: 20,),textAlign: TextAlign.left,),

            SizedBox(height: 20,),

            Text("ProduckasfnkasnflkasnfaNLan  lclnsadcvnl",style: TextStyle(color: Colors.black,fontSize: 15,),textAlign: TextAlign.left,),
            SizedBox(height: 20,),
            Container(
              height: 1,
              width:double.infinity,
              color:Color(0xffDBE3E3) ,
            ),

            SizedBox(height: 20,),

            Text("Shop Details",style: TextStyle(color: Colors.black,fontSize: 20,),textAlign: TextAlign.left,),

            SizedBox(height: 20,),

            Text("Produck asfnkas nflkasnfaNLan  lclnsadcvnl",style: TextStyle(color: Colors.black,fontSize: 15,),textAlign: TextAlign.left,),
            SizedBox(height: 20,),

          ],
        ),
      ),


        bottomNavigationBar:
        Row(
          children: [
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),),
              child: MaterialButton(onPressed: (){
                showDialog(context: context, builder: (context){
                return Container(
                  child: AlertDialog(
                      actions: [
                        Column(
                  children: [
                  TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),)
                  ),

                ),
                SizedBox(height: 20,),
                TextFormField(
                decoration: const InputDecoration(
                hintText: "Phone Number",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),)
                ),

                ),
                SizedBox(height: 20),
                Center(
                child: MaterialButton(onPressed: (){ Navigator.pop(context,
                /* MaterialPageRoute(
                                                    builder: (context) => const Additem()),*/);

                },
                  child: const Text("ok"),
                  highlightColor: Color(0xff0C630A),
                  splashColor: Colors.grey,
                  color: Colors.green,),
                ),
                  ],
                        ),
                      ],
                  ),
                );

              }  );
              },
                child: const Text("Place Order"),
                highlightColor: Colors.black,
                splashColor: Colors.grey,
                color: Colors.orange,
              ),
            ),
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),),
              child: MaterialButton(onPressed: (){
                showDialog(context: context, builder: (context){
                  return Container(
                    child: AlertDialog(
                      actions: [
                        Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Name",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),)
                              ),

                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Phone Number",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),)
                              ),

                            ),
                            SizedBox(height: 20),
                            Center(
                              child: MaterialButton(onPressed: (){ Navigator.pop(context,
                                /* MaterialPageRoute(
                                                    builder: (context) => const Additem()),*/);

                              },
                                child: const Text("ok"),
                                highlightColor: Color(0xff0C630A),
                                splashColor: Colors.grey,
                                color: Colors.green,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );

                }  );
              },
                child: const Text("Place Order"),
                highlightColor: Colors.black,
                splashColor: Colors.grey,
                color: Colors.orange,
              ),
            ),
          ],
        ),














    );
  }
}
