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

    // Function to handle image upload
    Future<void> _handleImageUpload() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowCompression: true,
      );

      if (result != null) {
        if (result.files.isNotEmpty) {
          File file = File(result.files.single.path!);
          // Update the selected image file in the provider
          mainProvider.setImageFile(file);
        } else {
          // Handle the case where the file list is empty
          print('No file selected');
        }
      } else {
        // Handle the case where the user cancels the file picker
        print('User canceled the file picker');
      }
    }

    // Function to upload image to Firebase Storage
    Future<void> _uploadImageToFirebase(File file) async {
      try {
        FirebaseStorage storage = FirebaseStorage.instance;
        String fileName =
            'image_${DateTime.now().millisecondsSinceEpoch}.jpg'; // Generate a unique file name
        Reference ref = storage.ref().child('images').child(
            fileName); // Set the path where the file will be stored in Firebase Storage
        await ref.putFile(file);
        String downloadUrl = await ref.getDownloadURL();
        print('File uploaded to Firebase Storage: $downloadUrl');
        // Do something with the downloadUrl if needed
      } catch (e) {
        print('Error uploading file to Firebase Storage: $e');
      }
    }

    // Function to open browser for uploading
    void _openBrowserForUpload() async {
      const url = 'https://example.com/upload'; // Your upload URL
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    // Function to remove the uploaded image
    void _removeImage(MainProvider mainProvider) {
      mainProvider.setImageFile(null);
    }

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
                            child: value.categoryfileimg != null
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
                                              value.categoryfileimg!,
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
                        ElevatedButton(
                          onPressed: _openBrowserForUpload,
                          child: Text("Upload Image"),
                        ),
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
                                      " Category",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),





                                  ],
                                )),



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

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width / 1.1,
                                      child: TextFormField(
                                        cursorColor: Colors.brown,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.w200),
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black),
                                              borderRadius: BorderRadius.circular(10)),
                                          hintText: "Category name",
                                          hintStyle: const TextStyle(
                                              color: Colors.black45, fontFamily: 'cantata'),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
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
                            Costfield(
                                ItemController: value.variations,
                                width: 296,
                                hight: 50,
                                hintText: "variation"),
                            SizedBox(
                              height: 10,
                            ),
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
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: MaterialButton(
                            onPressed: () async {
                              if (mainProvider.imageFile != null) {
                                await _uploadImageToFirebase(
                                    mainProvider.imageFile!);
                                //mainprovider.upload();


                                // Perform submission or any other action after uploading to Firebase
                              } else {



                                // Show an error message or handle accordingly if no image is selected
                              }
                            },

                            child: const Text("Submit"),
                            highlightColor: Color(0xff0C630A),
                            splashColor: Colors.grey,
                            color: Colors.green,
                          ),
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
                      {provider.getImagecamera(), Navigator.pop(context)}),
              ListTile(
                  leading: Icon(Icons.photo, color: Colors.red),
                  title: const Text(
                    'Gallery',
                  ),
                  onTap: () =>
                      {provider.getImagegallery(), Navigator.pop(context)}),
            ],
          );
        });
    // ImageSource
  }
}


