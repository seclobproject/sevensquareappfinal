import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../navigation/bottom_tabs_screen.dart';
import '../resources/color.dart';

class popuppage extends StatefulWidget {
  const popuppage({super.key});

  @override
  State<popuppage> createState() => _popuppageState();
}

class _popuppageState extends State<popuppage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: sevensgbg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/svg/opsmsg.svg',
              width: 150, // Set the desired width
              height: 150, // Set the desired height
            ),
          ),
          
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomTabsScreen()));
            },
            child: Text('Activation\nPending..!!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700),),
          )

        ],
      ),
    );
  }
}
