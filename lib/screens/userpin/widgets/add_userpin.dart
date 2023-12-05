import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../navigation/bottom_tabs_screen.dart';
import '../../../resources/color.dart';
import '../../../services/members_service.dart';
import '../../../services/userpin_service.dart';
import '../../../support/logger.dart';

class adduserpin extends StatefulWidget {
  const adduserpin({super.key});

  @override
  State<adduserpin> createState() => _adduserpinState();
}

class _adduserpinState extends State<adduserpin> {


  var userid;
  var packages;
  var packagedropdownvalue;
  bool hidePassword = true;
  bool isButtonDisabled = true;
  List package = [];

  String? name;
  String? email;
  String? phone;
  String? address;
  String? password;



  Future addmember() async {
    setState(() {
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var reqData = {
      'name': name,
      'email': email,
      'phone':phone,
      'address':address,
      "password":password,
      "packageSelected":packagedropdownvalue['id'],
    };
    print(reqData);
    var response = await UserpinService.adduserpin(reqData);
    log.i('leave create . $response');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomTabsScreen()),
    );

  }


  Future _getpackages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await MembersService.membersPackages();
    log.i('Package list.. $response');
    setState(() {
      package = response['results'];
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getpackages();
  }



  void updateButtonState() {
    setState(() {
      isButtonDisabled = name == null ||
          email == null ||
          phone == null ||
          address == null ||
          password == null ||
          packagedropdownvalue == null;
    });
  }

  bool validateForm() {
    if (name == null || name!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid name'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    if (email == null ||
        !RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
            .hasMatch(email!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid email address'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    if (phone == null || phone!.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Phone number must be at least 10 numbers long'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    if (address == null || address!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid address'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    if (packagedropdownvalue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please choose a package'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    if (password == null || password!.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password must be at least 8 characters long'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    return true;
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
        title: Text("User Pin",style: TextStyle(color: bg1,fontSize: 16),),

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
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          cursorWidth: 1.0,
                          cursorColor: bg1,
                          cursorHeight: 12,
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
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          cursorWidth: 1.0,
                          cursorColor: bg1,
                          cursorHeight: 12,
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
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          cursorWidth: 1.0,
                          cursorColor: bg1,
                          cursorHeight: 12,
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
                          child: Text("Address",style: TextStyle(color: bg1),)),
                    ),

                    Container(
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              address=text;
                            });
                          },
                          autocorrect: true,
                          cursorWidth: 1.0,
                          cursorColor: bg1,
                          cursorHeight: 12,
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
                          child: Text("Choose Package ",style: TextStyle(color: bg1),)),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color:bg1 ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(

                                border: InputBorder.none,
                                hintText: 'Select Package',
                                hintStyle: TextStyle(fontSize: 12, color: bg1), // Remove underline
                              ),
                              isExpanded: true,
                              dropdownColor: sevensgbg,
                              icon: Icon(Icons.arrow_drop_down, color: Colors.white), // Change color to white
                              iconSize: 20,
                              elevation: 16,
                              style: TextStyle(color: bg1, fontSize: 15),
                              items: package.map((item) {
                                print(item);
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item['amount'].toString(),
                                    style: TextStyle(fontSize: 14),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newVal) {
                                setState(() {
                                  packagedropdownvalue = newVal;
                                });
                              },
                              value: packagedropdownvalue,
                            )

                        ),
                      ),
                    ),



                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Password",style: TextStyle(color: bg1),)),
                    ),

                    Container(
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          onChanged: (text) {
                            setState(() {
                              password=text;
                            });
                          },
                          autocorrect: true,
                          cursorWidth: 1.0,
                          cursorColor: bg1,
                          cursorHeight: 12,
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
                        addmember();
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
