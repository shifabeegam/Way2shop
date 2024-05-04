import 'package:a/Shopers/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:a/Shopers/Additem.dart';
import 'package:a/Shopers/ShopHome.dart';
import 'package:a/widgets/Lists.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/MainProvider.dart';
import '../widgets/HomeButton.dart';

class Stockdt extends StatelessWidget {
  String shopid;
  String shopName;
  String shopPlace;
   Stockdt({super.key,required this.shopid,required this.shopName,required this.shopPlace});



  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider =   Provider.of<MainProvider>(context, listen: false);

    // String myString = mainProvider.quantity as String;
     //int myInteger = int.parse(mainProvider.q);
   /* void incrementInteger() {
      setState(() {
        myInteger++; // Incrementing the integer value
      });
    }
*/

    // mainProvider.getItem();
    int myInteger ;
    int scode;




    return Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:Color(0xff650015),

        title: Text("Stock Details",
          style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),


        ),
       /* leading: InkWell(onTap: (){ Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ShopHome()),
        );
        }, child: Image.asset("lib/icons/img_1.png")
    ),*/
      ),

//SizedBox(height: 20,),
      body: Column(

          children: [
            Expanded(
              flex: 4,
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return ListView.separated(
                    itemCount: value.allAdditem.length,

                      itemBuilder: (context, index) {
                      var items = value.allAdditem[index].toString();
                      //print(value.allAdditem[index].name);
                      // print(value.allAdditem[index].quantity);
                      // print(value.allAdditem[index].code);
                        return Container(
                          width: double.infinity,
                          height: 115,
                          decoration: BoxDecoration(
                            color: Color(0xffDED6D7),

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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 80,
                                height: 76,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: OvalBorder(
                                    side: BorderSide(width: 1, color: Color(0xff650015)),
                                  ),
                                ),
                                 child:Image.network( value.allAdditem[index].photo.first,fit: BoxFit.fill,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                     Text( value.allAdditem[index].itemname,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    Text( value.allAdditem[index].itemid,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                               ),


                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Text(value.allAdditem[index].itemquartity.toString(),style: TextStyle(fontSize: 24)),
                                    SizedBox(height: 5,),
                                    InkWell(
                                      onTap: (){
                                        showDialog(context: context, builder: (context){
                                          return Container(
                                            child: AlertDialog(backgroundColor: Colors.white,
                                              elevation: 0,

                                              actions: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(15),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                                                        children: [


                                                          Consumer<MainProvider>(
                                                            builder: (context,value,child) {
                                                              return InkWell(onTap: () {
                                                                print("tap------------------");
                                                                 // myInteger = int.parse(value.allAdditem[index].quantity);
                                                                 // print(myInteger);
                                                                 // value.Upquantity.text = myInteger.toString();
                                                                 // scode = int.parse(value.allAdditem[index].code);
                                                                 // print(scode);
                                                                 // value.incrementInteger();



                                                              },


                                                                child: HomeButton(
                                                                    textColor: Color(0xFA005A54),
                                                                    backgroundColor: Color(0xFFDBE3E3),
                                                                    boxshadowColor: Colors.grey,
                                                                    borderColor: Color(0xFFDBE3E3), text: "-",
                                                                    hight: 37, width:62 , fondSize: 30),
                                                              );
                                                            }
                                                          ),
                                                          // Text(value.allAdditem[index].quantity.toString(),style: TextStyle(fontSize: 40)),
                                                          InkWell(
                                                              child: HomeButton(
                                                                  textColor: Color(0xFA005A54),
                                                                  backgroundColor: Color(0xFFDBE3E3),
                                                                  boxshadowColor: Colors.grey,
                                                                  borderColor: Color(0xFFDBE3E3),
                                                                  text: "+", hight: 37, width:62 , fondSize: 30)),

                                                        ],
                                                      ),
                                                    ),
                                                    Center(
                                                      child: MaterialButton(onPressed: (){ Navigator.pop(
                                                        context,
                                                        /* MaterialPageRoute(
                                                        builder: (context) => const Additem()),*/
                                                      );

                                                      },
                                                        child: const Text("ok"),
                                                        highlightColor: Color(0xff0C630A),
                                                        splashColor: Colors.grey,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              ],

                                            ),
                                          );
                                        });
                                      },
                                      child: HomeButton(textColor: Colors.black, backgroundColor: Colors.orangeAccent, boxshadowColor: Colors.grey, borderColor: Colors.orangeAccent, text: "Update", hight: 33, width: 126,
                                          fondSize: 14),
                                    ),
                                  ],
                                ),
                              ),

                            ],

                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(color:Color(0xff650015),height: 3,);
                      },
                  );
                }
              ),
            )

          ],
        ),



bottomNavigationBar:
    Container(
      height: 50,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),),
      child: MaterialButton(onPressed: (){
        mainProvider.clearitem();
        mainProvider.getcategoy();
        mainProvider.getshop();
        print("fun.............................................");
        Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>  camera(shopid: shopid,shopName: shopName, shopPlace: shopPlace,)),
      );

      },
        child: const Text("Add New"),
        highlightColor: Color(0xff0C630A),
        splashColor: Colors.grey,
        color: Colors.green,
      ),
    )

    );
  }
}
