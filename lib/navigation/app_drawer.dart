import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../authentication_page/login.dart';
import '../commonpage/profilepage.dart';
import '../commonpage/withdrawal.dart';
import '../resources/color.dart';

class appdrawer extends StatefulWidget {
  const appdrawer({super.key});

  @override
  State<appdrawer> createState() => _appdrawerState();
}

class _appdrawerState extends State<appdrawer> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: bottomtacolor,
      width: 220,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          SizedBox(height: 100,),

          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const profilepage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/profile.svg',
                      fit: BoxFit.cover,
                    ),

                    SizedBox(width: 25,),

                    Text('Profile',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: bg1),)
                  ],
                ),
              ),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const withdrawal()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/withdrawal.svg',
                      fit: BoxFit.cover,
                    ),

                    SizedBox(width: 25,),

                    Text('Withdrawal',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: bg1),)
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/slaryaccount.svg',
                    fit: BoxFit.cover,
                  ),

                  SizedBox(width: 25,),

                  Text('Salary Account ',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: bg1),)
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/bank.svg',
                    fit: BoxFit.cover,
                  ),

                  SizedBox(width: 25,),

                  Text('Bank Details',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: bg1),)
                ],
              ),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => loginpage()),
                      (route) => false);
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

                    SizedBox(width: 25,),

                    Text('Logout',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: bg1),)
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


