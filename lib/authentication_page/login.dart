import 'package:flutter/material.dart';
import 'package:sevensquare/authentication_page/package_page.dart';


import '../resources/color.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sevensgbg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("Username ",style: TextStyle(color: bg1),)),
          ),

          Container(
            height: 55,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                autocorrect: true,
                style: TextStyle(color: Colors.white), // Set text color to white
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: bg1, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: bg1),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("Password ",style: TextStyle(color: bg1),)),
          ),

          Container(
            height: 55,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                autocorrect: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.grey),
                  // filled: true,
                  // fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: bg1, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color:  bg1),
                  ),
                ),),
            ),
          ),

          SizedBox(height: 40,),

          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => pageagepage()));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 55,
                width: 400,
                decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text("Login",style: TextStyle(
                        fontSize: 14,fontWeight: FontWeight.w700,color: bg1),)),
              ),
            ),
          )


        ],
      ),
    );
  }
}
