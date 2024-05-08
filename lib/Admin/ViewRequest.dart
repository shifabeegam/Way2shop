import 'package:a/providers/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:a/Admin/AdmnHome.dart';
import 'package:a/widgets/HomeButton.dart';
import 'package:provider/provider.dart';

class ViewRequest extends StatelessWidget {
  String id,shpname,ownername,phone,email,place,licence,idproof,receipt,shopid;
  ViewRequest({required this.id,required this.shpname,required this.ownername,required this.phone,required this.email,required this.place,required this.licence,required this.idproof,required this.receipt,required this.shopid,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:Color(0xff800026),

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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img_3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [InkWell(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all( Radius.circular(15)),
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

                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [


                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Licence Id    :   ",style: TextStyle(fontSize: 18),),

                                Text(shopid,style: TextStyle(fontSize: 18),),
                              ],
                            ),
                            SizedBox(height: 7,),
                            Row(
                              children: [
                                Text("Shop Name    :   ",style: TextStyle(fontSize: 18),),

                                Text(shpname,style: TextStyle(fontSize: 18),),
                              ],
                            ),
                            SizedBox(height: 7,),
                            Row(
                              children: [
                                Text("  Owner Name    :   ",style: TextStyle(fontSize: 18),),

                                Text(ownername,style: TextStyle(fontSize: 18),),
                              ],
                            ),
                            SizedBox(height: 7,),
                            Row(
                              children: [
                                Text("Phone No    :   ",style: TextStyle(fontSize: 18),),

                                Text(phone,style: TextStyle(fontSize: 18),),
                              ],
                            ),
                            SizedBox(height: 7,),
                            Row(
                              children: [
                                Text("Email    :   ",style: TextStyle(fontSize: 18),),

                                Text(email,style: TextStyle(fontSize: 18),),
                              ],
                            ),
                            SizedBox(height: 7,),
                            Row(
                              children: [
                                Text("place    :   ",style: TextStyle(fontSize: 18),),

                                Text(place,style: TextStyle(fontSize: 18),),
                              ],
                            ),
                            SizedBox(height: 7,),

                            Row(
                              children: [
                                Text("Licence of shop    :   ",style: TextStyle(fontSize: 18),),
                                Image.network(

                                  licence,
                                  height: 40,
                                  width: 40,
                                ),


                                // Icon(),
                              ],
                            ),
                            SizedBox(height: 7,),
                            Row(
                              children: [
                                Text("Id Proof    :   ",style: TextStyle(fontSize: 18),),
                                Image.network(

                                  idproof,
                                  height: 40,
                                  width: 40,
                                ),

                                // Icon(),
                              ],
                            ),
                            SizedBox(height: 7,),
                            Row(
                              children: [
                                Text("Tax Payment Receipt    :   ",style: TextStyle(fontSize: 18),),
                                Image.network(

                                  receipt,
                                  height: 40,
                                  width: 40,
                                ),

                                SizedBox(height: 7,),
                                // Icon(),
                              ],
                            ),
                          ],
                        ),
                      ),





                    ],

                  ),
                ),
              ),
            ),
          ),SizedBox(height: 0.5,),
            SizedBox(height: 10),

            Consumer<MainProvider>(
              builder: (context,val,child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 190,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          val.statusDecln(shopid);

                        },
                        child: const Text("Reject"),
                        highlightColor: Color(0xff0C630A),
                        splashColor: Colors.grey,
                        color: Colors.red,
                      ),
                    ),


                    Container(
                      width: 190,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                       val.statusApprove(shopid);
                        },
                        child: const Text("Accept"),
                        highlightColor: Color(0xff0C630A),
                        splashColor: Colors.grey,
                        color: Colors.green,
                      ),
                    )
                  ],
                );
              }
            )



          ],
        ),
      ),
    );
  }
}
