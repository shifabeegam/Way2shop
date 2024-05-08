import 'package:flutter/material.dart';
import 'package:a/Admin/AdmnHome.dart';
import 'package:a/widgets/HomeButton.dart';
import 'package:provider/provider.dart';

import '../providers/MainProvider.dart';

class ViewShops extends StatelessWidget {

   ViewShops({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:Color(0xff800026),

        title: Text("Shops Request",
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img_3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return ListView.builder(
                  itemCount:value.shoplist.length ,
                  itemBuilder: (context, index) {
                    var items = value.shoplist[index];

                    return
                      InkWell(
                        onTap: () {

                        },
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
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

                                padding: const EdgeInsets.all(2),

                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(items.shopname,style: TextStyle(fontSize: 16),),
                                          SizedBox(height: 7,),
                                          Text(items.place,style: TextStyle(fontSize: 16),),


                                              ],
                                            ),
                                      Padding(
                                        padding:  EdgeInsets.only(top: 10),
                                        child: Column(
                                            children: [
                                            HomeButton(textColor: Colors.black, backgroundColor: Color(0xFFDBE3E3), boxshadowColor: Colors.grey, borderColor: Colors.orange, text: "Status update", hight: 33, width: 126,
                                            fondSize: 14),
                                        SizedBox(height: 5,),
                                        Consumer<MainProvider>(
                                          builder: (context,value,child) {
                                            return InkWell(
                                              onTap: () {
                                                value.statusblocked(items.id);

                                              },
                                              child: HomeButton(textColor: Colors.black, backgroundColor: Color(0xFFDBE3E3), boxshadowColor: Colors.grey, borderColor: Colors.red, text: "Block", hight: 33, width: 126,
                                                  fondSize: 14),
                                            );
                                          }
                                        ),

                                        ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )


                        ),
                      );
                  }
                // SizedBox(height: 0.5,);




              );
            }
        ),
      ),
    );

  }
}
