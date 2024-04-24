
class ItemModel {
  String itemid;
  String photo;
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
  String productcare;
  String instruction;

  ItemModel(this.itemid,this.photo,this.itemname,this.price,this.category,this.categoryid,this.description,this.itemquartity,this.offers
      ,this.color,this.brand,this.productdiemension,this.assmbly,this.productcare,this.instruction);

}

class Categorymodel {
  String id;
  String name;
  String photo;
  Categorymodel(this.id,this.name,this.photo);

}

class AllitemsModel{


}


class ShopModel{

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

  ShopModel(this.licence,this.shopname,this.ownername,this.phone,this.email,this.place,this.idproof,this.licenceproof,this.receipt,this.id);

}