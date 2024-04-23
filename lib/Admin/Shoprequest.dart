import 'package:a/Admin/ViewRequest.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:a/Admin/AdmnHome.dart';
import 'package:a/widgets/HomeButton.dart';
import 'package:provider/provider.dart';

class Shoprequest extends StatelessWidget {
  // String name,place;
   Shoprequest({
     // required this.name,required this.place,
     super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:Color(0xff650015),

        title: Text("Shops Request",
          style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),


        ),
        leading: InkWell(onTap: (){ Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const AdmnHome()),
        );
        }, child: Icon(Icons.arrow_back_ios_new_outlined)
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(//color: Color(0xff650015),
          gradient: LinearGradient(
            colors: [ Colors.white,Color(0xff650015)],

            begin: Alignment.bottomCenter, end: Alignment.topCenter,
          ),
        ),
        child: Consumer<MainProvider>(
          builder: (context,value,child) {
            return ListView.builder(
                itemCount:value.shoplist.length ,
              itemBuilder: (context, index) {
                var items = value.shoplist[index];

                return
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  ViewRequest(id: items.licence,shpname: items.shopname,ownername: items.ownername,phone: items.phone,email: items.email ,place: items.place,licence: items.licenceproof,idproof: items.idproof,receipt: items.receipt,


                            )),
                      );
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],

                          ),
                          child:
                          Padding(

                            padding: const EdgeInsets.all(2),

                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [


                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Text(items.shopname,style: TextStyle(fontSize: 16),),
                                      SizedBox(height: 7,),
                                      Text(items.place,style: TextStyle(fontSize: 16),),
                                    ],
                                  ),
                                ),


                              ],

                            ),
                          ),
                        )


                    ),
                  );
              }
              // SizedBox(height: 0.5,);




            );
          }
        ),
      ),
    );
  }
}
