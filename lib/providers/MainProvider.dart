import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController itemNm = TextEditingController();
  TextEditingController itemCd = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController category = TextEditingController();

  void upload() {
    final user = <String, dynamic>{
      "Item Name": itemNm.text,
      "item Code": itemCd.text,
      "Price": price.text,
      "Category": category.text,

    };
    db.collection("users").doc(itemNm.text.toString()).set(user);
    notifyListeners();
    print("Upload Succesfully");
  }

}

