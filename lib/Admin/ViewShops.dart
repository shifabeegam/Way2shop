import 'package:flutter/material.dart';
import 'package:a/Admin/AdmnHome.dart';
import 'package:a/widgets/HomeButton.dart';

class ViewShops extends StatelessWidget {
  const ViewShops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:Color(0xff650015),

        title: Text("Shops",
          style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),


        ),
        leading: InkWell(onTap: (){ Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const AdmnHome()),
        );
        }, child: Icon(Icons.arrow_back_ios_new_outlined)
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(//color: Color(0xff650015),
          gradient: LinearGradient(
            colors: [ Colors.white,Color(0xff650015)],

            begin: Alignment.bottomCenter, end: Alignment.topCenter,
          ),
        ),
        child: ListView(
          children: [Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white70,
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

              padding: const EdgeInsets.all(10),

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
                    child: Column(
                      children: [
                        Text("Max",style: TextStyle(fontSize: 16),),
                        SizedBox(height: 7,),
                        Text("palakkad",style: TextStyle(fontSize: 16),),
                      ],
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        HomeButton(textColor: Colors.black, backgroundColor: Colors.orangeAccent, boxshadowColor: Colors.grey, borderColor: Colors.orangeAccent, text: "Status update", hight: 33, width: 126,
                            fondSize: 14),
                        SizedBox(height: 5,),
                        HomeButton(textColor: Colors.black, backgroundColor: Colors.red.shade400, boxshadowColor: Colors.grey, borderColor: Colors.red, text: "Block", hight: 33, width: 126,
                            fondSize: 14),
                      ],
                    ),
                  ),

                ],

              ),
            ),
          ),SizedBox(height: 0.5,),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white70,
                //borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
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
                      child: Column(
                        children: [
                          Text("Kasavukendra",style: TextStyle(fontSize: 16),),
                          SizedBox(height: 7,),
                          Text("manjeri",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          HomeButton(textColor: Colors.black, backgroundColor: Color(0xFFDBE3E3), boxshadowColor: Colors.grey, borderColor: Colors.orange, text: "Status update", hight: 33, width: 126,
                              fondSize: 14),
                          SizedBox(height: 5,),
                          HomeButton(textColor: Colors.black, backgroundColor: Color(0xFFDBE3E3), boxshadowColor: Colors.grey, borderColor: Colors.red, text: "Block", hight: 33, width: 126,
                              fondSize: 14),
                        ],
                      ),
                    ),

                  ],

                ),
              ),

            ),
            SizedBox(height: 0.5,),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white70,
                //borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
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
                      child: Column(
                        children: [
                          Text("Sanju fashion",style: TextStyle(fontSize: 16),),
                          SizedBox(height: 7,),
                          Text("Sreekrishnapuram",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          HomeButton(textColor: Colors.black, backgroundColor: Color(0xFFDBE3E3), boxshadowColor: Colors.grey, borderColor: Colors.orange, text: "Status update", hight: 33, width: 126,
                              fondSize: 14),
                          SizedBox(height: 5,),
                          HomeButton(textColor: Colors.black, backgroundColor: Color(0xFFDBE3E3), boxshadowColor: Colors.grey, borderColor: Colors.red, text: "Block", hight: 33, width: 126,
                              fondSize: 14),
                        ],
                      ),
                    ),

                  ],

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
