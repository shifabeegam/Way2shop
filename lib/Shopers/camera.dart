import 'dart:io';
import 'package:a/Admin/categoryslist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:a/widgets/HomeButton.dart';

import '../Model/ItemModel.dart';
import '../widgets/Costfield.dart';

class camera extends StatelessWidget {
  const camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF650015),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xff650015)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(
                child: Consumer<MainProvider>(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFF650015)),
                            ),
                          ),
                          // child: Stack(
                          child: InkWell(
                            onTap: () {
                              showBottomSheet(context);
                            },
                            child: value.itemfileimage != null
                                ? Container(
                                    width: 100,
                                    height: 100,
                                    decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFF650015)),
                                        ),
                                        image: DecorationImage(
                                            image: FileImage(
                                              value.itemfileimage!,
                                            ),
                                            fit: BoxFit.fill)),
                                  )
                                : Container(
                                    width: 100,
                                    height: 100,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: OvalBorder(
                                        side: BorderSide(
                                            width: 1, color: Color(0xFF650015)),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add_a_photo_outlined,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ),
                          ),
                          //   alignment: Alignment.center,
                          //   children: [
                          //     if (value.imageFile != null)
                          //       Image.file(value.imageFile!, width: double.infinity, height: double.infinity, fit: BoxFit.cover)
                          //     else
                          //       InkWell(
                          //         onTap: _handleImageUpload,
                          //         child: Icon(Icons.add_a_photo_outlined, color: Colors.grey, size: 40),
                          //       ),
                          //     if (value.imageFile != null)
                          //       Positioned(
                          //         top: 0,
                          //         right: 0,
                          //         child: IconButton(
                          //           icon: Icon(Icons.remove_circle, color: Colors.red),
                          //           onPressed: () => _removeImage(mainProvider),
                          //         ),
                          //       ),
                          //   ],
                          // ),
                        ),
                        SizedBox(height: 10),
                        Text("Upload Image"),
                        SizedBox(height: 30),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Costfield(
                                ItemController: value.itemNm,
                                width: 296,
                                hight: 50,
                                hintText: "Item Name"),
                            SizedBox(
                              height: 10,
                            ),
                            // Costfield(ItemController: value.itemCd,width:296 , hight: 50, hintText: "Item Code"),
                            //SizedBox(height: 10,),

                            Costfield(
                                ItemController: value.price,
                                width: 296,
                                hight: 50,
                                hintText: "Price"),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 50,
                                width: 296,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xff650015)),
                                  borderRadius: BorderRadius.circular(15),
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
                                  children: [
                                    Text(
                                      "  color",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),


                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFF650015)),
                                        ),
                                      ),
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.add_a_photo_outlined,
                                            color: Colors.grey,
                                            size: 20,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFF650015)),
                                        ),
                                      ),
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.add_a_photo_outlined,
                                            color: Colors.grey,
                                            size: 20,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFF650015)),
                                        ),
                                      ),
                                      child: InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.add_a_photo_outlined,
                                            color: Colors.grey,
                                            size: 20,
                                          )),
                                    ),
                                  ],
                                )),

                            SizedBox(
                              height: 10,
                            ),

                            // Container(
                            //     height: 50,
                            //     width: 296,
                            //     decoration: BoxDecoration(
                            //       border: Border.all(
                            //           width: 1, color: Color(0xff650015)),
                            //       borderRadius: BorderRadius.circular(15),
                            //       boxShadow: [
                            //         BoxShadow(
                            //           color: Color(0x3F000000),
                            //           blurRadius: 4,
                            //           offset: Offset(0, 4),
                            //           spreadRadius: 0,
                            //         )
                            //       ],
                            //     ),
                            //     child: Row(
                            //       children: [
                            //         Text(
                            //           " Category",
                            //           style: TextStyle(
                            //               color: Colors.grey, fontSize: 18),
                            //         ),
                            //         SizedBox(
                            //           width: 40,
                            //         ),
                            //
                            //
                            //
                            //
                            //
                            //       ],
                            //     )),



                            SizedBox(
                              height: 10,
                            ),


                            Autocomplete<Categorymodel>(

                              optionsBuilder: (TextEditingValue textEditingValue) {
                                return value.categorylist
                                    .where((Categorymodel item) => item.name
                                    .toLowerCase()
                                    .contains(textEditingValue.text.toLowerCase()))
                                    .toList();
                              },
                              displayStringForOption: (Categorymodel option) =>
                              option.name,
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController fieldTextEditingController,
                                  FocusNode fieldFocusNode,
                                  VoidCallback onFieldSubmitted) {
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  fieldTextEditingController.text = value.addcategory.text;
                                });
                                print("anbbbdncfej");

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: SizedBox(
                                      width: 295,
                                      height: 50,
                                      child: TextFormField(

                                        cursorColor: Colors.brown,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 16),

                                        decoration:
                                        InputDecoration(

                                          focusedBorder: OutlineInputBorder(

                                               borderSide: BorderSide(color: Color(0xff650015),),
                                              borderRadius: BorderRadius.circular(10)),

                                          hintText: "Category name",
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
                              onSelected: (Categorymodel selection) {
                                value.addcategory.text = selection.name;
                                value.productSelectedCategoryID = selection.id;
                              },
                              optionsViewBuilder: (BuildContext context,
                                  AutocompleteOnSelected<Categorymodel> onSelected,
                                  Iterable<Categorymodel> options) {
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

                            SizedBox(height: 10,),
                            Autocomplete<ShopModel>(
                              optionsBuilder: (TextEditingValue textEditingValue) {
                                return value.shoplist
                                    .where((ShopModel item) => item.shopname
                                    .toLowerCase()
                                    .contains(textEditingValue.text.toLowerCase()))
                                    .toList();
                              },
                              displayStringForOption: (ShopModel option) =>
                              option.shopname,
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController fieldSTextEditingController,
                                  FocusNode fieldFocusNode,
                                  VoidCallback onFieldSubmitted) {
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  fieldSTextEditingController.text = value.shopname.text;
                                });

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: SizedBox(
                                      width: 295,
                                      height: 50,
                                      child: TextFormField(

                                        cursorColor: Colors.brown,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 16),

                                        decoration:
                                        InputDecoration(

                                          focusedBorder: OutlineInputBorder(

                                              borderSide: BorderSide(color: Color(0xff650015),),
                                              borderRadius: BorderRadius.circular(10)),

                                          hintText: "Shop name",
                                          hintStyle: const TextStyle(
                                              color: Colors.black45, fontFamily: 'cantata'),
                                          border: OutlineInputBorder(
                                            //borderSide: BorderSide(width: 1,color: Color(0xff650015),),
                                            borderRadius: BorderRadius.circular(15),
                                            //  borderSide: BorderSide(color: Colors.white, width: 3.0))

                                          ),

                                        ),
                                        onChanged: (txt) {
                                          // value.shopname.text = txt;
                                        },
                                        controller: fieldSTextEditingController,
                                        focusNode: fieldFocusNode,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              onSelected: (ShopModel selection) {
                                value.shopname.text = selection.shopname;
                                value.SelectedShopID = selection.id;
                              },
                              optionsViewBuilder: (BuildContext context,
                                  AutocompleteOnSelected<ShopModel> onSelected,
                                  Iterable<ShopModel> options) {
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
                                          final ShopModel option = options.elementAt(index);

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
                                                          child: Text(option.shopname,
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







                            Container(
                                width: 296,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xff650015)),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Consumer<MainProvider>(
                                    builder: (context, value, child) {
                                  return TextField(
                                    controller: mainProvider.description,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText: "  description",
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  );
                                })),
                            SizedBox(
                              height: 10,
                            ),

                            Costfield(
                                ItemController: value.quantity,
                                width: 296,
                                hight: 50,
                                hintText: "Item Quantity"),
                            SizedBox(
                              height: 10,
                            ),
                            Costfield(
                                ItemController: value.offers,
                                width: 296,
                                hight: 50,
                                hintText: "Offers"),
                            SizedBox(
                              height: 10,
                            ),
                            // Costfield(
                            //     ItemController: value.variations,
                            //     width: 296,
                            //     hight: 50,
                            //     hintText: "variation"),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Costfield(
                                ItemController: value.color,
                                width: 296,
                                hight: 50,
                                hintText: "Color"),
                            SizedBox(
                              height: 10,
                            ),
                            Costfield(
                                ItemController: value.brand,
                                width: 296,
                                hight: 50,
                                hintText: "Brand"),
                            SizedBox(
                              height: 10,
                            ),
                            Costfield(
                                ItemController: value.diamention,
                                width: 296,
                                hight: 50,
                                hintText: "Product Dimensions"),
                            SizedBox(
                              height: 10,
                            ),
                            Costfield(
                                ItemController: value.requirements,
                                width: 296,
                                hight: 50,
                                hintText: "Assembly Required"),
                            SizedBox(
                              height: 10,
                            ),
                            Costfield(
                                ItemController: value.productcare,
                                width: 296,
                                hight: 50,
                                hintText: "Product Care"),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: 296,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xff650015)),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Consumer<MainProvider>(
                                    builder: (context, value, child) {
                                  return TextField(
                                    controller: mainProvider.instruction,
                                    maxLines: 10,
                                    decoration: InputDecoration(
                                        hintText: "  Instructions",hintStyle: TextStyle(color: Colors.grey),),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  );
                                })),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Consumer<MainProvider>(
                          builder: (context,value,child) {
                            return InkWell(onTap: () {
                              value.upload();
                            },
                              child: Container(
                                width:150 ,
                                height: 50,

                                decoration: BoxDecoration(
                                  color: Colors.green,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(child: const Text("Submit")),
                              ),
                            );
                          }
                        ),
                      ],
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

  void showBottomSheet(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context, listen: false);
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(
                    Icons.camera_enhance_sharp,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Camera',
                  ),
                  onTap: () =>
                      {provider.getitemImagecamera(), Navigator.pop(context)}),
              ListTile(
                  leading: Icon(Icons.photo, color: Colors.red),
                  title: const Text(
                    'Gallery',
                  ),
                  onTap: () =>
                      {provider.getitemImagegallery(), Navigator.pop(context)}),
            ],
          );
        });
    // ImageSource
  }
}


