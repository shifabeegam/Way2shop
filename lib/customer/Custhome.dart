import 'package:a/customer/Ordersummery.dart';
import 'package:a/customer/Wishlist.dart';
import 'package:a/customer/cartpage.dart';
import 'package:a/customer/searched_products.dart';
import 'package:a/customer/user_registration.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:a/customer/Caccount.dart';
import 'package:a/customer/Ccategory.dart';
import 'package:a/customer/Cshops.dart';
import 'package:a/customer/Ctrending.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../Model/ItemModel.dart';
import '../providers/MainProvider.dart';
import '../providers/loginprovider.dart';
import 'Clogin.dart';
import 'Cproduct.dart';

class Custhome extends StatelessWidget {
  String userId;
  String userName;
  String userPhone;

  Custhome(
      {super.key,
      required this.userId,
      required this.userName,
      required this.userPhone});

  //get mainProvider => null;

  @override
  Widget build(BuildContext context) {
    // mainProvider.getItem();
    int myInteger;
    int scode;
    print("ffff $userName");
    print("ffff $userId");
    print("ffff $userPhone");

    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:const Color(0xff800026),
        centerTitle: false,


        title: const Text(
          "Way2Shop",
          style: TextStyle(
              color: Color(0xffFFFFFF), fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          InkWell(
            onTap: () {
              if (loginProvider.loginedUserName.isEmpty) {

                loginProvider.clearRegControlls();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserRegistration(),
                    ));
              }
              print("loggggg ${loginProvider.loginedUserName}");
            },
            child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color:Colors.white)),
                child: Icon(Icons.person_outline, color: Colors.white)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,

