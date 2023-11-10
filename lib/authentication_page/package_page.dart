import 'package:flutter/material.dart';
import 'package:sevensquare/authentication_page/popup_page.dart';

import '../resources/color.dart';

class pageagepage extends StatefulWidget {
  const pageagepage({super.key});

  @override
  State<pageagepage> createState() => _pageagepageState();
}

class _pageagepageState extends State<pageagepage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: sevensgbg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

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
                  
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 30,
                      width: 400,
                      decoration: BoxDecoration(
                          color: greenblur,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(child: Text("Upload Image",style: TextStyle(color: bg1),)),
                    ),
                  ),
                  SizedBox(height: 10,),

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => popuppage()));
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
                  )

                ],
              ),
            ),
          )



        ],
      ),
    );
  }
}
