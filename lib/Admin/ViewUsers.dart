import 'package:flutter/material.dart';
import 'package:a/Admin/AdmnHome.dart';

import '../widgets/HomeButton.dart';

class ViewUsers extends StatelessWidget {
  const ViewUsers({super.key});

  @override
  Widget build(BuildContext context) {
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
    height: double.infinity,
    width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img_3.png"),
          fit: BoxFit.cover,
        ),
      ),
    child: ListView(
    children: [
      Container(
    width: double.infinity,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
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

    Padding(
    padding: const EdgeInsets.all(8),
    child: Column(
    children: [
    Text("User Name",style: TextStyle(fontSize: 16),),
    SizedBox(height: 7,),
    Text("User Phone",style: TextStyle(fontSize: 16),),
    ],
    ),
    ),



    Padding(
    padding: const EdgeInsets.all(8),
    child: HomeButton(textColor: Colors.black, backgroundColor: Colors.orangeAccent, boxshadowColor: Colors.grey, borderColor: Colors.orangeAccent, text: "Block", hight: 33, width: 126,
    fondSize: 14),
    ),

    ],

    ),
    ),
    ),SizedBox(height: 0.5,),

    ],
    ),
    ),
    );
  }
}
