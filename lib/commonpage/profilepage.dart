import 'package:flutter/material.dart';

import '../resources/color.dart';
import 'forgottpassword.dart';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
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
        title: Text("profile",style: TextStyle(color: bg1,fontSize: 16),),

      ),
      body: Column(

        children: [

          SizedBox(height: 50,),


          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),

                ),
                child: Image.network("https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
              ),
            ),
          ),
          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Faizy',style: TextStyle(color: bg1),),
                  Text('Seclobclt@gmail.com',style: TextStyle(color: bg1)),
                  Text('9995544121',style: TextStyle(color: bg1)),
                ],
              ),
            ),
          ),

          SizedBox(height: 20,),



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 126,
              width: 400,
              decoration: BoxDecoration(
                color: bottomtacolor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const forgottpassword()),
                      );
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Change Password",style: TextStyle(color: bg1,fontWeight: FontWeight.w700,fontSize: 13),),
                    ),
                  ),


                  SizedBox(height: 10,),

                  
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Teams & Condition",style: TextStyle(color: bg1,fontWeight: FontWeight.w700,fontSize: 13),),
                  ),
                  SizedBox(height: 10,),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Privacy Policy",style: TextStyle(color: bg1,fontWeight: FontWeight.w700,fontSize: 13),),
                  ),
                ],
              ),
            ),
          )

        ],
      ),

    );
  }
}