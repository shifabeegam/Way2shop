import 'package:a/Admin/AddCategory.dart';
import 'package:a/Shopers/Additem.dart';
import 'package:a/Shopers/Shopkeeperlogin.dart';
import 'package:a/Shopers/camera.dart';
import 'package:a/customer/Cproduct.dart';
import 'package:a/customer/Wishlist.dart';
import 'package:a/customer/cartpage.dart';
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
import 'package:a/customer/search.dart';
import 'package:a/Shopers/Shopkeeperlogin.dart';

import 'Admin/AdmnHome.dart';
import 'Admin/ViewShops.dart';
import 'Admin/ViewUsers.dart';
import 'Shopers/ShopHome.dart';
import 'customer/Ctrending.dart';
import 'customer/Custhome.dart';
import 'customer/SearchItemdtl.dart';
import 'customer/search.dart';
import 'Shopers/Shopkeeperlogin.dart';

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

        ],

        child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AddCategory(),
        ),
    );
  }
}

