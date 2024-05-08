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

  String userId;
  String userName;
  String userPhone;
  BottomNavBar({Key?key,required this.userId,required this.userName,
    required this.userPhone}):super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final navigationanKey = GlobalKey<CurvedNavigationBarState>();



  final  items= <Widget>[
    Icon(Icons.trending_up,color: Color(0xffE46767),),
    Icon(Icons.category_outlined,color:Color(0xffE46767)),
    Icon(Icons.shop_2_outlined,color:Color(0xffE46767)),
    Icon(Icons.add_home_work_outlined,color:Color(0xffE46767))
  ];

  @override
  void initState() {
    // TODO: implement initState
    // MainProvider provider = Provider.of<MainProvider>(context,listen: true);
    // provider.handleLocationPermission(context);
    // provider.getCurrentLocation(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Screen = [

      Custhome(userId: widget.userId, userName: widget.userName, userPhone: widget.userPhone),
      Ccategory(userId: widget.userId, userName: widget.userName, userPhone: widget.userPhone,),
      Cshops(userId: widget.userId, userName: widget.userName, userPhone: widget.userPhone,),
      Caccount()

    ];
    MainProvider provider = Provider.of<MainProvider>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.trending_up, color: Color(0xff5C0013)),
          Icon(Icons.category_outlined, color:Color(0xff5C0013)),
          Icon(Icons.shop_2_outlined, color: Color(0xff5C0013)),
          Icon(Icons.add_home_work_outlined, color: Color(0xff5C0013))
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
              // provider.getPlace();
            // Call a function for index 3
            // Function4();
              break;
            default:
              break;
          }
        },

        color: Color(0xffD6D6D6),
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