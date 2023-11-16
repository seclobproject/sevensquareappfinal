import 'package:flutter/material.dart';
import 'package:sevensquare/resources/color.dart';

class forgottpassword extends StatefulWidget {
  const forgottpassword({super.key});

  @override
  State<forgottpassword> createState() => _forgottpasswordState();
}

class _forgottpasswordState extends State<forgottpassword> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: sevensgbg,
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("New Password",style: TextStyle(color: bg1),)),
          ),

          Container(
            height: 55,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                autocorrect: true,
                style: TextStyle(color: Colors.white), // Set text color to white
                decoration: InputDecoration(
                  hintText: 'Enter your New Password',
                  hintStyle: TextStyle(color: Colors.grey,),
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
                child: Text("Conform password ",style: TextStyle(color: bg1),)),
          ),

          Container(
            height: 55,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                autocorrect: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your New Conform Password',
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
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => pageagepage()));
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
                    child: Text("Continue",style: TextStyle(
                        fontSize: 14,fontWeight: FontWeight.w700,color: sevensgbg),)),
              ),
            ),
          )

        ],
      ),
    );
  }
}
