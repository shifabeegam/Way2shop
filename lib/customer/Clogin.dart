// import 'package:a/customer/varification.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../providers/MainProvider.dart';
//
// class Clogin extends StatelessWidget {
//   const Clogin({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/img_15.png'),fit: BoxFit.cover)),
//         child:
//
//         Center(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 80),
//                 child: Container(
//                   child :Image(
//                     image: AssetImage("assets/login .webp"),
//                     width: 300,
//                   ),
//                 ),
//               ),
//
//
//               Padding(
//                 padding: const EdgeInsets.only(top: 50),
//                 child: Container(
//                   height: 372,
//                   width: 306,
//                   child: Column(
//                     children: [
//                       Text("What is your phone number ?",textAlign: TextAlign.center,style: TextStyle(color: Color(0xffD9D9D9),fontSize: 20),),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 25,bottom: 40),
//                         child: Text("Please confirm your country code and enter your Mobile Number",textAlign: TextAlign.center,style: TextStyle(color: Color(0xffD9D9D9),fontSize: 14),),
//                       ),
//
//                       Consumer<MainProvider>(
//                           builder: (context,value,child) {
//
//                             return Container(
//                               height: 50,
//                               decoration: BoxDecoration(border: Border.all(width: 1,color: Color(0xffD9D9D9)),borderRadius: BorderRadius.circular(15)),
//                               child: Row(
//                                 children: [
//                                   SizedBox(
//                                     width:10 ,
//                                   ),
//                                   SizedBox(
//                                     width: 40,
//                                     child: TextField(
//                                       style: TextStyle(color: Colors.white),
//                                       keyboardType: TextInputType.phone,
//                                       //controller: value.phonecont,
//
//
//
//                                       decoration: InputDecoration(
//                                           border:InputBorder.none,
//                                           hintText: "+91",hintStyle: TextStyle(fontSize:14,color: Colors.grey)
//                                       ),
//                                     ),
//                                   ),
//
//                                   Text("|",style:TextStyle(fontSize: 33,color: Color(0xffD9D9D9) ) ,),
//                                   SizedBox(
//                                     width:10 ,
//                                   ),
//
//                                   Expanded(
//
//
//                                     child: TextField(style: TextStyle(color: Colors.white),
//                                      // controller:value.phoneotp ,
//                                       keyboardType: TextInputType.phone,
//                                       decoration: InputDecoration(
//
//                                           border:InputBorder.none,hintText: "Enter your phone number",hintStyle: TextStyle(fontSize:14,color: Colors.grey)),
//                                     ),
//                                   ), ],
//                               ),
//                             );
//                           }
//                       ),
//
//   SizedBox(
//                         width: 250,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//                           child: Consumer<MainProvider>(
//                               builder: (context,value,child) {
//                                 return TextFormField(
//                                   keyboardType: TextInputType.phone,
//
//                                  // controller:value.phoneotp ,
//                                   decoration: const InputDecoration(
//                                     border: UnderlineInputBorder(borderSide: Radius.circular(15)),
//                                     labelText: 'Enter your Mobile Number',labelStyle: TextStyle(color: Colors.white),
//                                   ),
//                                 );
//                               }
//                           ),
//                         ),
//                       ),
//
//
//                       Padding(
//                         padding: const EdgeInsets.only(top: 30),
//                         child: SizedBox(
//                           width: double.infinity,height: 45,
//                           child: Consumer<MainProvider>(
//                               builder: (context,value,child) {
//                                 return MaterialButton(onPressed: () async{
//  await FirebaseAuth.instance.verifyPhoneNumber(
//                                     phoneNumber:value.phonecont.text+value.phoneotp.text,
//                                     verificationCompleted: (PhoneAuthCredential credential) {},
//                                     verificationFailed: (FirebaseAuthException e) {},
//                                     codeSent: (String verificationId, int? resendToken) {
//                                       Login.verify=verificationId;
//
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>  Verification()),);
//
//
//                                     },
//                                  //   codeAutoRetrievalTimeout: (String verificationId) {},
//                                   );
//
//                                 },
//                                 //  child: Text("Send the code"), color:   Color(0xffCECDCD),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//
//                                 );
//                               }
//                           ),),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//
//       )
//       ,
//     );
//   }
// }