            child: Consumer<MainProvider>(builder: (context5, value, child) {

              return SingleChildScrollView(
                child: Column(

                  children: [

                    SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color:  Color(0xffD6D6D6), // Change this color to the desired bottom border color
                            width: 2, // Change this width to the desired bottom border width
                          ),
                        ),
                      ),

                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: 50,
                              width: 340,

                              child: TextField(
                                onSubmitted: (text) {
                                  value.getSearchProducts(text, context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchedProducts(
                                          userId: userId,
                                          userName: userName,
                                          userPhone: userPhone,
                                        ),
                                      ));
                                },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffFFD7A9), // Change this color to the desired border color
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                    ),
                                    fillColor: Colors.white60,
                                    filled: true,
                                    focusedBorder: InputBorder.none,
                                    hintText: "Search",
                                    hintStyle: TextStyle(color: Color(0xffBDBBBB)),
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color: Color(0xffBDBBBB),
                                    ),
                                  ),

                              ),
                            ),
                          ),
                          //SizedBox(height: 10,),
                          const SizedBox(
                            height: 20,
                          ),

                          Consumer<MainProvider>(
                            builder: (context, value, child) {
                              return DropdownButton<Placemodel>(
                                value: value.selectedValue,
                                onChanged: (Placemodel? newValue) {
                                  value.selectedValue =
                                      newValue; // Assign the selected Placemodel directly
                                  value.notifyListeners();
                                },
                                underline: Container(
                                  height: 0,
                                ),
                                items: value.placelist.map((Placemodel item) {
                                  return DropdownMenuItem<Placemodel>(
                                    value: item,
                                    child: SizedBox(
                                      width: 300,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color:  Colors.black,
                                            size: 18,
                                          ),
                                          // Set your icon here
                                          SizedBox(width: 12),
                                          Text(
                                            item.placename,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color:  Colors.black, // Set text color to black for list items
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                                hint: Text(
                                  '       Select Location',
                                  style: TextStyle(
                                    fontFamily: 'PoppinsRegular',
                                    fontSize: 12,
                                    color:  Color(0xff5C0013),
                                    // Set text color to white for heading
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                isExpanded: true,
                                style: TextStyle(color: Colors.white),
                                // Set text color to white for heading
                                dropdownColor: Colors.grey[200],
                                // Background color of the dropdown menu
                                selectedItemBuilder: (BuildContext context) {
                                  return value.placelist
                                      .map<Widget>((Placemodel item) {
                                    return Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Color(0xff5C0013),
                                          size: 18,
                                        ),
                                        // Set your icon here
                                        SizedBox(width: 12),
                                        Text(
                                          item.placename,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Color(0xff5C0013), // Set text color to black for list items
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    );
                                  }).toList();
                                },
                              );
                            },
                          ),

                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => const Wishlist()),
                        //     );
                        //   },
                        //   child: Container(
                        //       width: 30,
                        //         child:Icon(Icons.shopping_cart_sharp),
                        //      // child: Image.asset("lib/icons/img.png")
                        //     ),
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => const cartpage()),
                        //     );
                        //   },
                        //   child: Container(
                        //       width: 30,
                        //     child:Icon(Icons.shopping_cart_sharp),
                        //      // child: Image.asset("lib/icons/cart.png")
                        //   ),
                        // ),
                        Consumer<MainProvider>(
                          builder: (context3,value4,child) {
                            return InkWell(
                              onTap: () {
                                value4.fetchMyOrders(userId);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                       Ordersummery(

                                      )),
                                );
                              },
                              child: Container(
                                  width: 30,
                               // child:Icon(Icons),
                                 child: Image.asset("lib/icons/Order.png",color: Colors.black,)
                              ),
                            );
                          }
                        ),
                      ],
                    ),
                    Consumer<MainProvider>(builder: (context, value, child) {
                      return Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          //itemCount: value.allAdditem.length,

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              "For You",
                              style: TextStyle(fontSize: 20),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Ccategory(
                                            userId: userId,
                                            userName: userName,
                                            userPhone: userPhone,
                                          )),
                                );
                              },
                              child: Text("View All",
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ],
                        ), //Text("For You",style: TextStyle(fontSize: 20),),
                      );
                    }),
                    SizedBox(
                      width: double.infinity,
                      height: 220,
                      child: Consumer<MainProvider>(
                        builder: (context,val,_) {
                          return ListView.builder(scrollDirection:Axis.horizontal ,
                            itemCount:val.listMainImages.length ,
                              itemBuilder: (BuildContext context, int index) {
                                ItemModel item =val.listMainImages[index];
                                return   Container(

                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  print(userPhone+userName+userId+"jhjhfjhfjhgfh");
                                                    value.fetchShopDetails(item.shopId);

                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Cproduct(itemid: item.itemid,
                                                      photo: item.photo,itemname: item.itemname,price: item.price,
                                                      category: item.category,categoryid: item.categoryid,
                                                      description: item.description,itemquartity: item.itemquartity,
                                                      offers: item.offers,color: item.color,brand: item.brand,productdiemension: item.productdiemension,
                                                      assmbly: item.assmbly,instruction: item.instruction,
                                                      shopname: item.shopname,phone: value.shopPhone,
                                                      shopdetails: value.shopDetails,place: item.place, userId: userId, shopid: item.shopId, userName: userName, userPhone: userPhone,
                                                      latitude:value.latShop,
                                                      longitude: value.longShop,
                                                    ),));

                                                },
                                                child: Container(

                                                  decoration:  BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                          item.photo[0].toString(),)),
                                                    // borderRadius: BorderRadius.circular(20)
                                                  ),
                                                  height: 180,
                                                  width: 120,


                                                ),
                                              ),
                                               Text(item.itemname,
                                                style: TextStyle(fontSize: 15),),
                                            ],
                                          ),
                                        );
                              });
                        }
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                          "assets/728e9ce499f8d60c039bcad8912069c7.png",
                        ),fit:BoxFit.fill ),
                      ),
                      width: double.infinity,
                      height: 359,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                          "assets/img_1.png",
                        )),
                      ),
                      width: double.infinity,
                      height: 359,
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
