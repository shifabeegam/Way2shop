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
  TextEditingController brand = TextEditingController();
  TextEditingController diamention = TextEditingController();
  TextEditingController requirements = TextEditingController();
  TextEditingController productcare = TextEditingController();
  TextEditingController instruction = TextEditingController();

  String productSelectedCategoryID="";

// Add item Details

  File? itemfileimage=null;
  String itemimg="";

  Future<void> upload() async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> itemmap = HashMap();

    itemmap["Item Name"] = itemNm.text;
    itemmap["Price"] = price.text;
    itemmap["color"] = color.text;
    itemmap["Category"] = addcategory.text;
    itemmap["description"] =description.text;
    itemmap["Item Quantity"] = quantity.text;
    itemmap["Item Id"] = id;
    itemmap["Offers"] = offers.text;
    itemmap["Brand"] = brand.text;
    itemmap["Product Dimensions"] = diamention.text;
    itemmap["Assembly Required"] = requirements.text;
    itemmap["Product Care"] = productcare.text;
    itemmap["Instructions"] =instruction.text;
    itemmap["Category_id"] =productSelectedCategoryID;
    if (itemfileimage != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(itemfileimage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          itemmap ["PHOTO"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      itemmap['PHOTO'] = itemimg;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    db.collection("ITEMS").doc(id).set(itemmap);
    notifyListeners();
    print("Upload Succesfully");
  }
  void setImage1(File image) {
    itemfileimage = image;
    notifyListeners();
  }

  Future getitemImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImage1(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  Future getitemImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setImage1(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  // View the Items
   void getItem(String catid){
    db.collection("ITEMS").where("Category_id",isEqualTo: catid).get().then((value)
      {
        allAdditem.clear();
       // totalAmount = 0.0;
        print("object.................");
        if(value.docs.isNotEmpty){
          for(var element in value.docs) {
            Map<dynamic, dynamic> map = element.data() as Map;
            allAdditem.add(ItemModel(
           map["Item Id"].toString(),
           map["PHOTO"].toString(),
           map["Item Name"].toString(),
           map["Price"].toString(),
           map["Category"].toString(),
           map["Category_id"].toString(),
           map["description"].toString(),
           map["Item Quantity"].toString(),
           map["Offers"].toString(),
           map["color"].toString(),
           map["Brand"].toString(),
           map["Product Dimensions"].toString(),
           map["Assembly Required"].toString(),
           map["Product Care"].toString(),
           map["Instructions"].toString(),
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
  File? prooffileimg;
  String proofimg  ="";
  void setImageproof(File image) {
    prooffileimg = image;
    notifyListeners();
  }

  Future getImagecameraProof() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setImageproof(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }
  Future getImagegalleryProof() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImageproof(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  File? receiptfileimg;
  String receiptimg  ="";
  void setImagereceipt(File image) {
    receiptfileimg = image;
    notifyListeners();
  }

  Future getImagecameraReceipt() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setImagereceipt(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }
  Future getImagegalleryReceipt() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImagereceipt(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }





  File? licencefileimg;
  String licenceimg  ="";
  void setImagelicence(File image) {
    licencefileimg = image;
    notifyListeners();
  }

  Future getImagecameraLicence() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setImagelicence(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }
  Future getImagegalleryLicence() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImagelicence(File(pickedImage.path));
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


  List<ShopModel> shoplist=[];
  void getshop(){
    db.collection("SHOPS").get().then((value) {
      if (value.docs.isNotEmpty) {
        shoplist.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          shoplist.add(ShopModel(
              map["Licence Id"].toString(),
              map["Shop_Name"].toString(),
              map["Owner Name"].toString(),
              map["Phone No"].toString(),
              map["Email"].toString(),
              map["Place"].toString(),
              map["proof"].toString(),
              map["licence"].toString(),
              map["receipt"].toString()));


              }
          notifyListeners();


      }
      notifyListeners();
    });
  }






  void Shopupload() async{
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> shopmap = HashMap();

    shopmap["Licence Id"] = licenceid.text;
    shopmap["Owner Name"] = owname.text;
    shopmap["Phone No"] = phnu.text;
    shopmap["Email"] = email.text;
    shopmap["Place"] = address.text;
    shopmap["Shop_Name"] = shopname.text;
    shopmap["Shop_Details"] = shopdetails.text;
    shopmap["Shop_ID"] = id;
    shopmap["Status"] = "Pending";

    if (licencefileimg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(licencefileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          shopmap["licence"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      shopmap['licence'] = licenceimg;
      // editMap['IMAGE_URL'] = imageUrl;
    }

    if (receiptfileimg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(receiptfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          shopmap["proof"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      shopmap['proof'] = receiptimg;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if (receiptfileimg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(receiptfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          shopmap["receipt"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      shopmap['receipt'] = receiptimg;
      // editMap['IMAGE_URL'] = imageUrl;
    }



    db.collection("SHOPS").doc(id.toString()).set(shopmap);
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

