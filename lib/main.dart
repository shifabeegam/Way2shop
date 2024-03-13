import 'package:a/Shopers/Additem.dart';
import 'package:a/customer/Wishlist.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:a/Shopers/Additem.dart';
import 'package:a/Shopers/Stockdt.dart';
import 'package:a/customer/Caccount.dart';
import 'package:a/customer/Ccategory.dart';
import 'package:a/customer/Clogin.dart';
import 'package:a/customer/Cshops.dart';
import 'package:provider/provider.dart';


import 'Admin/AdmnHome.dart';
import 'Admin/ViewShops.dart';
import 'Admin/ViewUsers.dart';
import 'Shopers/ShopHome.dart';
import 'customer/Ctrending.dart';
import 'customer/Custhome.dart';
import 'customer/SearchItemdtl.dart';

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
    return MultiProvider(providers:[
      ChangeNotifierProvider(create: (context) => MainProvider())
    ])
    child: MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
      home: Cshops(),
    );
  }
}

