import 'package:a/providers/MainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddCategory.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(//color: Color(0xff650015),
        gradient: LinearGradient(
          colors: [ Colors.white,Color(0xff650015)],

          begin: Alignment.bottomCenter, end: Alignment.topCenter,
        ),
      ),

      child: Scaffold(
        floatingActionButton: Consumer<MainProvider>(
          builder: (context,value,child) {
            return FloatingActionButton(backgroundColor: Color(0xff650015),shape: CircleBorder(),
              child:Icon(Icons.add,color: Colors.white) ,
              onPressed: () {
              value.categoryclear();
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddCategory(),));

              },);
          }
        ),
        appBar: AppBar(),
        body: Consumer<MainProvider>(
          builder: (context,value,child) {
            return ListView.builder(
              itemCount: value.categorylist.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 180,
                    height: 180,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Image.network(value.categorylist[index].photo,scale: 5,),
                        Text(value.categorylist[index].name)
                      ],
                    ),

                  );
                },);
          }
        ),
      ),
    );
  }
}
