import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'Admin/AdmnHome.dart';
import 'Shopers/ShopHome.dart';
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
    ShopHome(),
    AdmnHome(),
  ];

  final  items= <Widget>[
  Icon(Icons.add, size: 30),
  Icon(Icons.list, size: 30),
  Icon(Icons.compare_arrows, size: 30),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
             items: items,
          index: index,
          height: 60.0,
          onTap: (index) => setState(() {
            this.index=index;
          }),

          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),

          letIndexChange: (index) => true,
        ),
        body: Screen[index]);
  }
}