import 'dart:io';
import 'package:flutter/material.dart';
import 'package:a/widgets/Costfield.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Shopkeeperlogin extends StatefulWidget {
   Shopkeeperlogin({Key? key}) : super(key: key);

  @override
  _ShopkeeperloginState createState() => _ShopkeeperloginState();
}

class _ShopkeeperloginState extends State<Shopkeeperlogin> {
  final formKey = GlobalKey<FormState>();
  late MainProvider mainProvider;
  File? _selectedIdProof;
  File? _selectedLicence;
  File? _selectedTaxReceipt;

  @override
  Widget build(BuildContext context) {
    mainProvider = Provider.of<MainProvider>(context, listen: false);


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
         title: Text("Register",style: TextStyle(color:  Color(0xFF650015)),),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(
                child: Consumer<MainProvider>(
                  builder: (context, value, child) {
                    return Form(
                    key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 2),
                          Costfield(ItemController: value.licenceid, width: 296, hight: 50, hintText: "  Licence Id",validator: (value) {
                            if (value!.isEmpty) {

                              return "This field is required";
                            } else {}
                            },type: TextInputType.number,),
                          SizedBox(height: 10),
                          Costfield(ItemController: value.shopname, width: 296, hight: 50, hintText: "  Shop Name",validator: (value) {
                            if (value!.isEmpty) {

                              return "Enter Shop Name";
                            } else {}
                          },type: TextInputType.name,),
                          SizedBox(height: 10),
                          Costfield(ItemController: value.owname, width: 296, hight: 50, hintText: "  Owner Name",validator: (value) {
                            if (value!.isEmpty) {

                              return "Enter Owner Name";
                            } else {}
                          },type: TextInputType.name,),
                          SizedBox(height: 10),
                          Costfield(ItemController: value.phnu, width: 296, hight: 50, hintText: "  Phone No:",validator: (value) {
                            if (value!.isEmpty) {

                              return "Enter Phone number";
                            } else {}
                          },type: TextInputType.number,),
                          SizedBox(height: 10),
                          Costfield(ItemController: value.email, width: 296, hight: 50, hintText: "  Email",validator: (value) {
                            if (value!.isEmpty) {

                              return "Enter Email Id";
                            } else {}
                          },type: TextInputType.emailAddress,),
                          SizedBox(height: 10),
                          Costfield(ItemController: value.address, width: 296, hight: 50, hintText: "  Place",validator: (value) {
                            if (value!.isEmpty) {

                              return "Enter your Place";
                            } else {}
                          },type: TextInputType.text,),
                          SizedBox(height: 10),
                          Costfield(ItemController: value.shopdetails, width: 296, hight: 50, hintText: "  Shop Details",validator: (value) {
                            if (value!.isEmpty) {

                              return "Enter Shop Details";
                            } else {}
                          },type: TextInputType.text,),

                          SizedBox(height: 10),
                          Consumer<MainProvider>(
                            builder: (context,value,child) {
                              return InkWell(
                                onTap: (){
                                  showBottomSheetlicence(context);
                                },
                                child: Container(
                                width: 296,
                                height:50,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:  Colors.white,border: Border.all(color:Color(0xFF650015) ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),//(0xFF650015).withOpacity(0.8)),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [
                                      Text('  Upload Licence                ',style: TextStyle(color: Colors.grey,fontSize: 16),),
                                      value.licencefileimg!=null?Container(
                                        width: 90,
                                        height: 30,
                                        decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: OvalBorder(
                                              side: BorderSide(width: 1, color: Color(0xFF650015)),
                                            ),
                                            image: DecorationImage(image: FileImage(value.licencefileimg!,),fit: BoxFit.fill)
                                        ),
                                      ):Icon(Icons.file_upload_outlined,color: Colors.grey,)
                                    ],
                                  ),
                                ),
                              );
                            }
                          ),
                          SizedBox(height: 10),
                          Consumer<MainProvider>(
                            builder: (context,value,child) {
                              return InkWell(
                                onTap: (){
                                  showBottomSheetreceipt(context);
                                },
                                child: Container(
                                  width: 296,
                                  height:50,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:  Colors.white,border: Border.all(color:Color(0xFF650015) ),
                                      boxShadow: [
                                      BoxShadow(
                                      color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                                ],),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [
                                      Text('  Tax Payment Receipt                ',style: TextStyle(color: Colors.grey,fontSize: 16),),
                                      value.receiptfileimg!=null?Container(
                                        width: 90,
                                        height: 30,
                                        decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: OvalBorder(
                                              side: BorderSide(width: 1, color: Color(0xFF650015)),
                                            ),
                                            image: DecorationImage(image: FileImage(value.receiptfileimg!,),fit: BoxFit.fill)
                                        ),
                                      ):

                                      Icon(Icons.file_upload_outlined,color: Colors.grey,)
                                    ],
                                  ),
                                ),
                              );
                            }
                          ),
                          SizedBox(height: 10),
                          Consumer<MainProvider>(
                            builder: (context,value,child) {
                              return InkWell(
                                onTap: (){
                                  showBottomSheetproof(context);
                                },
                                child: Container(
                                  width: 296,
                                  height:50,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:  Colors.white,border: Border.all(color:Color(0xFF650015) ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],),//(0xFF650015).withOpacity(0.8)),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [
                                      Text('  Upload Id Proof               ',style: TextStyle(color: Colors.grey,fontSize: 16),),
                                  value.prooffileimg!=null?Container(
                                    width: 90,
                                    height: 30,
                                    decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(
                                          side: BorderSide(width: 1, color: Color(0xFF650015)),
                                        ),
                                        image: DecorationImage(image: FileImage(value.prooffileimg!,),fit: BoxFit.fill)
                                    ),):

                                      Icon(Icons.file_upload_outlined,color: Colors.grey,),
                                    ],
                                  ),
                                ),
                              );
                            }
                          ),

                          SizedBox(height: 10),
                          Container(
                            width: 296,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                final FormState? form =
                                    formKey.currentState;
                                if (form!.validate()) {
                                  if (value.licencefileimg != null) {
                                    if(value.prooffileimg!=null) {
                                      if(value.receiptfileimg!=null) {
                                        mainProvider.Shopupload(context);
                                      }
                                      else{
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(backgroundColor: Colors.red,
                                              content: Text(
                                                  "Upload Tax Payment Receipt ")),
                                        );
                                      }
                                    }
                                    else
                                      {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(

                                      const SnackBar(backgroundColor: Colors.red,
                                      content: Text(
                                      "Upload Id Proof ")),
                                      );

                                      }

                                  }
                                }
                                else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                            "Upload licence ")),
                                  );
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showBottomSheetlicence(BuildContext context) {
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
                  onTap: () => { provider.getImagecameraLicence(), Navigator.pop(context)}),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.red),
                  title: const Text('Gallery',),
                  onTap: () => {provider.getImagegalleryLicence(),Navigator.pop(context)}),
            ],
          );
        });
    // ImageSource
  }
  void showBottomSheetproof(BuildContext context) {
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
                  onTap: () => { provider.getImagecameraProof(), Navigator.pop(context)}),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.red),
                  title: const Text('Gallery',),
                  onTap: () => {provider.getImagegalleryProof(),Navigator.pop(context)}),
            ],
          );
        });
    // ImageSource
  }
  void showBottomSheetreceipt(BuildContext context) {
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
                  onTap: () => { provider.getImagecameraReceipt(), Navigator.pop(context)}),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.red),
                  title: const Text('Gallery',),
                  onTap: () => {provider.getImagegalleryReceipt(),Navigator.pop(context)}),
            ],
          );
        });
    // ImageSource
  }



}
