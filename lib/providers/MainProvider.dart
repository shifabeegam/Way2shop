import 'dart:collection';
import 'dart:io';

import 'package:a/Model/ItemModel.dart';
import 'package:a/providers/loginprovider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MainProvider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Reference ref = FirebaseStorage.instance.ref("IMAGE URL");


  TextEditingController itemNm = TextEditingController();
  TextEditingController itemCd = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController Upquantity = TextEditingController();
  TextEditingController Upid = TextEditingController();

  TextEditingController cost = TextEditingController();

  TextEditingController category = TextEditingController();

  List <ItemModel> allAdditem = [];
  TextEditingController addcategory = TextEditingController();

  TextEditingController owname = TextEditingController();
  TextEditingController phnu = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController shopname = TextEditingController();
  TextEditingController shopdetails = TextEditingController();
  TextEditingController  idprooof= TextEditingController();
  TextEditingController  licence= TextEditingController();
  TextEditingController reciept = TextEditingController();
  TextEditingController licenceid = TextEditingController();
  TextEditingController offers = TextEditingController();
  TextEditingController variations = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController diamention = TextEditingController();
  TextEditingController requirements = TextEditingController();
  TextEditingController productcare = TextEditingController();
  TextEditingController instruction = TextEditingController();



// Add item Details

  void upload() {


    final user = <String, dynamic>{

      "Item Name": itemNm.text,
      //"item Code": itemCd.text,
      "Price": price.text,
      "color": color.text,
      "description": description.text,
      "Item Quantity": quantity.text,
      "Category": category.text,
      "Offers" :offers.text,
      "variation":variations.text,
      "Brand":brand.text,
      "Product Dimensions":diamention.text,
      "Assembly Required":requirements.text,
      "Product Care":productcare.text,
      "Instructions":instruction.text,
    };


    db.collection("ITEMS").doc(itemCd.text.toString()).set(user);
    notifyListeners();
    print("Upload Succesfully");
  }

  // View the Items
  


    void getItem(){


      db.collection("ITEMS").snapshots().listen((value)
      {
        allAdditem.clear();
       // totalAmount = 0.0;
        print("object.................");
        if(value.docs.isNotEmpty){
          for(var element in value.docs) {
            Map<dynamic, dynamic> map = element.data() as Map;

           allAdditem.add(ItemModel(
               map["Item Name"].toString(),
               map["item Code"].toString(),
              map["Item Quantity"].toString()
           ));

            notifyListeners();



          }



          notifyListeners();

        }
      });





    }
  var q;
  var Uid;
  void incrementInteger() {

    print('function called');
    print(Upquantity);
    q = int.tryParse(Upquantity.text);
    Uid = int.tryParse(Upid.text);
    print(Uid);
    print(q);
    int.parse(q);
    // final user = <String, dynamic>{
    //
    //   "Item Name": itemNm.text,
    //   "item Code": itemCd.text,
    //   "Price": price.text,
    //   "Item Quantity": quantity.text,
    //   "Category": category.text,
    //
    //
    // };


    // db.collection("ITEMS").doc(itemCd.text.toString()).set(user);
    // notifyListeners();
    print("Upload Succesfully");
  }

  void stupload() {


    final user = <String, dynamic>{

      "Item Name": itemNm.text,
      "item Code": itemCd.text,
      "Price": price.text,
      "Item Quantity": quantity.text,
      "Category": category.text,


    };


    db.collection("ITEMS").doc(itemCd.text.toString()).set(user);
    notifyListeners();
    print("Upload Succesfully");
  }


  void adduser(BuildContext context,String type){
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);

    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> usermap = HashMap();
    usermap["USER_ID"]= id;
    usermap["USER_NAME"]= loginProvider.loginusername.text;
    usermap["PHONE_NUMBER"]= "+91"+loginProvider.Loginphnnumber.text;
    usermap["TYPE"]= type;
    usermap["STATUS"]= "ACTIVE";
    db.collection("USERS").doc(id).set(usermap);

  }








  File? categoryfileimg;
  String categoryimg  ="";


 Future<void> uploadcatergory() async {
   String id = DateTime
       .now()
       .millisecondsSinceEpoch
       .toString();
   HashMap<String, Object> categorymap = HashMap();

   categorymap["CATEGORY_NAME"] = addcategory.text;
   categorymap["CATEGORY_ID"] = id;

   if (categoryfileimg != null) {
     String photoId = DateTime.now().millisecondsSinceEpoch.toString();
     ref = FirebaseStorage.instance.ref().child(photoId);
     await ref.putFile(categoryfileimg!).whenComplete(() async {
       await ref.getDownloadURL().then((value) {
         categorymap["PHOTO"] = value;
         notifyListeners();
       });
       notifyListeners();
     });
     notifyListeners();
   } else {
     categorymap['PHOTO'] = categoryimg;
     // editMap['IMAGE_URL'] = imageUrl;
   }
   db.collection("CATEGORIES").doc(id).set(categorymap);
   getcategoy();
   notifyListeners();
   print("upload Successfully");
 }

  void setImage(File image) {
    categoryfileimg = image;
    notifyListeners();
  }

  Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImage(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setImage(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  void categoryclear(){
    addcategory.clear();
    categoryfileimg=null;
    categoryimg="";
 }

  List<Categorymodel> categorylist=[];
  void getcategoy(){
    db.collection("CATEGORIES").get().then((value) {
      if (value.docs.isNotEmpty) {
        categorylist.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          categorylist.add(Categorymodel(
              map["CATEGORY_ID"].toString(),
               map["CATEGORY_NAME"].toString(),
              map["PHOTO"].toString()));
          notifyListeners();
        }

      }
      notifyListeners();
    });
  }








  void Shopupload() {


    final shop = <String, dynamic>{
      "Licence Id":licenceid.text,
      "Owner Name": owname.text,
      "Phone No:": phnu.text,
      "Email": price.text,
      "Address": quantity.text,
      "Shop Name": shopname.text,
      "Shop Details": shopdetails.text,
      //"Upload Id Proof":idprooof.,
     // "Licence of Shop"


    };


    db.collection("SHOPS").doc(licenceid.text.toString()).set(shop);
    notifyListeners();
    print("Upload Succesfully");
  }

  String _pdfDownloadURL = '';

  // Getter for PDF download URL
  String get pdfDownloadURL => _pdfDownloadURL;

  // Method to set PDF download URL
  void setPdfDownloadURL(String url) {
    _pdfDownloadURL = url;
    notifyListeners(); // Notify listeners that the state has changed
  }
  File? _imageFile;

  File? get imageFile => _imageFile;

  void setImageFile(File ?file) {
    _imageFile = file;
    notifyListeners();
  }


}

