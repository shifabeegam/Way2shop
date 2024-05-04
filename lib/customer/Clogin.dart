import 'package:a/customer/varification.dart';
import 'package:a/providers/loginprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Shopers/Shopkeeperlogin.dart';
import '../providers/MainProvider.dart';

class Clogin extends StatelessWidget {
   Clogin({super.key});

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
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      height: 372,
                      width: 306,
                      child: Column(
                        children: [
                          Text(
                            "What is your phone number ?",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Color(0xff650015), fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 40),
                            child: Text(
                              "Please confirm your country code and enter your Mobile Number",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff650015), fontSize: 14),
                            ),
                          ),
                          Consumer<LoginProvider>(
                              builder: (context, value, child) {
                            return Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xff650015)),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: TextFormField(
                                  controller: value.loginusername,
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
                                      width: 1, color: Color(0xff650015)),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: [

                                  Expanded(
                                    child: Consumer<LoginProvider>(
                                      builder: (context,value,child) {
                                        return TextFormField(
                                          inputFormatters: [LengthLimitingTextInputFormatter(10)],
                                          controller: value.loginuserPassword,
                                          style: TextStyle(color: Colors.black),
                                          // controller:value.phoneotp ,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Enter your Password",
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
                            child: Consumer<MainProvider>(
                              builder: (context,val,child) {
                                return SizedBox(
                                  width: double.infinity,
                                  height: 45,
                                  child: Consumer<LoginProvider>(
                                    builder: (context, value, child) {
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

                                          value.passwordverify(value.loginusername.text,value.loginuserPassword.text,context);
                                          // value.controlllerclear();


                                      }  },
                                        child: Text(
                                          "LOGIN",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Color(0xff650015),
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
                        ],
                      ),
                    ),
                  ),

                  //   Consumer<LoginProvider>(
                  //     builder: (context,val1,child) {
                  //     return Consumer<MainProvider>(
                  //         builder: (context,val,child) {
                  //         return InkWell(onTap: () {
                  //           final FormState? form = formKey.currentState;
                  //           if(form!.validate()) {
                  //             val.adduser(context, "SHOPKEEPERS");
                  //             val1.controlllerclear();
                  //             Navigator.push(context, MaterialPageRoute(
                  //               builder: (context) => Shopkeeperlogin(),));
                  //           }   },
                  //           child: Row(mainAxisAlignment: MainAxisAlignment.end,
                  //             children: [
                  //               Text("add Shops"),
                  //               Icon(Icons.arrow_forward),
                  //             ],
                  //           ),
                  //         );
                  //       }
                  //     );
                  //   }
                  // ),

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
