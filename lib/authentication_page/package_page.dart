// import 'package:flutter/material.dart';
// import 'package:sevensquare/authentication_page/popup_page.dart';
//
// import '../resources/color.dart';
//
// class pageagepage extends StatefulWidget {
//   const pageagepage({super.key});
//
//   @override
//   State<pageagepage> createState() => _pageagepageState();
// }
//
// class _pageagepageState extends State<pageagepage> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: sevensgbg,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 26),
//             child: Container(
//               height: 240,
//               width: 400,
//               decoration: BoxDecoration(
//                 color: blackgray,
//                   borderRadius: BorderRadius.circular(20)),
//
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//
//                   Align(
//                     alignment:Alignment.topLeft,
//                     child: Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 20),
//                       child: Text("Your Package Amount",style: TextStyle(fontSize: 11,color: bg1),),
//                     ),
//                   ),
//                   SizedBox(height: 5,),
//                   Align(
//                     alignment:Alignment.topLeft,
//                     child: Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 20),
//                       child: Text("₹10000",style: TextStyle(fontSize: 15,color: bg1,fontWeight: FontWeight.w700),),
//                     ),
//                   ),
//
//                   SizedBox(height: 10,),
//
//                   Align(
//                     alignment:Alignment.topLeft,
//                     child: Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 20),
//                       child: Text("Enter your referral ID",style: TextStyle(fontSize: 11,color: bg1),),
//                     ),
//                   ),
//                   SizedBox(height: 5,),
//                   Container(
//                     height: 30,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                       child: TextField(
//                         autocorrect: true,
//                         style: TextStyle(color: Colors.white),
//                         decoration: InputDecoration(
//
//                           hintStyle: TextStyle(color: Colors.grey),
//                           // filled: true,
//                           // fillColor: Colors.white70,
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                             borderSide: BorderSide(color: bg1, width: 1),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                             borderSide: BorderSide(color:  bg1),
//                           ),
//                         ),),
//                     ),
//                   ),
//
//                   SizedBox(height: 5,),
//
//                   Align(
//                     alignment:Alignment.topLeft,
//                     child: Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 20),
//                       child: Text("Upload your sent amount screenshot",style: TextStyle(fontSize: 11,color: bg1),),
//                     ),
//                   ),
//                   SizedBox(height: 5,),
//                   // Container(
//                   //   height: 30,
//                   //   child: Padding(
//                   //     padding: EdgeInsets.symmetric(horizontal: 20),
//                   //     child: TextField(
//                   //       autocorrect: true,
//                   //       style: TextStyle(color: Colors.white),
//                   //       decoration: InputDecoration(
//                   //
//                   //         hintStyle: TextStyle(color: Colors.grey),
//                   //         // filled: true,
//                   //         // fillColor: Colors.white70,
//                   //         enabledBorder: OutlineInputBorder(
//                   //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                   //           borderSide: BorderSide(color: bg1, width: 1),
//                   //         ),
//                   //         focusedBorder: OutlineInputBorder(
//                   //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                   //           borderSide: BorderSide(color:  bg1),
//                   //         ),
//                   //       ),),
//                   //   ),
//                   // ),
//
//
//
//                   Padding(
//                     padding:  EdgeInsets.symmetric(horizontal: 20),
//                     child: Container(
//                       height: 30,
//                       width: 400,
//                       decoration: BoxDecoration(
//                           color: greenblur,
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Center(child: Text("Upload Image",style: TextStyle(color: bg1),)),
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//
//                   GestureDetector(
//                     onTap: (){
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => popuppage()));
//                     },
//                     child: Container(
//                       height: 30,
//                       width: 80,
//                       decoration: BoxDecoration(
//                         color: yellow,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Center(child: Text("Submit",style: TextStyle(color: Colors.white),)),
//
//                     ),
//                   )
//
//                 ],
//               ),
//             ),
//           )
//
//
//
//         ],
//       ),
//     );
//   }
// }



import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:sevensquare/resources/color.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/profile_service.dart';
import '../support/logger.dart';

class profile_page extends StatefulWidget {
  profile_page({Key? key}) : super(key: key);

  @override
  State<profile_page> createState() => _profile_pageState();
}

