import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:a/Admin/AdmnHome.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/MainProvider.dart';
import '../widgets/HomeButton.dart';

class ViewUsers extends StatelessWidget {
  const ViewUsers({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

    backgroundColor: Colors.white,
    appBar: AppBar(centerTitle: false,
    backgroundColor:Color(0xff800026),

    title: Text("Users",
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
    height: height,
    width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img_3.png"),
          fit: BoxFit.cover,
        ),
      ),
    child: Column(
      children: [
        SizedBox(
          height: height-100,
          width: width,
          child: Consumer<MainProvider>(
              builder: (context3,value4,child) {
                return ListView.builder(
                    itemCount:value4.adminUsersList.length ,
                    itemBuilder: (context, index) {
                      var items = value4.adminUsersList[index];

                      return
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: width/1.2,
                          // height: 100,
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
                          child:
                          Padding(

                            padding: const EdgeInsets.all(10),

                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Text(items.userName,style: TextStyle(fontSize: 16),),
                                      SizedBox(height: 7,),
                                      Text(items.phoneNumber,style: TextStyle(fontSize: 16),),
                                      SizedBox(height: 7,),
                                      Text(items.status,style: TextStyle(fontSize: 16,color: items.status=="ACTIVE"
                                          ?Colors.green:Colors.red,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),



                                items.status=="ACTIVE"
                                ?InkWell(
                                  onTap: (){
                                    value4.blockUser(items.id, "BLOCKED");
                                  },
                                  child: HomeButton(textColor: Colors.black, backgroundColor: Colors.orangeAccent, boxshadowColor: Colors.grey, borderColor: Colors.orangeAccent, text: "Block", hight: 33, width: 126,
                                      fondSize: 14),
                                ):InkWell(
                                  onTap: (){
                                    value4.blockUser(items.id, "ACTIVE");
                                  },
                                  child: HomeButton(textColor: Colors.black, backgroundColor: Colors.orangeAccent, boxshadowColor: Colors.grey, borderColor: Colors.orangeAccent, text: "Activate", hight: 33, width: 126,
                                      fondSize: 14),
                                ),

                              ],

                            ),
                          ),
                        );
                    }
                  // SizedBox(height: 0.5,);




                );
              }
          ),
        ),

      ],
    ),
    ),
    );
  }
}
