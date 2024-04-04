import 'package:a/customer/varification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/MainProvider.dart';

class Clogin extends StatelessWidget {
  const Clogin({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      Container(
        width: double.infinity,
        height: double.infinity,
        //decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/Mobile-login.jpg'),fit: BoxFit.cover)),
        child:

        Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                    child :Image(
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
                        Text("What is your phone number ?",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff650015),fontSize: 20),),
                        Padding(
                          padding: const EdgeInsets.only(top: 25,bottom: 40),
                          child: Text("Please confirm your country code and enter your Mobile Number",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff650015),fontSize: 14),),
                        ),



                        Consumer<MainProvider>(
                            builder: (context,value,child) {

                              return Container(
                                height: 50,
                                decoration: BoxDecoration(border: Border.all(width: 1,color: Color(0xff650015)),borderRadius: BorderRadius.circular(15)),
                                child:
                                    Center(
                                      child: TextField(
                                          style: TextStyle(color: Colors.black),
                                          keyboardType: TextInputType.name,
                                          //controller: value.phonecont,

                                        decoration: InputDecoration(
                                              border:InputBorder.none,
                                              hintText: "User name",hintStyle: TextStyle(fontSize:14,color: Colors.grey)
                                          ),
                                        ),
                                    ),




                              );
                            }
                        ),

                        SizedBox(height: 10,),


                        Consumer<MainProvider>(
                            builder: (context,value,child) {
            
                              return Container(
                                height: 50,
                                decoration: BoxDecoration(border: Border.all(width: 1,color: Color(0xff650015)),borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width:10 ,
                                    ),
                                    SizedBox(
                                      width: 40,
                                      child: TextField(
                                        style: TextStyle(color: Colors.black),
                                        keyboardType: TextInputType.phone,
                                        //controller: value.phonecont,
            
            
            
                                        decoration: InputDecoration(
                                            border:InputBorder.none,
                                            hintText: "+91",hintStyle: TextStyle(fontSize:14,color: Colors.grey)
                                        ),
                                      ),
                                    ),
            
                                    Text("|",style:TextStyle(fontSize: 33,color: Color(0xff650015) ) ,),
                                    SizedBox(
                                      width:10 ,
                                    ),
            
                                    Expanded(
            
            
                                      child: TextField(style: TextStyle(color: Colors.white),
                                       // controller:value.phoneotp ,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
            
                                            border:InputBorder.none,hintText: "Enter your phone number",hintStyle: TextStyle(fontSize:14,color: Colors.grey)),
                                      ),
                                    ), ],
                                ),
                              );
                            }
                        ),
            
            
            
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SizedBox(
                            width: double.infinity,height: 45,
                            child: Consumer<MainProvider>(
                                builder: (context,value,child) {
                                  return MaterialButton(onPressed: () async{
           /*  await FirebaseAuth.instance.verifyPhoneNumber(
                                      phoneNumber:value.phonecont.text+value.phoneotp.text,
                                      verificationCompleted: (PhoneAuthCredential credential) {},
                                      verificationFailed: (FirebaseAuthException e) {},
                                      codeSent: (String verificationId, int? resendToken) {
                                        Login.verify=verificationId;*/
            
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>  Verification()),);

            
                                      },
                                      child: Text("Send the code",style: TextStyle(color: Colors.white),) ,color: Color(0xff650015),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

                                  //   codeAutoRetrievalTimeout: (String verificationId) {},
                                    );

                                  },


                                  ),
            
                                ),
                            ),
                      ],
                            ),
                        ),
            
            
            
                    ),
              ],
                  ),
          ),
              ),

          ),
        );


  }
}