var profilepage;
String? image;
String img = '';
File? pathfile;

String? refrence;

Future<dynamic> _pickImage({bool fromGallery = true}) async {
  XFile? images = await ImagePicker().pickImage(
    source: fromGallery ? ImageSource.gallery : ImageSource.camera,
  );
  return File(images!.path);
}

Future _imageupload(value) async {
  List<int> imageBytes = (await value.readAsBytesSync()) as List<int>;
  img = "data:image/jpg;base64," + base64Encode(imageBytes);
  print('......print img....$img');
  var reqData = {
    'image': img,
    "referenceNo": refrence,
  };
  var response = await ProfileService.profileimage(reqData);
  log.i('image upload. $response');
}



class _profile_pageState extends State<profile_page> {
  String? userid;
  bool _isLoading = true;
  bool _isLoader = false;
  File? _imageFile;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sevensgbg,
      body:  SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: backgroundpro,
              elevation: 0,
              actions: [],
            ),

            SizedBox(
              height: 15,
            ),
            // SizedBox(height: 100, child: topcategory()),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "My profile",
                    style: TextStyle(
                        fontSize: 34, fontWeight: FontWeight.w900),
                  )),
            ),

            SizedBox(
              height: 100,
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Container(
                height: 240,
                width: 400,
                decoration: BoxDecoration(
                    color: blackgray,
                    borderRadius: BorderRadius.circular(20)),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Align(
                      alignment:Alignment.topLeft,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Your Package Amount",style: TextStyle(fontSize: 11,color: bg1),),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Align(
                      alignment:Alignment.topLeft,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20),
                        child: Text("₹10000",style: TextStyle(fontSize: 15,color: bg1,fontWeight: FontWeight.w700),),
                      ),
                    ),

                    SizedBox(height: 10,),

                    Align(
                      alignment:Alignment.topLeft,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Enter your referral ID",style: TextStyle(fontSize: 11,color: bg1),),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      height: 30,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          autocorrect: true,
                          onChanged: (text) {
                            setState(() {
                              refrence=text;
                            });
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(

                            hintStyle: TextStyle(color: Colors.grey),
                            // filled: true,
                            // fillColor: Colors.white70,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: bg1, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color:  bg1),
                            ),
                          ),),
                      ),
                    ),

                    SizedBox(height: 5,),

                    Align(
                      alignment:Alignment.topLeft,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Upload your sent amount screenshot",style: TextStyle(fontSize: 11,color: bg1),),
                      ),
                    ),
                    SizedBox(height: 5,),
                    // Container(
                    //   height: 30,
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 20),
                    //     child: TextField(
                    //       autocorrect: true,
                    //       style: TextStyle(color: Colors.white),
                    //       decoration: InputDecoration(
                    //
                    //         hintStyle: TextStyle(color: Colors.grey),
                    //         // filled: true,
                    //         // fillColor: Colors.white70,
                    //         enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    //           borderSide: BorderSide(color: bg1, width: 1),
                    //         ),
                    //         focusedBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    //           borderSide: BorderSide(color:  bg1),
                    //         ),
                    //       ),),
                    //   ),
                    // ),

                    // InkWell(
                    //   onTap: () {
                    //     imageupload(context).then((value) {
                    //       setState(() {
                    //         // imageedit = true;
                    //       });
                    //     });
                    //     setState(() {});
                    //   },
                    //   child: Padding(
                    //     padding:  EdgeInsets.symmetric(horizontal: 20),
                    //     child: Container(
                    //       height: 30,
                    //       width: 400,
                    //       decoration: BoxDecoration(
                    //           color: greenblur,
                    //           borderRadius: BorderRadius.circular(10)),
                    //       child: Center(child: Text("Upload Image",style: TextStyle(color: bg1),)),
                    //     ),
                    //   ),
                    // ),

                    SizedBox(height: 10,),

                    // GestureDetector(
                    //   onTap: (){
                    //
                    //   },
                    //   child: Container(
                    //     height: 30,
                    //     width: 80,
                    //     decoration: BoxDecoration(
                    //       color: yellow,
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: Center(child: Text("Submit",style: TextStyle(color: Colors.white),)),
                    //
                    //   ),
                    // )

                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}


