import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../navigation/bottom_tabs_screen.dart';
import '../resources/color.dart';
import '../services/home_service.dart';
import '../services/profile_service.dart';
import '../support/logger.dart';


class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  // final String apiUrl = "http://sevensquaregroup.in/api/users/verify-user";
  String? imageUrl;
  // final String referenceNo = "777";
  var userid;
  String? refrence;
  var profilepageapi;

  Future<void> uploadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = (prefs.getString('userid') ?? "");

    try {
      if (imageUrl == null) {
        print("Please pick an image first");
        return;
      }

      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imageUrl!),
        'referenceNo': refrence,
      });

      var response = await ProfileService.profileimage(formData);

      if (response.statusCode == 200) {

        print("Image uploaded successfully");
        print(response.data);
      } else {
        // Handle error
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomTabsScreen()),
        );
        print(response.statusCode);
        print(response.data);
      }
    } catch (e) {
      print("Exception during image upload: $e");
    }
  }


  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageUrl = pickedFile.path;
      });
    }
  }



  Future profilepage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = (prefs.getString('userid') ?? "");
    print("userid....$userid");
    var response = await HomeService.GetProfile();
    log.i('Profile page. $response');

    setState(() {
      profilepageapi = response;
      });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profilepage();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        iconTheme: IconThemeData(
          color:bg1, //change your color here
        ),
        centerTitle: true,
        title: Text("Verify Account",style: TextStyle(color: bg1,fontSize: 16),),

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(

                  width: 400,
                  decoration: BoxDecoration(
                      color: blackgray,
                      borderRadius: BorderRadius.circular(20)),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Align(
                        alignment:Alignment.topLeft,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Your Package Amount",style: TextStyle(fontSize: 11,color: bg1),),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            profilepageapi?['packageChosen']?.toString() ?? 'Default Value',
                            style: TextStyle(fontSize: 15, color: bg1, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),


                      SizedBox(height: 10,),

                      Align(
                        alignment:Alignment.topLeft,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Enter your Transaction ID",style: TextStyle(fontSize: 11,color: bg1),),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: 60,
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
                            cursorHeight: 14,
                            cursorColor: bg1,
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
                      InkWell(
                        onTap: (){
                          pickImage();
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 45,
                            width: 400,
                            decoration: BoxDecoration(
                                color: greenblur,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(child: Text("Upload Image",style: TextStyle(color: bg1),)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),


                      imageUrl != null
                          ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Image.file(File(imageUrl!)),
                          )
                          : Text("No image selected",style: TextStyle(color: Colors.red),),
                      SizedBox(height: 10),

                      GestureDetector(
                        onTap: (){
                          uploadImage();
                        },
                        child: Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            color: yellow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text("Submit",style: TextStyle(color: Colors.white),)),

                        ),
                      ),
                      SizedBox(height: 20),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
