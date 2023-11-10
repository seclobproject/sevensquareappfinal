import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      width: 240,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          SizedBox(height: 50,),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape:BoxShape.circle,
              color:gradient1
            ),
            child: Image.network('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
          ),

          SizedBox(height: 20,),

          Center(child: Text('Sharankrishna Vp',style: TextStyle(fontSize:16,fontWeight: FontWeight.w500),)),

          Center(child: Text('9745640896',style: TextStyle(fontSize:14,fontWeight: FontWeight.w400),)),

          SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:greycolor,

                boxShadow: const [
                  BoxShadow(
                      color: Colors.black54, // shadow color
                    blurRadius: 1, // shadow radius
                    offset: Offset(0, 1), // shadow offset
                      spreadRadius:
                      0, // The amount the box should be inflated prior to applying the blur
                      // set blur style
                  ),
                ],

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/history.svg',
                      fit: BoxFit.scaleDown,
                    ),

                    SizedBox(width: 25,),

                    Text('History',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:greycolor,

                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54, // shadow color
                    blurRadius: 0, // shadow radius
                    offset: Offset(0, 0), // shadow offset
                    spreadRadius:
                    0, // The amount the box should be inflated prior to applying the blur
                    // set blur style
                  ),
                ],

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/wallet.svg',
                      fit: BoxFit.scaleDown,
                    ),

                    SizedBox(width: 25,),

                    Text('Wallet',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:greycolor,

                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54, // shadow color
                    blurRadius: 0, // shadow radius
                    offset: Offset(0, 0), // shadow offset
                    spreadRadius:
                    0, // The amount the box should be inflated prior to applying the blur
                    // set blur style
                  ),
                ],

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/calldrawer.svg',
                      fit: BoxFit.scaleDown,
                    ),

                    SizedBox(width: 25,),

                    Text('Contact Us',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:greycolor,

                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54, // shadow color
                    blurRadius: 0, // shadow radius
                    offset: Offset(0, 0), // shadow offset
                    spreadRadius:
                    0, // The amount the box should be inflated prior to applying the blur
                    // set blur style
                  ),
                ],

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/aboutus.svg',
                      fit: BoxFit.scaleDown,
                    ),

                    SizedBox(width: 25,),

                    Text('About us',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:greycolor,

                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54, // shadow color
                    blurRadius: 0, // shadow radius
                    offset: Offset(0, 0), // shadow offset
                    spreadRadius:
                    0, // The amount the box should be inflated prior to applying the blur
                    // set blur style
                  ),
                ],

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/terms.svg',
                      fit: BoxFit.scaleDown,
                    ),

                    SizedBox(width: 25,),

                    Text('Terms & conditions',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:greycolor,

                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54, // shadow color
                    blurRadius: 0, // shadow radius
                    offset: Offset(0, 0), // shadow offset
                    spreadRadius:
                    0, // The amount the box should be inflated prior to applying the blur
                    // set blur style
                  ),
                ],

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/privacy.svg',
                      fit: BoxFit.scaleDown,
                    ),

                    SizedBox(width: 25,),

                    Text('Privacy policy',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:greycolor,

                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54, // shadow color
                    blurRadius: 0, // shadow radius
                    offset: Offset(0, 0), // shadow offset
                    spreadRadius:
                    0, // The amount the box should be inflated prior to applying the blur
                    // set blur style
                  ),
                ],

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/logout.svg',
                      fit: BoxFit.scaleDown,
                    ),

                    SizedBox(width: 25,),

                    Text('Logout',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),)
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


