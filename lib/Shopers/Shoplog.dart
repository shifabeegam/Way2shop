import 'package:flutter/material.dart';
import 'package:a/widgets/Costfield.dart';
import 'package:a/widgets/HomeButton.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:provider/provider.dart';



class Shopkeeperlogin extends StatelessWidget {
  const Shopkeeperlogin({super.key});



  @override
  Widget build(BuildContext context) {
    MainProvider mainprovider = Provider.of(context,listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( backgroundColor:Color(0xFF650015),
        /*leading:InkWell(
        onTap: (){},

        child: Container(

            width:15,
            child: Image.asset("lib/icons/img_1.png")),

      ),*/
      ),
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(//color: Color(0xff650015),
          gradient: LinearGradient(
            colors: [ Colors.white,Color(0xff650015)],

            begin: Alignment.bottomCenter, end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [


              SizedBox(height: 50,),
              Center(



                child: Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return Column(
                          children: [
                            SizedBox(height: 2,),

                            Costfield(ItemController: value.licenceid,width: 296, hight: 50, hintText: "Licence Id"),
                            SizedBox(height: 10,),
                            Costfield(ItemController: value.shopname,width:296 , hight: 50, hintText: "Shop Name"),
                            SizedBox(height: 10,),

                            Costfield(ItemController: value.owname,width: 296, hight: 50, hintText: "Owner Name"),
                            SizedBox(height: 10,),
                            Costfield(ItemController: value.phnu,width:296 , hight: 50, hintText: "Phone No:"),
                            SizedBox(height: 10,),

                            Costfield(ItemController: value.email,width:296 , hight: 50, hintText: "Email"),
                            SizedBox(height: 10,),

                            Costfield(ItemController: value.address,width:296 , hight: 50, hintText: "Address"),
                            SizedBox(height: 10,),

                            Costfield(ItemController: value.shopdetails,width:296 , hight: 50, hintText: "Shop Details"),
                            SizedBox(height: 10,),
                            Container(
                              width: 296,
                              height:50,
                              decoration: BoxDecoration(border: Border.all(width: 1,color: Color(0xff650015)),borderRadius: BorderRadius.circular(15),



                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Container(

                                  child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 57,),

                                      Text("Upload Id Proof",style: TextStyle(color: Colors.white30,fontSize: 15,),),
                                      SizedBox(width: 80,),
                                      //Costfield(ItemController: value.quantity,width:250, hight: 50, hintText: "Tax Payment Receipt"),
                                      InkWell(onTap: (){}, child: Icon(Icons.upload_sharp,color: Colors.white30,size: 40,)),
                                    ],
                                  ),
                                ),
                              ),
                            ),


                            SizedBox(height: 10,),

                            Container(
                              width: 296,
                              height:50,
                              decoration: BoxDecoration(border: Border.all(width: 1,color: Color(0xff650015)),borderRadius: BorderRadius.circular(15),



                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Container(

                                  child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 57,),

                                      Text("Licence of Shop",style: TextStyle(color: Colors.white30,fontSize: 15,),),
                                      SizedBox(width: 80,),
                                      //Costfield(ItemController: value.quantity,width:250, hight: 50, hintText: "Tax Payment Receipt"),
                                      InkWell(onTap: (){}, child: Icon(Icons.upload_sharp,color: Colors.white30,size: 40,)),
                                    ],
                                  ),
                                ),
                              ),
                            ),


                            SizedBox(height: 10,),

                            Container(
                              width: 296,
                              height:50,
                              decoration: BoxDecoration(border: Border.all(width: 1,color: Color(0xff650015)),borderRadius: BorderRadius.circular(15),



                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Container(

                                  child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 57,),

                                      Text("Tax Payment Receipt",style: TextStyle(color: Colors.white30,fontSize: 15,),),
                                      SizedBox(width: 50,),
                                      //Costfield(ItemController: value.quantity,width:250, hight: 50, hintText: "Tax Payment Receipt"),
                                      InkWell(onTap: (){}, child: Icon(Icons.upload_sharp,color: Colors.white30,size: 40,)),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 10,),











                            SizedBox(height: 30,),
                            Container(decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),),
                              child: MaterialButton(onPressed: (){
                                mainprovider.Shopupload();
                              },
                                child: const Text("Submit"),
                                highlightColor: Color(0xff0C630A),
                                splashColor: Colors.grey,
                                color: Colors.green,
                              ),
                            )

                          ]

                      );
                    }
                ),

              ),
            ],
          ),
        ),



      ),

    );
  }

  void setState(Null Function() param0) {}


}
