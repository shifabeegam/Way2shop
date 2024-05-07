import 'package:a/Admin/AddCategory.dart';
import 'package:a/Admin/Shoprequest.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:a/Admin/ViewShops.dart';
import 'package:a/Admin/ViewUsers.dart';
import 'package:provider/provider.dart';

import '../customer/Clogin.dart';
import '../widgets/HomeButton.dart';
import 'categoryslist.dart';

class AdmnHome extends StatelessWidget {
  const AdmnHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:Color(0xff650015),

        title: Text("Way2Shop",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
        ),
          actions:[
            InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.white,
                      elevation: 20,
                      content:  Text(
                          "Do you want to Logout ?",style: TextStyle(
                          fontSize:17,

                          fontFamily:'ink nut',
                          fontWeight: FontWeight.w700,
                          color: Colors.red)),
                      actions: <Widget>[
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                FirebaseAuth auth = FirebaseAuth.instance;
                                auth.signOut();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Clogin(),
                                    ));
                              },
                              child: Container(
                                height: 45,
                                width: 90,
                                decoration: BoxDecoration(
                                    color:Colors.white ,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x26000000),
                                        blurRadius: 2.0, // soften the shadow
                                        spreadRadius: 1.0, //extend the shadow
                                      ),
                                    ] ),
                                child: Center(child:  Text("yes",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                              ),
                            ),
                            TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 45,
                                  width: 90,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.red,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x26000000),
                                        blurRadius: 2.0, // soften the shadow
                                        spreadRadius: 1.0, //extend the shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                                ))
                          ],
                        )

                      ],
                    ),
                  );
                },
                child: Icon(Icons.logout_outlined,color: Colors.white,size:30,)),SizedBox(width: 15,)]
      ),
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(//color: Color(0xff650015),
        gradient: LinearGradient(
          colors: [Color(0xff996082),Color(0xff6FFA0D9)],

          begin: Alignment.bottomCenter, end: Alignment.topCenter,
        ),
      ),

        child:
        Column(
          children: [
          SizedBox(height: 24 ,),
        Container(
          width: 316,
          height: 35,
          decoration: ShapeDecoration(
            color: Colors.white10,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xff650015)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Center(
            child: Text('Admin',
              style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
            SizedBox(height: 70,),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(
                  onTap: (){
                    value.getshopPending();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  Shoprequest()),
                    );
                  },
                  child: HomeButton(textColor: Colors.white,
                    backgroundColor: Colors.white10,
                    boxshadowColor: Color(0x3F000000) ,
                    borderColor: Colors.white10 ,
                    text: "Shop Requests",
                    hight:65,
                    width:230, fondSize: 20,),
                );
              }
            ),
            SizedBox(height: 30 ,),
            Consumer<MainProvider>(
              builder: (context,val,child) {
                return InkWell(
                  onTap: (){
                    val.getshopAccept();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  ViewShops()),
                    );
                  },
                  child: HomeButton(textColor: Colors.white,
                    backgroundColor: Colors.white10,
                    boxshadowColor: Color(0x3F000000) ,
                    borderColor: Colors.white10 ,
                    text: "Shops",
                    hight:65,
                    width:230, fondSize: 20,),
                );
              }
            ),
            SizedBox(height: 30 ,),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ViewUsers()),
                );
              },
              child: HomeButton(textColor: Colors.white,
                backgroundColor:  Colors.white10,
                boxshadowColor: Color(0x3F000000) ,
                borderColor:  Colors.white10 ,
                text: "Users",
                hight:65,
                width:230, fondSize: 20,),
            ),
            SizedBox(height: 30 ,),
            Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(
                  onTap: (){
                    value.getcategoy();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryList()),
                    );
                  },

                  child: HomeButton(textColor: Colors.white,
                    backgroundColor:  Colors.white10,
                    boxshadowColor: Color(0x3F000000) ,
                    borderColor:  Colors.white10 ,
                    text: "Category",
                    hight:65,
                    width:230, fondSize: 20,),
                );
              }
            ),
        ],
        ),

      ),
    );
  }
}
