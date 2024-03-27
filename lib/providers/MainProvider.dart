import 'package:a/Model/ItemModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainProvider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController itemNm = TextEditingController();
  TextEditingController itemCd = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController Upquantity = TextEditingController();
  TextEditingController Upid = TextEditingController();

  TextEditingController cost = TextEditingController();

  TextEditingController category = TextEditingController();

  List <ItemModel> allAdditem = [];
  TextEditingController addcategory = TextEditingController();


// Add item Details

  void upload() {


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
              map["Item Quantity"].toString()));

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


 void uploadcatergory(){

    final category = <String, dynamic>{
      "Category":addcategory.text,
    };
    db.collection("CATEGORIES").doc(addcategory.text.toString()).set(category);
    notifyListeners();
    print("upload Successfully");
 }

}

