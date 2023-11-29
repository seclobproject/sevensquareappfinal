import 'package:flutter/material.dart';
import 'package:sevensquare/authentication_page/package_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../navigation/bottom_tabs_screen.dart';
import '../resources/color.dart';
import '../services/login_service.dart';
import '../support/logger.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  bool hidePassword = true;
  String? email;
  String? password;
  bool isLoading = false;
  bool _isLoader = false;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();



  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    var reqData = {
      'email': email,
      'password': password,
    };
    try {

      var response = await LoginService.login(reqData);

      if (response['sts'] == '01') {
        log.i('Login Success');
        print('User ID: ${response['_id']}');
        print('Token: ${response['access_token']}');

        // _saveAndRedirectToHome(response['access_token'], response['name']);
        _saveAndRedirectToHome(response['access_token'],response['_id']);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login Success'),
        ));
        gotoHome();
      }

      else {
        // log.e('Login failed: ${response['msg']}');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login failed: ${response['msg']}'),
        ));

        loginpage();
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
        _isLoader = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Incorrect Username and password   '),
      ));
      log.e('Error during login: $error');
    }
  }




  void _saveAndRedirectToHome(usertoken, userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", usertoken);
    await prefs.setString("userid", userId);
  }

  gotoHome() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => BottomTabsScreen()),
            (route) => false);
  }



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
                onChanged: (text) {
                  setState(() {
                    email = text;
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
                child: Text("Password ",style: TextStyle(color: bg1),)),
          ),

          Container(
            height: 55,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                autocorrect: true,
                style: TextStyle(color: Colors.white),
                obscureText: hidePassword, //show/hide password
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: bg1, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
              _login();
              _isLoader = true;
              // Navigator.of(context).pushAndRemoveUntil;
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
