import 'package:a/Admin/AddCategory.dart';
import 'package:a/Shopers/Additem.dart';
import 'package:a/Shopers/Shopkeeperlogin.dart';
import 'package:a/Shopers/camera.dart';
import 'package:a/customer/Cproduct.dart';
import 'package:a/customer/Wishlist.dart';
import 'package:a/customer/cartpage.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:a/providers/loginprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:a/Shopers/Additem.dart';
import 'package:a/Shopers/Stockdt.dart';
import 'package:a/customer/Caccount.dart';
import 'package:a/customer/Ccategory.dart';
import 'package:a/customer/Clogin.dart';
import 'package:a/customer/Cshops.dart';
import 'package:provider/provider.dart';
import 'package:a/customer/search.dart';

import 'SplashScreen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

     return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>MainProvider(),),
          ChangeNotifierProvider(create: (context)=>LoginProvider(),),

        ],

        child:  MaterialApp(debugShowCheckedModeBanner: false,

          title: 'NewWay2shop',
          theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      // home: Shopkeeperlogin(),
        ),
    );
  }
}

