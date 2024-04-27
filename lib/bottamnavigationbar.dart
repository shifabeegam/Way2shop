import 'package:a/providers/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';

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
  int index = 0;
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
    Icon(Icons.add_home_work_outlined,color: Colors.white)
  ];

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.trending_up, color: Colors.white),
          Icon(Icons.category_outlined, color: Colors.white),
          Icon(Icons.shop_2_outlined, color: Colors.white),
          Icon(Icons.add_home_work_outlined, color: Colors.white)
        ],
        index: index,
        height: 60.0,
        onTap: (newIndex) {
          setState(() {
            index = newIndex; // Update the index when tapped
          });
          // Call a function based on the selected index
          switch (index) {
            case 0:
            // Call a function for index 0
            // Function1();
              break;
            case 1:
            // Call a function for index 1
              provider.getcategoy();



              break;
            case 2:
            // Call a function for index 2
              provider.getshop();
              break;
            case 3:
            // Call a function for index 3
            // Function4();
              break;
            default:
              break;
          }
        },
        color: Color(0xff650015),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        letIndexChange: (index) => true,
      ),
      body: Screen[index],
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.transparent,
  //       bottomNavigationBar: CurvedNavigationBar(
  //            items: items,
  //         index: index,
  //         height: 60.0,
  //
  //         onTap: (index) => setState(() {
  //           this.index=index;
  //         }),
  //
  //         color: Color(0xff650015),
  //         // buttonBackgroundColor: Colors.white,
  //         backgroundColor: Colors.white,
  //         animationCurve: Curves.easeInOut,
  //         animationDuration: Duration(milliseconds: 600),
  //
  //         letIndexChange: (index) => true,
  //       ),
  //       body: Screen[index]);
  // }
}