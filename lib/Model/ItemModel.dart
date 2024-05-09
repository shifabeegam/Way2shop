import 'package:flutter/material.dart';

class ItemModel {
  String itemid;
  List photo;
  String itemname;
  String price;
  String category;
  String categoryid;
  String description;
  String itemquartity;
  String offers;
  String color;
  String brand;
  String productdiemension;
  String assmbly;

  String instruction;
  String place;
  String shopname;

  String phone;
  String shopdetails;
  String shopId;
  String point;

  ItemModel(
    this.itemid,
    this.photo,
    this.itemname,
    this.price,
    this.category,
    this.categoryid,
    this.description,
    this.itemquartity,
    this.offers,
    this.color,
    this.brand,
    this.productdiemension,
    this.assmbly,
    this.instruction,
    this.shopname,
    this.phone,
      this.place,
      this.shopdetails,
      this.shopId,
      this.point,
  );
}

class Placemodel {
  String id;
  String placename;

  Placemodel(this.id, this.placename);
}

class Categorymodel {
  String id;
  String name;
  String photo;

  Categorymodel(this.id, this.name, this.photo);
}

class AllitemsModel {}

class ShopModel {
  String licence;
  String shopname;
  String ownername;
  String phone;
  String email;
  String place;
  String idproof;
  String licenceproof;
  String receipt;
  String id;
  double latitude;
  double longitude;
  double distance;

  ShopModel(
      this.licence,
      this.shopname,
      this.ownername,
      this.phone,
      this.email,
      this.place,
      this.idproof,
      this.licenceproof,
      this.receipt,
      this.id,
      this.latitude,
      this.longitude,
      this.distance);
}

class shopOrderModel {
  String customerName;
  String customerId;
  String phone;
  String productName;
  String productPrice;
  String productId;
  String orderId;
  String status;
  DateTime orderDate;
  Duration duration;

  shopOrderModel(this.customerName, this.customerId, this.phone,
      this.productName, this.productPrice, this.productId, this.orderId,this.status,this.orderDate,this.duration);
}

class UsersModel{

  String userName;
  String phoneNumber;
  String status;
  String id;
  UsersModel(this.userName, this.phoneNumber, this.status, this.id);



}
