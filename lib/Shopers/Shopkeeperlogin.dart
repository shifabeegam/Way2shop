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

    Future<void> _uploadFile() async {
      firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        File selectedFile = File(result.files.single.path!);

        setState(() {
          if (selectedFile.path.contains('IdProof')) {
            _selectedIdProof = selectedFile;
          } else if (selectedFile.path.contains('Licence')) {
            _selectedLicence = selectedFile;
          } else if (selectedFile.path.contains('TaxReceipt')) {
            _selectedTaxReceipt = selectedFile;
          }
        });

        try {
          String fileName = selectedFile.path.split('/').last;
          firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('notes/$fileName');
          await ref.putFile(selectedFile);
          String downloadURL = await ref.getDownloadURL();
          mainProvider.setPdfDownloadURL(downloadURL);
        } catch (e) {
          print('Error uploading file: $e');
        }
      }
    }

    void _removeFile(File selectedFile) {
      setState(() {
        if (selectedFile == _selectedIdProof) {
          _selectedIdProof = null;
        } else if (selectedFile == _selectedLicence) {
          _selectedLicence = null;
        } else if (selectedFile == _selectedTaxReceipt) {
          _selectedTaxReceipt = null;
        }
      });
    }

    Widget _buildFileUploadWidget(File? selectedFile, String hintText, FileType fileType) {
      return GestureDetector(
        onTap: () => _uploadFile(),
        child: Container(
          width: 296,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xff650015)),
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    selectedFile != null ? selectedFile.path.split('/').last : hintText,
                    style: TextStyle(color: Colors.white30, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (selectedFile != null)
                  InkWell(
                    onTap: () => _removeFile(selectedFile),
                    child: Icon(
                      Icons.close,
                      color: Colors.white30,
                      size: 20,
                    ),
                  ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
      );
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
                        SizedBox(height: 2),
                        Costfield(ItemController: value.licenceid, width: 296, hight: 50, hintText: "Licence Id"),
                        SizedBox(height: 10),
                        Costfield(ItemController: value.shopname, width: 296, hight: 50, hintText: "Shop Name"),
                        SizedBox(height: 10),
                        Costfield(ItemController: value.owname, width: 296, hight: 50, hintText: "Owner Name"),
                        SizedBox(height: 10),
                        Costfield(ItemController: value.phnu, width: 296, hight: 50, hintText: "Phone No:"),
                        SizedBox(height: 10),
                        Costfield(ItemController: value.email, width: 296, hight: 50, hintText: "Email"),
                        SizedBox(height: 10),
                        Costfield(ItemController: value.address, width: 296, hight: 50, hintText: "Address"),
                        SizedBox(height: 10),
                        Costfield(ItemController: value.shopdetails, width: 296, hight: 50, hintText: "Shop Details"),
                        SizedBox(height: 10),
                        _buildFileUploadWidget(
                          _selectedIdProof,
                          _selectedIdProof != null ? _selectedIdProof!.path.split('/').last : "Upload Id Proof",
                          FileType.custom,
                        ),
                        SizedBox(height: 10),
                        _buildFileUploadWidget(
                          _selectedLicence,
                          _selectedLicence != null ? _selectedLicence!.path.split('/').last : "Licence of Shop",
                          FileType.custom,
                        ),
                        SizedBox(height: 10),
                        _buildFileUploadWidget(
                          _selectedTaxReceipt,
                          _selectedTaxReceipt != null ? _selectedTaxReceipt!.path.split('/').last : "Tax Payment Receipt",
                          FileType.custom,
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
}
