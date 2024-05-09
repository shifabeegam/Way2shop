import 'package:flutter/material.dart';
import 'package:a/widgets/Costfield.dart';
import 'package:a/widgets/HomeButton.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:provider/provider.dart';

class AddCategory extends StatelessWidget {
   AddCategory({super.key});
   final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MainProvider mainprovider = Provider.of(context,listen: false);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar( backgroundColor:Color(0xff800026),
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img_3.png"),
                fit: BoxFit.cover,
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
                              Text("Add Category",style: TextStyle(color: Color(0xFF650015),fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 20,),

                              Consumer<MainProvider>(
                                builder: (context,value,child) {
                                  return InkWell(
                                    onTap: () {
                                      showBottomSheet(context);
                                    },
                                    child: value.categoryfileimg!=null?Container(
                                      width: 100,
                                      height: 100,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(
                                          side: BorderSide(width: 1, color: Color(0xFF650015)),
                                        ),
                                        image: DecorationImage(image: FileImage(value.categoryfileimg!,),fit: BoxFit.fill)
                                      ),
                                    ):Container(
                                      width: 100,
                                      height: 100,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(
                                          side: BorderSide(width: 1, color: Color(0xFF650015)),
                                        ),
                                      ),
                                      child: Icon(Icons.add_a_photo_outlined,color: Colors.grey,size: 40,),
                                    ),
                                  );
                                }
                              ),
                              SizedBox(height: 20,),
                              Container(
                                  height:50,
                                  width:200,
                                  child: Costfield(ItemController: value.addcategory ,width:296 , hight: 50, hintText: "Category",validator: (value) {
                                    if (value!.isEmpty) {

                                      return "Enter Category ";
                                    } else {}
                                  },type: TextInputType.name,),),
                              SizedBox(height: 20,),
                              Container(decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),),
                                child: MaterialButton(onPressed: (){

                                  // Navigator.pop(context);
                                  final FormState? form = formKey.currentState;
                                  if (form!.validate()) {
                                    if (value.categoryfileimg!= null) {
                                      mainprovider.uploadcatergory(context);
                                    }
                                    else{
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(backgroundColor: Colors.red,
                                            content: Text(
                                                "Upload Category Image ")),
                                      );
                                    }
                                  }
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
  void showBottomSheet(BuildContext context) {
    MainProvider provider =Provider.of<MainProvider>(context,listen: false);
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )
        ),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading:  Icon(
                    Icons.camera_enhance_sharp,
                    color: Colors.red,
                  ),
                  title: const Text('Camera',),
                  onTap: () => { provider.getImagecamera(), Navigator.pop(context)}),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.red),
                  title: const Text('Gallery',),
                  onTap: () => {provider.getImagegallery(),Navigator.pop(context)}),
            ],
          );
        });
    // ImageSource
  }

}