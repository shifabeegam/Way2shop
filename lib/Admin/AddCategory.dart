import 'package:flutter/material.dart';
import 'package:a/widgets/Costfield.dart';
import 'package:a/widgets/HomeButton.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:provider/provider.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

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


                SizedBox(height: 240,),
                Center(
                  child:Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return Container(
                        width: 250,
                        height: 230,
                        decoration: ShapeDecoration(
                          color: Colors.white10,
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
                        child:
                        Column(
                          children: [
                            SizedBox(height: 20,),
                            Text("Add Category",style: TextStyle(color: Colors.black45,fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(height: 20,),
                            Container(
                                height:50,
                                width:200,
                                child: Costfield(ItemController: value.addcategory ,width:296 , hight: 50, hintText: "Category")),
                            SizedBox(height: 20,),
                            Container(decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),),
                              child: MaterialButton(onPressed: (){
                                mainprovider.uploadcatergory();
                              },
                                child: const Text("Submit"),
                                highlightColor: Color(0xff0C630A),
                                splashColor: Colors.grey,
                                color: Colors.green,
                              ),
                            )
                          ],
                        ),
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
}