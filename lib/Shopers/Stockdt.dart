import 'package:flutter/material.dart';
import 'package:a/Shopers/Additem.dart';
import 'package:a/Shopers/ShopHome.dart';
import 'package:a/widgets/Lists.dart';

import '../widgets/HomeButton.dart';

class Stockdt extends StatelessWidget {
  const Stockdt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:Color(0xFF10706A),

        title: Text("Stock Details",
          style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),


        ),
       /* leading: InkWell(onTap: (){ Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ShopHome()),
        );
        }, child: Image.asset("lib/icons/img_1.png")
    ),*/
      ),

//SizedBox(height: 20,),
      body: Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xFF10706A),

      child:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
            width: double.infinity,
            height: 115,
            decoration: BoxDecoration(
              color: Color(0xFFDBE3E3),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],

            ),
            child:
            Padding(

              padding: const EdgeInsets.all(7),

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 80,
                    height: 76,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFF10706A)),
                      ),
                    ),
                    child: Icon(Icons.image_outlined,color: Colors.grey,size: 30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("Item Name",style: TextStyle(fontSize: 16),),
                  ),



                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                       Text("203",style: TextStyle(fontSize: 30)),
                        SizedBox(height: 5,),
                        InkWell(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return Container(
                                child: AlertDialog(

                                  actions: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                                            children: [

                                              InkWell(
                                                  child: HomeButton(
                                                      textColor: Color(0xFA005A54),
                                                      backgroundColor: Color(0xFFDBE3E3),
                                                      boxshadowColor: Colors.grey,
                                                      borderColor: Color(0xFFDBE3E3), text: "-",
                                                      hight: 37, width:62 , fondSize: 30)),
                                              Text("203",style: TextStyle(fontSize: 40),),
                                              InkWell(
                                                  child: HomeButton(
                                                      textColor: Color(0xFA005A54),
                                                      backgroundColor: Color(0xFFDBE3E3),
                                                      boxshadowColor: Colors.grey,
                                                      borderColor: Color(0xFFDBE3E3),
                                                      text: "+", hight: 37, width:62 , fondSize: 30)),

                                            ],
                                          ),
                                        ),
                                        Center(
                                          child: MaterialButton(onPressed: (){ Navigator.pop(
                                            context,
                                           /* MaterialPageRoute(
                                                builder: (context) => const Additem()),*/
                                          );

                                          },
                                            child: const Text("ok"),
                                            highlightColor: Color(0xff0C630A),
                                            splashColor: Colors.grey,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],

                                ),
                              );
                            });
                          },
                          child: HomeButton(textColor: Colors.black, backgroundColor: Colors.orange, boxshadowColor: Colors.grey, borderColor: Colors.orange, text: "Update", hight: 33, width: 126,
                              fondSize: 14),
                        ),
                      ],
                    ),
                  ),

                ],

              ),
            ),
              ),SizedBox(height: 0.5,),
            Container(
              width: double.infinity,
              height: 115,
              decoration: BoxDecoration(
                color: Color(0xFFDBE3E3),
               // borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],

              ),
              child:
              Padding(

                padding: const EdgeInsets.all(7),

                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 80,
                      height: 76,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(
                          side: BorderSide(width: 1, color: Color(0xFF10706A)),
                        ),
                      ),
                      child: Icon(Icons.image_outlined,color: Colors.grey,size: 30,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Item Name",style: TextStyle(fontSize: 16),),
                    ),



                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text("203",style: TextStyle(fontSize: 30)),
                          SizedBox(height: 5,),
                          InkWell(
                            onTap: (){
                              showDialog(context: context, builder: (context){
                                return Container(
                                  child: AlertDialog(

                                    actions: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                                              children: [

                                                InkWell(child: HomeButton(textColor: Color(0xFA005A54), backgroundColor: Color(0xFFDBE3E3), boxshadowColor: Colors.grey, borderColor: Color(0xFFDBE3E3), text: "-", hight: 37, width:62 , fondSize: 30)),
                                                Text("203",style: TextStyle(fontSize: 40),),
                                                InkWell(child: HomeButton(textColor: Color(0xFA005A54), backgroundColor: Color(0xFFDBE3E3), boxshadowColor: Colors.grey, borderColor: Color(0xFFDBE3E3), text: "+", hight: 37, width:62 , fondSize: 30)),

                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: MaterialButton(onPressed: (){ Navigator.pop(
                                              context,
                                              /* MaterialPageRoute(
                                                builder: (context) => const Additem()),*/
                                            );

                                            },
                                              child: const Text("ok"),
                                              highlightColor: Color(0xff0C630A),
                                              splashColor: Colors.grey,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],

                                  ),
                                );
                              });
                            },
                            child: HomeButton(textColor: Colors.black, backgroundColor: Colors.orange, boxshadowColor: Colors.grey, borderColor: Colors.orange, text: "Update", hight: 33, width: 126,
                                fondSize: 14),
                          ),
                        ],
                      ),
                    ),

                  ],

                ),
              ),
            ),SizedBox(height: 0.5,),
            SizedBox(height: 0.5,),
            Container(
              width: double.infinity,
              height: 115,
              decoration: BoxDecoration(
                color: Color(0xFFDBE3E3),
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],

              ),
              child:
              Padding(

                padding: const EdgeInsets.all(7),

                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 80,
                      height: 76,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(
                          side: BorderSide(width: 1, color: Color(0xFF10706A)),
                        ),
                      ),
                      child: Icon(Icons.image_outlined,color: Colors.grey,size: 30,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Item Name",style: TextStyle(fontSize: 16),),
                    ),



                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text("203",style: TextStyle(fontSize: 30)),
                          SizedBox(height: 5,),
                          InkWell(
                            onTap: (){
                              showDialog(context: context, builder: (context){
                                return Container(
                                  child: AlertDialog(

                                    actions: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                                              children: [

                                                InkWell(child: HomeButton(textColor: Color(0xFA005A54), backgroundColor: Color(0xFFDBE3E3), boxshadowColor: Colors.grey, borderColor: Color(0xFFDBE3E3), text: "-", hight: 37, width:62 , fondSize: 30)),
                                                Text("203",style: TextStyle(fontSize: 40),),
                                                InkWell(child: HomeButton(textColor: Color(0xFA005A54), backgroundColor: Color(0xFFDBE3E3), boxshadowColor: Colors.grey, borderColor: Color(0xFFDBE3E3), text: "+", hight: 37, width:62 , fondSize: 30)),

                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: MaterialButton(onPressed: (){ Navigator.pop(
                                              context,
                                              /* MaterialPageRoute(
                                                builder: (context) => const Additem()),*/
                                            );

                                            },
                                              child: const Text("ok"),
                                              highlightColor: Color(0xff0C630A),
                                              splashColor: Colors.grey,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],

                                  ),
                                );
                              });
                            },
                            child: HomeButton(textColor: Colors.black, backgroundColor: Colors.orange, boxshadowColor: Colors.grey, borderColor: Colors.orange, text: "Update", hight: 33, width: 126,
                                fondSize: 14),
                          ),
                        ],
                      ),
                    ),

                  ],

                ),
              ),
            ),SizedBox(height: 0.5,),

          ],
        ),
      ),
    ),

bottomNavigationBar:
    Container(
      height: 50,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),),
      child: MaterialButton(onPressed: (){ Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const Additem()),
      );

      },
        child: const Text("Add New"),
        highlightColor: Color(0xff0C630A),
        splashColor: Colors.grey,
        color: Colors.green,
      ),
    )

    );
  }
}
