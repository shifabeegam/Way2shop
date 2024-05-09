import 'package:a/customer/varification.dart';
import 'package:a/providers/loginprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Shopers/Shopkeeperlogin.dart';
import '../providers/MainProvider.dart';
import 'Clogin.dart';

class UserRegistration extends StatelessWidget {
  UserRegistration({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/Mobile-login.jpg'),fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Form(key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Container(
                      child: Image(
                        image: AssetImage("assets/Mobile-login.jpg"),
                        width: 300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      height: 372,
                      width: 306,
                      child: Column(
                        children: [
                          Text(
                            "User registration",
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(color: Color(0xff800026), fontSize: 20),
                          ),

                          Consumer<LoginProvider>(
                              builder: (context, value, child) {
                                return Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Color(0xff800026)),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: TextFormField(
                                      controller: value.registerUserName,
                                      style: TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                          border: InputBorder.none,
                                          hintText: "   User name",
                                          hintStyle: TextStyle(
                                              fontSize: 14, color: Colors.grey)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "This field is Required";
                                        } else {

                                        }
                                      },
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          Consumer<MainProvider>(
                              builder: (context, value, child) {
                                return Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Color(0xff800026)),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    children: [

                                      Expanded(
                                        child: Consumer<LoginProvider>(
                                            builder: (context,value,child) {
                                              return TextFormField(
                                                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                                                controller: value.registerUserPhoneNumber,
                                                style: TextStyle(color: Colors.black),
                                                // controller:value.phoneotp ,
                                                keyboardType: TextInputType.phone,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "   Enter your phone number",
                                                    hintStyle: TextStyle(
                                                        fontSize: 14, color: Colors.grey)),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "This field is Required";
                                                  } else {

                                                  }
                                                },
                                              );

                                            }
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          Consumer<MainProvider>(
                              builder: (context, value, child) {
                                return Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Color(0xff800026)),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    children: [

                                      Expanded(
                                        child: Consumer<LoginProvider>(
                                            builder: (context,value,child) {
                                              return TextFormField(
                                                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                                                controller: value.registerUserPassword,
                                                style: TextStyle(color: Colors.black),
                                                // controller:value.phoneotp ,
                                                keyboardType: TextInputType.text,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "   Enter your Password",
                                                    hintStyle: TextStyle(
                                                        fontSize: 14, color: Colors.grey)),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "This field is Required";
                                                  } else {

                                                  }
                                                },
                                              );

                                            }
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),

                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              decoration: BoxDecoration(border: Border.all(
                                  color: Colors.white),
                                borderRadius: BorderRadius.circular(15),

                                gradient: LinearGradient(
                                  colors: [Color(0xff800026), Color(0xffCB470F),Color(0xff800026)],

                                  begin: Alignment.bottomLeft, end: Alignment.topRight,

                                ),
                              ),
                              child: Consumer<MainProvider>(
                                  builder: (context3,val,child) {
                                    return SizedBox(
                                      width: double.infinity,
                                      height: 45,
                                      child: Consumer<LoginProvider>(
                                        builder: (context4, value, child) {
                                          return MaterialButton(
                                            onPressed: () async {
                                              /*  await FirebaseAuth.instance.verifyPhoneNumber(
                                              phoneNumber:value.phonecont.text+value.phoneotp.text,
                                              verificationCompleted: (PhoneAuthCredential credential) {},
                                              verificationFailed: (FirebaseAuthException e) {},
                                              codeSent: (String verificationId, int? resendToken) {
                                                Login.verify=verificationId;*/
                                              final FormState? form = formKey.currentState;
                                              if(form!.validate()) {

                                                value.userRegistration(context);
                                                // value.controlllerclear();


                                              }  },
                                            child: Text(
                                              "REGISTER",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                           // color: Color(0xff650015),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15)),

                                            //   codeAutoRetrievalTimeout: (String verificationId) {},
                                          );
                                        },
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Clogin(),
                                ));

                          },
                            child: Text("Already a member, LOGIN",style: TextStyle(
                              color: Colors.blueAccent,fontSize: 16
                            ),),
                          ),

                        ],
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
