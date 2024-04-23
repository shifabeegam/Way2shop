import 'dart:io';
import 'package:flutter/material.dart';
import 'package:a/widgets/Costfield.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Shopkeeperlogin extends StatefulWidget {
  const Shopkeeperlogin({Key? key}) : super(key: key);

  @override
  _ShopkeeperloginState createState() => _ShopkeeperloginState();
}

class _ShopkeeperloginState extends State<Shopkeeperlogin> {
  late MainProvider mainProvider;
  File? _selectedIdProof;
  File? _selectedLicence;
  File? _selectedTaxReceipt;

  @override
  Widget build(BuildContext context) {
    mainProvider = Provider.of<MainProvider>(context, listen: false);

    // Future<void> _uploadFile() async {
    //   firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
    //   FilePickerResult? result = await FilePicker.platform.pickFiles(
    //     type: FileType.custom,
    //     allowedExtensions: ['pdf'],
    //   );
    //
    //   if (result != null) {
    //     File selectedFile = File(result.files.single.path!);
    //
    //     setState(() {
    //       if (selectedFile.path.contains('IdProof')) {
    //         _selectedIdProof = selectedFile;
    //       } else if (selectedFile.path.contains('Licence')) {
    //         _selectedLicence = selectedFile;
    //       } else if (selectedFile.path.contains('TaxReceipt')) {
    //         _selectedTaxReceipt = selectedFile;
    //       }
    //     });
    //
    //     try {
    //       String fileName = selectedFile.path.split('/').last;
    //       firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('notes/$fileName');
    //       await ref.putFile(selectedFile);
    //       String downloadURL = await ref.getDownloadURL();
    //       mainProvider.setPdfDownloadURL(downloadURL);
    //     } catch (e) {
    //       print('Error uploading file: $e');
    //     }
    //   }
    // }

    // void _removeFile(File selectedFile) {
    //   setState(() {
    //     if (selectedFile == _selectedIdProof) {
    //       _selectedIdProof = null;
    //     } else if (selectedFile == _selectedLicence) {
    //       _selectedLicence = null;
    //     } else if (selectedFile == _selectedTaxReceipt) {
    //       _selectedTaxReceipt = null;
    //     }
    //   });
    // }

    // Widget _buildFileUploadWidget(File? selectedFile, String hintText, FileType fileType) {
    //   return GestureDetector(
    //     onTap: () => _uploadFile(),
    //     child: Container(
    //       width: 296,
    //       height: 50,
    //       decoration: BoxDecoration(
    //         border: Border.all(width: 1, color: Color(0xff650015)),
    //         borderRadius: BorderRadius.circular(15),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Color(0x3F000000),
    //             blurRadius: 4,
    //             offset: Offset(0, 4),
    //             spreadRadius: 0,
    //           )
    //         ],
    //       ),
    //       child: Center(
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             SizedBox(width: 10),
    //             Expanded(
    //               child: Text(
    //                 selectedFile != null ? selectedFile.path.split('/').last : hintText,
    //                 style: TextStyle(color: Colors.white30, fontSize: 15),
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ),
    //             if (selectedFile != null)
    //               InkWell(
    //                 onTap: () => _removeFile(selectedFile),
    //                 child: Icon(
    //                   Icons.close,
    //                   color: Colors.white30,
    //                   size: 20,
    //                 ),
    //               ),
    //             SizedBox(width: 10),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }

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
                    return Column(
                      children: [
                        SizedBox(height: 2),
                        Costfield(ItemController: value.licenceid, width: 296, hight: 50, hintText: "  Licence Id"),
                        SizedBox(height: 10),
                        Costfield(ItemController: value.shopname, width: 296, hight: 50, hintText: "  Shop Name"),
                        SizedBox(height: 10),
                        Costfield(ItemController: value.owname, width: 296, hight: 50, hintText: "  Owner Name"),
                        SizedBox(height: 10),
                        Costfield(ItemController: value.phnu, width: 296, hight: 50, hintText: "  Phone No:"),
                        SizedBox(height: 10),
                        Costfield(ItemController: value.email, width: 296, hight: 50, hintText: "  Email"),
                        SizedBox(height: 10),
                        Costfield(ItemController: value.address, width: 296, hight: 50, hintText: "  Place"),
                        SizedBox(height: 10),
                        Costfield(ItemController: value.shopdetails, width: 296, hight: 50, hintText: "  Shop Details"),

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
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:  Color(0xFF650015).withOpacity(0.8)),
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
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:  Color(0xFF650015).withOpacity(0.8)),
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
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:  Color(0xFF650015).withOpacity(0.8)),
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
                              mainProvider.Shopupload();
                            },
                            child: const Text("Submit"),
                            highlightColor: Color(0xff0C630A),
                            splashColor: Colors.grey,
                            color: Colors.green,
                          ),
                        )
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
