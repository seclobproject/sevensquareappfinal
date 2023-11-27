import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../navigation/bottom_tabs_screen.dart';
import '../../../resources/color.dart';
import '../../../services/userpin_service.dart';
import '../../../support/logger.dart';

class addactivatedpin extends StatefulWidget {
  const addactivatedpin({super.key});

  @override
  State<addactivatedpin> createState() => _addactivatedpinState();
}

class _addactivatedpinState extends State<addactivatedpin> {


  var userid;

  String? name;
  String? email;
  String? phone;
  String? profession;
  String? district;


  Future addactivepin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var reqData = {
      'name': name,
      'email': email,
      'phone':phone,
      'profession':profession,
      "district":district,
    };
    print(reqData);
    var response = await UserpinService.addactivepin(reqData);
    log.i('leave create . $response');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomTabsScreen()),
    );

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
        title: Text("Active Pin",style: TextStyle(color: bg1,fontSize: 16),),

      ),
      backgroundColor: sevensgbg,
      body: SingleChildScrollView(
        child: Column(

          children: [

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
                              name=text;
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
                          child: Text("Email",style: TextStyle(color: bg1),)),
                    ),

                    Container(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          autocorrect: true,
                          onChanged: (text) {
                            setState(() {
                              email=text;
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
                          child: Text("Phone Number ",style: TextStyle(color: bg1),)),
                    ),

                    Container(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          autocorrect: true,
                          onChanged: (text) {
                            setState(() {
                              phone=text;
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
                          child: Text("Profession",style: TextStyle(color: bg1),)),
                    ),

                    Container(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              profession=text;
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
                          child: Text("District",style: TextStyle(color: bg1),)),
                    ),

                    Container(
                      height: 40,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              district=text;
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


                    InkWell(
                      onTap: (){
                        addactivepin();
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