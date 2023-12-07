import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../navigation/bottom_tabs_screen.dart';
import '../../../resources/color.dart';
import '../../../services/members_service.dart';
import '../../../services/userpin_service.dart';
import '../../../support/logger.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';

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
  bool isLoading = false;

  String? name;
  String? email;
  String? phone;
  String? address;
  String? password;

  Country? selectedCountry;



  // Future addmember() async {
  //   setState(() {
  //   });
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   userid = prefs.getString('userid');
  //   var reqData = {
  //     'name': name,
  //     'email': email,
  //     'phone':phone,
  //     'address':address,
  //     "password":password,
  //     "packageSelected":packagedropdownvalue['id'],
  //   };
  //   print(reqData);
  //   var response = await UserpinService.adduserpin(reqData);
  //   log.i('leave create . $response');
  //
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => BottomTabsScreen()),
  //   );
  //
  // }


  Future addmember() async {
    try {
      setState(() {});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userid = prefs.getString('userid');
      var reqData = {
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        "password": password,
        "packageChosen": packagedropdownvalue!['id'],
      };

      var response = await MembersService.addmember(reqData);
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

                    // Container(
                    //   height: 60,
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 20),
                    //     child: TextField(
                    //       cursorWidth: 1.0,
                    //       cursorColor: bg1,
                    //       cursorHeight: 12,
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
                      onTap: () {
                        if (validateForm()) {
                          // Set isLoading to true to show the loader
                          setState(() {
                            isLoading = true;
                          });

                          // Perform your asynchronous operation, for example, createleave()
                          addmember().then((result) {
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
