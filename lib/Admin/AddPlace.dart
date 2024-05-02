import 'package:flutter/material.dart';
import 'package:a/widgets/Costfield.dart';
import 'package:a/widgets/HomeButton.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:provider/provider.dart';

class AddPlace extends StatelessWidget {
  AddPlace({super.key});
  final formKey = GlobalKey<FormState>();

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
      Form(
        key: formKey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(//color: Color(0xff650015),
            gradient: LinearGradient(
              colors: [ Colors.white,Color(0xff650015)],

              begin: Alignment.bottomCenter, end: Alignment.topCenter,
            ),
          ),
          child: SingleChildScrollView(
            child:
            // SizedBox(height: 240,),
            Center(
              child:Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Container(
                      margin: EdgeInsets.only(top: 100),
                      width: 280,
                      height: 380,
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
                      Column(
                        children: [
                          SizedBox(height: 20,),
                          Text("Add Place",style: TextStyle(color: Color(0xFF650015),fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 20,),


                          SizedBox(height: 20,),
                          Container(
                            height:50,
                            width:200,
                            child: Costfield(ItemController: value.address ,width:296 , hight: 50, hintText: "Place",validator: (value) {
                              if (value!.isEmpty) {

                                return "Enter Place";
                              } else {}
                            },type: TextInputType.text,),),
                          SizedBox(height: 20,),
                          Container(decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),),
                            child: MaterialButton(onPressed: (){

                              // Navigator.pop(context);
                              //final FormState? form = formKey.currentState;
                              mainprovider.uploadPlace(context);
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

          ),



        ),
      ),

    );
  }


}