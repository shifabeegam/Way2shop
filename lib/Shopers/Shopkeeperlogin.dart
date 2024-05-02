import 'dart:io';
import 'package:flutter/material.dart';
import 'package:a/widgets/Costfield.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../Model/ItemModel.dart';

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
                          //

                          Autocomplete<Placemodel>(
                            optionsBuilder: (TextEditingValue textEditingValue) {
                              return value.placelist
                                  .where((Placemodel item) => item.Placename
                                  .toLowerCase()
                                  .contains(textEditingValue.text.toLowerCase()))
                                  .toList();
                            },
                            displayStringForOption: (Placemodel option) =>
                            option.Placename,
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController fieldTextEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                fieldTextEditingController.text = value.address.text;
                              });

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: SizedBox(
                                    width: 295,
                                    height: 50,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'This Field is Required';
                                        } else {}
                                      },
                                      cursorColor: Colors.brown,
                                      maxLines: 1,

                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(
                                      //       width: 1, color: Color(0xff650015)),
                                      //   borderRadius: BorderRadius.circular(15),
                                      //   boxShadow: [
                                      //     BoxShadow(
                                      //       color: Color(0x3F000000),
                                      //       blurRadius: 4,
                                      //       offset: Offset(0, 4),
                                      //       spreadRadius: 0,
                                      //     )
                                      //   ],
                                      // ),
                                      decoration:
                                      InputDecoration(

                                        focusedBorder: OutlineInputBorder(

                                            borderSide: BorderSide(color: Color(0xff650015),),
                                            borderRadius: BorderRadius.circular(10)),

                                        hintText: "Place",
                                        hintStyle: const TextStyle(
                                            color: Colors.black45, fontFamily: 'cantata'),
                                        border: OutlineInputBorder(
                                          //borderSide: BorderSide(width: 1,color: Color(0xff650015),),
                                          borderRadius: BorderRadius.circular(15),
                                          //  borderSide: BorderSide(color: Colors.white, width: 3.0))

                                        ),

                                      ),
                                      onChanged: (txt) {},
                                      controller: fieldTextEditingController,
                                      focusNode: fieldFocusNode,
                                    ),
                                  ),
                                ),
                              );
                            },
                            onSelected: (Placemodel selection) {
                              value.address.text = selection.Placename;
                              value.productSelectedCategoryID = selection.id;
                            },
                            optionsViewBuilder: (BuildContext context,
                                AutocompleteOnSelected<Placemodel> onSelected,
                                Iterable<Placemodel> options) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Material(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(15)),
                                    width: 200,
                                    height: 200,
                                    child: ListView.builder(
                                      padding: const EdgeInsets.all(10.0),
                                      itemCount: options.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        final Categorymodel option = options.elementAt(index);

                                        return GestureDetector(
                                          onTap: () {
                                            onSelected(option);
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  // border: Border(left: BorderSide(color: Colors.white,width: .6,
                                                  // ))
                                                ),
                                                height: 30,
                                                width: 200,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Center(
                                                        child: Text(option.name,
                                                            style: const TextStyle(
                                                              fontFamily: 'cantata',
                                                              color: Colors.black,
                                                            )),
                                                      ),
                                                    ]),
                                              ),
                                              Divider(
                                                thickness: 1,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

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
                                value.getLocation();
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
