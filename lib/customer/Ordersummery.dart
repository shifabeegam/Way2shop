import 'package:flutter/material.dart';
import '../widgets/GradButton.dart';

import '../widgets/HomeButton.dart';

class Ordersummery extends StatelessWidget {
  const Ordersummery({super.key});

  @override
  Widget build(BuildContext context) {
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
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xFF650015)),
              child:
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        // InkWell(
                        //   onTap: (){},
                        //
                        //   child: SizedBox(
                        //
                        //       width:25,
                        //       height: 20,
                        //       child: Image.asset("lib/icons/img_1.png",alignment: Alignment.bottomRight,)
                        //
                        //
                        //   ),
                        // ),

                        Center(
                          child: Text("Order Summary",style:TextStyle(

                            fontSize: 20,color: Colors.white,
                          ),),
                        )
                      ],
                    ),
                  ),

                ],

              ),

            ),
            Container(
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GradButton(width: 100,
                          hight: 130, borderColor: Colors.white, boxshadowColor: Colors.grey,backgroundColor: const Color(0xff650015),),
                        SizedBox(width: 30,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
                          children: [
                            Text(
                              "House of Quirk Electric",
                            ),
                            SizedBox(height: 5),
                            Text(
                              "grey",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                Text("20% off",style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.lightGreen,
                                ),),
                                SizedBox(width: 30,),
                                Text("₹8,999",style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.black,
                                ),),

                              ],
                            ),
                            SizedBox(height: 7,),
                            Text("Collect Item Before 24 ",style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),),
                          ],

                        ),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 80,
                      height: 35,
                      child:
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child:
                            Text("Qty :",style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),),
                          ),
                          InkWell(
                            onTap: (){},

                            child: SizedBox(

                              width:23,
                              height: 20,
                              child:  Icon(Icons.arrow_drop_down_outlined,color: Colors.black,size: 30,),
                              //child: Image.asset("lib/icons/drop1.png",alignment: Alignment.bottomRight,)


                            ),
                          ),
                        ],
                      ),

                      decoration: ShapeDecoration(

                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color:Colors.grey),
                          borderRadius: BorderRadius.circular(20),

                        ),
                      ),
                    ),
                  ],

                ),
              ),
            ),
            Text("Ordered Item will be cancelled After 24 hrs  ",style: TextStyle(
              fontSize: 16,
              color: Colors.red,
            ),),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ Row(
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
                        "Phone: 075930 30800"
                            " Hours: Open ⋅ Closes 9 pm",
                        style: TextStyle(
                          fontSize: 15,
                          //fontWeight: FontWeight.bold,
                          color: Colors.black,

                        ),

                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){},

                        child: SizedBox(

                          width:23,
                          height: 20,
                          child:  Icon(Icons.location_on_outlined,color: Colors.black26,size: 40,),

                          //child: Image.asset("lib/icons/drop1.png",alignment: Alignment.bottomRight,)


                        ),

                      ),
                      SizedBox(width: 10,),
                      Column(

                        children: [

                          Text(" SH 72, Down Hill, Malappuram, Kerala 676505",style: TextStyle(
                            fontSize: 15,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black,

                          ),),
                          Row(
                            children: [
                              Text("show map",style: TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey,

                              ),),

                            ],
                          )],

                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 10,),
            Divider(height: 1,),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        color: Colors.white,// Set your desired height here
        //color: const Color(0xff650015),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(width: double.infinity,
                height: 3,
                color: Colors.grey,),
              Row(
                children: [

                  Icon(Icons.currency_rupee,color: Colors.black,size: 22,) ,
                  Text(
                    '4600',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(width: 180,),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: MaterialButton(
                      onPressed: () {
                        // mainProvider.Shopupload();

                      },
                      child: const Text("Place Order"),
                      highlightColor: Color(0xff0C630A),
                      splashColor: Colors.grey,
                      color: Colors.green,



                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}