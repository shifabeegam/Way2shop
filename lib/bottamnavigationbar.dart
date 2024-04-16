import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'Admin/AdmnHome.dart';
import 'Shopers/ShopHome.dart';
import 'customer/Caccount.dart';
import 'customer/Ccategory.dart';
import 'customer/Cshops.dart';
import 'customer/Ctrending.dart';
import 'customer/Custhome.dart';


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 2;
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final navigationanKey = GlobalKey<CurvedNavigationBarState>();

  final Screen = [
    Custhome(),
    Ccategory(),
    Cshops(),
    Caccount()

  ];

  final  items= <Widget>[
    Icon(Icons.trending_up,color: Colors.white,),
    Icon(Icons.category_outlined,color: Colors.white),
    Icon(Icons.shop_2_outlined,color: Colors.white),
    Icon(Icons.account_circle_outlined,color: Colors.white)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
        bottomNavigationBar: CurvedNavigationBar(
             items: items,
          index: index,
          height: 60.0,
          onTap: (index) => setState(() {
            this.index=index;
          }),

          color: Color(0xff650015),
          // buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),

          letIndexChange: (index) => true,
        ),
        body: Screen[index]);
  }
}