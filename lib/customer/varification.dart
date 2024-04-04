import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../providers/MainProvider.dart';
import 'Clogin.dart';

class Verification extends StatelessWidget {
  Verification({Key? key}) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override

  Widget build(BuildContext context) {


    MainProvider mainprovider = Provider.of(context,listen: false);

    // var code="";

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,
      elevation: 0,
      leading:IconButton(onPressed:(){
        Navigator.pop(context);
      },
        icon: Icon(Icons.arrow_back_ios_new_outlined), ),),
      body: Container(
        width: double.infinity,
        height: double.infinity,


        child:
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80,bottom: 90),
                    child: Container(
                      child :Image(
                        image: AssetImage("assets/varify.jpg"),
                        width: 300,
                      ),
                    ),
                  ),
                  Container(
                    height: 372,
                    width: 306,
                    child: Column(
                      children: [
                        Text("Enter verification code",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff650015),fontSize: 20),),
                        Padding(
                          padding: const EdgeInsets.only(top: 25,bottom: 30),
                          child: Text("Please enter the varification code sent to given Mobile Number",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff650015),fontSize: 14),),
                        ),
                    Pinput(
              
              
              
                      showCursor: true,
              
                    ),
              
                    SizedBox(
                          height: 30,
                        ),
              
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(onPressed: () async {
              //                           if(mainprovider.otp.length==6) {
              //                             try {
              //                               PhoneAuthCredential credential = PhoneAuthProvider
              //                                   .credential(verificationId: Clogin.verify,
              //                                   smsCode: mainprovider.otp);
              //
              //                               // Sign the user in (or link) with the credential
              //                               await auth.signInWithCredential(credential);
              //
              //                               mainprovider.accessNumber(mainprovider.phoneotp.text, context);
              //                               mainprovider.getMessCuts();
              //
              //
              //
              //                             } catch (e) {
              //                               print("Wrong OTP");
              //                               print(e.toString());
              //                             }
              //                           }else{
              //                             const snackBar = SnackBar(
              //                               content: Text('Please enter a valid otp!'),
              //                             );
              //
              // // Find the ScaffoldMessenger in the widget tree
              // // and use it to show a SnackBar.
              //                             ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //                           }
              
                          },

                            child: Text("Verify Your Number",style: TextStyle(color: Colors.white),),color:   Color(0xff650015),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),),


                        ),
              
              
                        TextButton(onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Clogin()),
                          );
                        }, child:Text("Edit Phone Number ?",style: TextStyle(color: Color(0xffD9D9D9)),))
              
                      ],
                    ),
                  ),
              
                ],
              ),
            ),
          ),
        ),
      ),


    );
  }
}
