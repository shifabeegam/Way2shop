import 'package:flutter/material.dart';
import 'package:a/widgets/Costfield.dart';
import 'package:a/widgets/HomeButton.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:provider/provider.dart';

class Additem extends StatelessWidget {
  const Additem({super.key});

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
                  child:Container(
                width: 296,
                height: 584,
                decoration: ShapeDecoration(
                  color: Colors.black45,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(9, 8),
                      spreadRadius: 0,
                    )
                  ],
                ),
                    child: Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return Column(
                          children: [
                            SizedBox(height: 20,),
                            Container(
                            width: 100,
                            height: 100,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: OvalBorder(
                                side: BorderSide(width: 1, color: Color(0xFF650015)),
                              ),
                            ),
                              child: InkWell(onTap: (){}, child: Icon(Icons.add_a_photo_outlined,color: Colors.grey,size: 40,)),
                          ),
                            SizedBox(height: 20,),
                            Costfield(ItemController: value.itemNm,width: 296, hight: 50, hintText: "Item Name"),
                            Costfield(ItemController: value.itemCd,width:296 , hight: 50, hintText: "Item Code"),
                            Costfield(ItemController: value.price,width:296 , hight: 50, hintText: "Price"),
                            Costfield(ItemController: value.quantity,width:296 , hight: 50, hintText: "Item Quantity"),

                            Costfield(ItemController: value.category,width:296 , hight: 50, hintText: "Category"),

          
          
          
          
          
                            SizedBox(height: 30,),
                            Container(decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),),
                              child: MaterialButton(onPressed: (){
                                mainprovider.upload();
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
              ),
            ],
          ),
        ),



      ),

    );
  }
}
