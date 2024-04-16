

import 'dart:async';

import 'package:a/customer/Custhome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    print("codee id her");

    Timer? _timer;
    final FirebaseFirestore db = FirebaseFirestore.instance;
    String type= '';

    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;

    super.initState();

    // LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);
    // MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);


    // mainProvider.lockApp();
  //  mainProvider.getCarouselimg();


    Timer(const Duration(seconds: 5), () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => Custhome(),));

      // if (loginUser == null) {
      //   callNextReplacement(context, Custhome());
      // }
      // else {
      //   loginProvider.userAuthorized(loginUser.phoneNumber, context);
      // }
    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 380,),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  left: BorderSide(color:Color(0xff650015)),
                  top: BorderSide(color:Color(0xff650015)),
                  right: BorderSide(color:Color(0xff650015)),
                  bottom: BorderSide(width: 1.20, color: Color(0xff650015)),
                ),
                boxShadow: [
                  BoxShadow(

                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],),

              child: Image(image: AssetImage(
                "assets/new_app_icon.png",)),
            ),
            SizedBox(height: 300,),
            Text("Way2Shop",
              style: TextStyle(color: Color(0xff650015),fontSize: 20,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
