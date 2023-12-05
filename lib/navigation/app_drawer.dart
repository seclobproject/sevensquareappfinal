import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../authentication_page/login.dart';
import '../commonpage/bankdetails.dart';
import '../commonpage/bankdetails_show.dart';
import '../commonpage/company_bank_details.dart';
import '../commonpage/profilepage.dart';

import '../commonpage/salaryaccount.dart';
import '../commonpage/withdrawal.dart';
import '../resources/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/packageService.dart';
import '../support/logger.dart';
class appdrawer extends StatefulWidget {
  const appdrawer({super.key});

  @override
  State<appdrawer> createState() => _appdrawerState();
}

class _appdrawerState extends State<appdrawer> {

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => loginpage()),
    );
  }


  var userid;

  var package;
  bool _isLoading = true;



  Future _getpackages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await PackageService.Packages();
    log.i('Package list.. $response');
    setState(() {
      package = response;
    });
  }



  Future _initLoad() async {
    await Future.wait(
      [
        _getpackages()
      ],
    );
    _isLoading = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _initLoad();
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: bottomtacolor,
      width: 240,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 100,),


      package != null && package['userStatus'] == "pending"
          ? IgnorePointer(
        ignoring: true,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const profilepage()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/profile.svg',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 15,),
                  Text('Profile', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: textColor1),)
                ],
              ),
            ),
          ),
        ),
      )
          : InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const profilepage()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/profile.svg',
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 15,),
                Text('Profile', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: bg1),)
              ],
            ),
          ),
        ),
      ),



      SizedBox(height: 10,),


          package != null && package['userStatus'] == "pending"
              ? IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const withdrawal()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/withdrawal.svg',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 15,),
                      Text('Withdrawal', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: textColor1),)
                    ],
                  ),
                ),
              ),
            ),
          ): InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const withdrawal()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/withdrawal.svg',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 15,),
                    Text('Withdrawal', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: bg1),)
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 10,),


          package != null && package['userStatus'] == "pending"
              ? IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const salarysccount()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/slaryaccount.svg',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 15,),
                      Text('Salary Account', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: textColor1),)
                    ],
                  ),
                ),
              ),
            ),
          ): InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const salarysccount()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/slaryaccount.svg',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 15,),
                    Text('Salary Account', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: bg1),)
                  ],
                ),
              ),
            ),
          ),



          SizedBox(height: 10,),


          package != null && package['userStatus'] == "pending"
              ? IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const bankaccount()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/bank.svg',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 15,),
                      Text('Bank Details', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: textColor1),)
                    ],
                  ),
                ),
              ),
            ),
          ): InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const banketailslist()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/bank.svg',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 15,),
                    Text('Bank Details', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: bg1),)
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 10,),



          package != null && package['userStatus'] == "pending"
              ? IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const companybankdetails()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/refaral.svg',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 15,),
                      Text('Company Bank Details', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: textColor1),)
                    ],
                  ),
                ),
              ),
            ),
          ): InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const companybankdetails()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/refaral.svg',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 15,),
                    Text('Company Bank Details', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: bg1),)
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              logout();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/logout.svg',
                      fit: BoxFit.cover,
                    ),

                    SizedBox(width: 15,),

                    Text('Logout',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: bg1),)
                  ],
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}


