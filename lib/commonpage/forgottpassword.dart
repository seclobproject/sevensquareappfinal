import 'package:flutter/material.dart';
import 'package:sevensquare/resources/color.dart';
import 'package:sevensquare/screens/wallet/wallet_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../navigation/bottom_tabs_screen.dart';
import '../services/password_service.dart';
import '../support/logger.dart';

class forgottpassword extends StatefulWidget {
  const forgottpassword({super.key});

  @override
  State<forgottpassword> createState() => _forgottpasswordState();
}

class _forgottpasswordState extends State<forgottpassword> {


  String? password;
  var userid;
  bool hidePassword = true;


  Future changepassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var reqData = {
      "password": password,
    };
    print(reqData);

    try {
      var response = await PasswordService.changepassword(reqData);

      if (response['sts'] == '01') {
        // Show a success message using SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response['msg'] ?? 'Password changed successfully'),
            duration: Duration(seconds: 2),
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomTabsScreen()),
        );

        log.i('Password changed successfully. $response');
      } else {
        // Show a failure message using SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response['msg'] ?? 'Password change failed'),
            duration: Duration(seconds: 2),
          ),
        );

        log.i('Password change failed. $response');
      }
    } catch (error) {
      // Handle any exceptions that might occur during the API call
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during password change'),
          duration: Duration(seconds: 2),
        ),
      );

      log.e('Error during password change. $error');
    }

    // If you want to navigate to another screen after password change, uncomment the following lines
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => wallet()),
    // );
  }




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
            height: 50,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                autocorrect: true,
                style: TextStyle(color: Colors.white),
                obscureText: hidePassword, //show/hide password
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: bg1, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: bg1),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: hidePassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                ),

                onChanged: (text) {
                  setState(() {
                    password = text;
                  });
                },
              ),

            ),
          ),
          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("Confirm Password ",style: TextStyle(color: bg1),)),
          ),

          Container(
            height: 50,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                autocorrect: true,
                style: TextStyle(color: Colors.white),
                obscureText: hidePassword, //show/hide password
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: bg1, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: bg1),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: hidePassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                ),

                onChanged: (text) {
                  setState(() {
                    password = text;
                  });
                },
              ),

            ),
          ),

          SizedBox(height: 40,),

          GestureDetector(
            onTap: (){
              changepassword();
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
