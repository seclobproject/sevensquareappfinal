import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../navigation/bottom_tabs_screen.dart';
import '../../../resources/color.dart';
import '../../../services/userpin_service.dart';
import '../../../support/logger.dart';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';

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
  bool isLoading = false;
  bool isButtonDisabled = true;
  Country? selectedCountry;


  // Future addactivepin() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   userid = prefs.getString('userid');
  //   var reqData = {
  //     'name': name,
  //     'email': email,
  //     'phone':phone,
  //     'profession':profession,
  //     "district":district,
  //   };
  //   print(reqData);
  //   var response = await UserpinService.addactivepin(reqData);
  //   log.i('leave create . $response');
  //
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => BottomTabsScreen()),
  //   );
  //
  // }

  Future addactivepin() async {
    try {
      setState(() {});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');
      var reqData = {
        'name': name,
        'email': email,
        'phone': phone,
        'profession': profession,
        "district":district,
      };

      var response = await UserpinService.addactivepin(reqData);
      log.i('leave create . $response');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomTabsScreen()),
      );
    } catch (error) {
      // Handle specific error cases
      if (error.toString().contains("User already exists!")) {
        // Show a SnackBar or AlertDialog to inform the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User already exists!'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        // Handle other errors or rethrow them if not handled here
        throw ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User already exists!'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }



  void updateButtonState() {
    setState(() {
      isButtonDisabled =
          name == null ||
          email == null ||
          phone == null ||
          profession == null ||
          district == null;
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

    if (profession == null || profession!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a  profession'),
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }

    if (district == null || district!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a  district'),
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
                      height: 60,
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
                      height: 60,
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

                    // Container(
                    //   height: 60,
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 20),
                    //     child: TextField(
                    //       autocorrect: true,
                    //       onChanged: (text) {
                    //         setState(() {
                    //           phone=text;
                    //         });
                    //       },
                    //       style: TextStyle(
                    //           color: Colors.white),
                    //       decoration: InputDecoration(
                    //         hintText: '',
                    //         hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
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

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: bg1, // Set your desired border color here
                          width: 1.0, // Set your desired border width here
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)), // Set your desired border radius here
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            CountryPickerDropdown(
                              iconEnabledColor: bg1,
                              dropdownColor: sevensgbg,
                              iconSize: 20,
                              initialValue: 'IN',
                              itemBuilder: (Country country) {
                                return Row(
                                  children: <Widget>[
                                    CountryPickerUtils.getDefaultFlagImage(country),
                                    SizedBox(width: 8.0),
                                    Text(
                                      "+${country.phoneCode}",
                                      style: TextStyle(fontSize: 12, color: Colors.white), // Change text color here
                                    ),
                                  ],
                                );
                              },
                              onValuePicked: (Country country) {
                                setState(() {
                                  selectedCountry = country;
                                });
                              },
                            ),

                            Expanded(
                              child: TextField(
                                autocorrect: true,
                                cursorWidth: 1.0,
                                cursorColor: bg1,
                                cursorHeight: 12,
                                keyboardType: TextInputType.number,
                                onChanged: (text) {
                                  setState(() {
                                    phone = text;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none, // Remove the underline border
                                ),
                                style: TextStyle(color: bg1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Profession",style: TextStyle(color: bg1),)),
                    ),

                    Container(
                      height: 60,
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
                      height: 60,
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
                      onTap: () {
                        if (validateForm()) {
                          // Set isLoading to true to show the loader
                          setState(() {
                            isLoading = true;
                          });

                          // Perform your asynchronous operation, for example, createleave()
                          addactivepin().then((result) {
                            // After the operation is complete, set isLoading to false
                            setState(() {
                              isLoading = false;
                            });
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Stack(
                          children: [
                            Container(
                              height: 40,
                              width: 444,
                              decoration: BoxDecoration(
                                color: yellow,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Center(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: sevensgbg,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            // Loader widget
                            // if (isLoading)
                            //   Positioned.fill(
                            //     child: Container(
                            //       decoration: BoxDecoration(
                            //         color: Colors.black.withOpacity(0.5),
                            //         borderRadius: BorderRadius.all(Radius.circular(10)),
                            //       ),
                            //       child: Center(
                            //         child: CircularProgressIndicator(
                            //           color: bg1,
                            //           valueColor: AlwaysStoppedAnimation<Color>(sevensgbg),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                          ],
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
