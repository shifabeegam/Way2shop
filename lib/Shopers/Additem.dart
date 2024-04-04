import 'package:flutter/material.dart';
import 'package:a/widgets/Costfield.dart';
import 'package:a/widgets/HomeButton.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:provider/provider.dart';

String dropdownvalue = 'Item 1';

// List of items in our dropdown menu
var items = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
];




const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Additem extends StatelessWidget {
  const Additem({super.key});



  @override
  Widget build(BuildContext context) {
    MainProvider mainprovider = Provider.of(context,listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( backgroundColor:Color(0xFF650015),
        /*leading:InkWell(
        onTap: (){},

        child: Container(

            width:15,
            child: Image.asset("lib/icons/img_1.png")),

      ),*/
      ),
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(//color: Color(0xff650015),
          gradient: LinearGradient(
            colors: [ Colors.white,Color(0xff650015)],

            begin: Alignment.bottomCenter, end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
          
          
              SizedBox(height: 50,),
              Center(



                    child: Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return Column(
                          children: [
                            SizedBox(height: 20,),
                            Container(
                            width: 100,
                            height: 100,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: OvalBorder(
                                side: BorderSide(width: 1, color: Color(0xFF650015)),
                              ),
                            ),
                              child: InkWell(onTap: (){}, child: Icon(Icons.add_a_photo_outlined,color: Colors.grey,size: 40,)),
                          ),
                            SizedBox(height: 20,),
                            Costfield(ItemController: value.itemNm,width: 296, hight: 50, hintText: "Item Name"),
                            SizedBox(height: 10,),
                            Costfield(ItemController: value.itemCd,width:296 , hight: 50, hintText: "Item Code"),
                            SizedBox(height: 10,),

                            Costfield(ItemController: value.price,width:296 , hight: 50, hintText: "Price"),
                            SizedBox(height: 10,),

                            Costfield(ItemController: value.quantity,width:296 , hight: 50, hintText: "Item Quantity"),
                            SizedBox(height: 10,),


                            DropdownButton(

                              // Initial Value
                              value: dropdownvalue,

                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),

                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                            SizedBox(height: 10,),











  SizedBox(height: 30,),
                            Container(decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),),
                              child: MaterialButton(onPressed: (){
                                mainprovider.upload();
                              },
                              child: const Text("Submit"),
                              highlightColor: Color(0xff0C630A),
                              splashColor: Colors.grey,
                                color: Colors.green,
                              ),
                            )
          
                          ]
          
                        );
                      }
                    ),

              ),
            ],
          ),
        ),



      ),

    );
  }

  void setState(Null Function() param0) {}


}
