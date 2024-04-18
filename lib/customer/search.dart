import 'package:flutter/material.dart';

import '../providers/MainProvider.dart';


class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 130,
                decoration: const BoxDecoration(color: Color(0xff650015)),
                child: Column(
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to search screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SearchScreen()),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 360,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white10),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              fillColor: Colors.white10,
                              filled: true,
                              focusedBorder: InputBorder.none,
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(Icons.search, color: Colors.white),
                              suffixIcon: Icon(Icons.mic, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}

