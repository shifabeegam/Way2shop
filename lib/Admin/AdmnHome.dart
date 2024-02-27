import 'package:flutter/material.dart';
import 'package:a/Admin/ViewShops.dart';
import 'package:a/Admin/ViewUsers.dart';

import '../widgets/HomeButton.dart';

class AdmnHome extends StatelessWidget {
  const AdmnHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:Color(0xff00655F),

        title: Text("Way2Shop",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),


        ),
      ),
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xFF10706A)),
        child:
        Column(
          children: [
          SizedBox(height: 24 ,),
        Container(
          width: 316,
          height: 35,
          decoration: ShapeDecoration(
            color: Color(0xFF00645E),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF10585D)),
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
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ViewShops()),
                );
              },
              child: HomeButton(textColor: Colors.white,
                backgroundColor: Color(0xff0066B65),
                boxshadowColor: Color(0x3F000000) ,
                borderColor: Color(0xff0066B65) ,
                text: "Shops",
                hight:65,
                width:230, fondSize: 20,),
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
                backgroundColor: Color(0xff0066B65),
                boxshadowColor: Color(0x3F000000) ,
                borderColor: Color(0xff0066B65) ,
                text: "Users",
                hight:65,
                width:230, fondSize: 20,),
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
                backgroundColor: Color(0xff0066B65),
                boxshadowColor: Color(0x3F000000) ,
                borderColor: Color(0xff0066B65) ,
                text: "Category",
                hight:65,
                width:230, fondSize: 20,),
            ),
        ],
        ),

      ),
    );
  }
}
