import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../navigation/bottom_tabs_screen.dart';
import '../resources/color.dart';
import '../services/bank_service.dart';
import 'package:dio/dio.dart';


class bankaccount extends StatefulWidget {
  const bankaccount({super.key});

  @override
  State<bankaccount> createState() => _bankaccountState();
}

class _bankaccountState extends State<bankaccount> {


  var userid;
  String? holderName;
  String? imageUrl1; // for the first image
  String? imageUrl2; // for the second image
  String? accountNum;
  String? ifscCode;
  String? bank;
  String? aadhar;
  String? pan;

  Future<void> uploadImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = (prefs.getString('userid') ?? "");

    try {
      if (imageUrl1 == null || imageUrl2 == null) {
        print("Please pick both images first");
        return;
      }

      FormData formData = FormData.fromMap({
        'file1': await MultipartFile.fromFile(imageUrl1!),
        'file2': await MultipartFile.fromFile(imageUrl2!),
        'holderName': holderName,
        'accountNum': accountNum,
        'ifscCode': ifscCode,
        'bank': bank,
        'aadhar': aadhar,
        'pan': pan,
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomTabsScreen()),
      );

      var response = await BankService.addbankdetails(formData);

      if (response.statusCode == 200) {
        print("Images uploaded successfully");
        print(response.data);
      } else {
        print('hello');
        print(response.statusCode);
        print(response.data);
      }
    } catch (e) {
      print('kk');
      print("Exception during image upload: $e");
    }
  }

  Future<void> pickImage1() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageUrl1 = pickedFile.path;
      });
    }
  }

  Future<void> pickImage2() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageUrl2 = pickedFile.path;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: sevensgbg,
        iconTheme: IconThemeData(
          color:bg1, //change your color here
        ),
        centerTitle: true,
        title: Text("Bank Details",style: TextStyle(color: bg1,fontSize: 16),),

      ),
      backgroundColor: sevensgbg,
      body: SingleChildScrollView(
        child: Column(

          children: [

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: 444,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: blackgray,
                      width: 1,
                    ),
                    color: walletinner,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Column(
                  children: [

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Name",style: TextStyle(color: bg1),)),
                    ),

                    Container(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          autocorrect: true,
                          style: TextStyle(
                              color: Colors.white),
                          onChanged: (text) {
                            setState(() {
                              holderName=text;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
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

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Account Number ",style: TextStyle(color: bg1),)),
                    ),

                    Container(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          autocorrect: true,
                          onChanged: (text) {
                            setState(() {
                              accountNum=text;
                            });
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
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

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("IFSC Code",style: TextStyle(color: bg1),)),
                    ),

                    Container(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          autocorrect: true,
                          onChanged: (text) {
                            setState(() {
                              ifscCode=text;
                            });
                          },
                          style: TextStyle(
                              color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
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

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Bank",style: TextStyle(color: bg1),)),
                    ),

                    Container(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              bank=text;
                            });
                          },
                          autocorrect: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
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



                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Aadhaar Number",style: TextStyle(color: bg1),)),
                    ),


                    Container(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              aadhar=text;
                            });
                          },
                          autocorrect: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
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


                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Pan Card Number",style: TextStyle(color: bg1),)),
                    ),


                    Container(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              pan=text;
                            });
                          },
                          autocorrect: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
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
                    SizedBox(height: 20,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        GestureDetector(
                          onTap: (){
                            pickImage1();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: yellow,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(child: Text("Upload",style: TextStyle(fontSize: 10),)),
                            height: 30,
                            width: 150,

                          ),
                        ),

                        SizedBox(width: 10,),


                        GestureDetector(
                          onTap: (){
                            pickImage2();
                          },
                          child: Container(
                            height: 30,
                            width: 150,
                            decoration: BoxDecoration(
                                color: yellow,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Center(
                                child: Text("Upload",style: TextStyle(fontSize: 10),)),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 170,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: imageUrl1 != null ? Image.file(File(imageUrl1!)) : Placeholder(),
                          ),
                        ),

                        Container(
                          height: 100,
                          width: 170,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: imageUrl2 != null ? Image.file(File(imageUrl2!)) : Placeholder(),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10,),



                    InkWell(
                      onTap: (){

                        uploadImages();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 40,
                          width: 444,
                          decoration: BoxDecoration(
                              color: yellow,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(
                              child: Text("Submit",style: TextStyle(color: sevensgbg,fontWeight: FontWeight.w700),)),
                        ),
                      ),
                    ),



                    SizedBox(height: 20,),





                  ],
                ),


              ),
            ),


          ],
        ),
      ),
    );
  }
}



