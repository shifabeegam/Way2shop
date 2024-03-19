import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController itemNm = TextEditingController();
  TextEditingController itemCd = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();


  TextEditingController category = TextEditingController();
  List allAdditem = [];



 
// Add item Details

  void upload() {
    final user = <String, dynamic>{
      "Item Name": itemNm.text,
      "item Code": itemCd.text,
      "Price": price.text,
      "Item Quantity": quantity.text,
      "Category": category.text,


    };

    db.collection("users").doc(itemNm.text.toString()).set(user);
    notifyListeners();
    print("Upload Succesfully");
  }

  // View the Items

    void getItem(){

      db.collection("users").snapshots().listen((value)
      {
        allAdditem.clear();
       // totalAmount = 0.0;
        print("object.................");
        if(value.docs.isNotEmpty){
          for(var element in value.docs) {
            Map<dynamic, dynamic> map = element.data() as Map;
            print("-------------------------------------------");
            
            print(element.data());
            print(map["Item Name"]);
            print(map["Price"]);

            // allAdditem.add(AdditemModal(
            //     map["Item Name"],
            //     map["Price"].toString() as num,
            //
            //
            //
            //
            //     //element.get("A"),
            //
            //    // map["Date"].toString()
            //
            // ));

            notifyListeners();
          }

          notifyListeners();
          print("---------------------");

        }
      });


 }

}

// class AdditemModal {
//   String itemName ;
//   num quantity;
//
//
//
//   AdditemModal(this.itemName, this.quantity);
//
//
//
// }

