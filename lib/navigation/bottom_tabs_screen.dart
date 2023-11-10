import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/color.dart';
import '../screens/home/home_page.dart';
import '../screens/members/members_page.dart';
import '../screens/package/package_page.dart';
import '../screens/userpin/userpin_page.dart';
import '../screens/wallet/wallet_page.dart';
import 'app_drawer.dart';

class BottomTabsScreen extends StatefulWidget {
  const BottomTabsScreen({Key? key}) : super(key: key);

  @override
  State<BottomTabsScreen> createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  int _selectedPageIndex = 0;

  void callback() {
    print("callback");
  }

  final List<Map<String, Object>> _pages = [
    {'page': home(), 'title': 'Home'},
    {'page': package(), 'title': 'PACKAGE'},
    {'page': memberspage(), 'title': 'MEMBERS'},
    {'page': userpin(), 'title': 'USERPIN'},
    {'page': wallet(), 'title': 'ACCOUNT'},
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Map<String, Object> get currentPage {
    return _pages[_selectedPageIndex];
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: sevensgbg,
      // appBar: AppBarStyle1(title: currentPage['title'] as String),

      body: currentPage['page'] as Widget,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white, // Change the shadow color as needed
                blurRadius: 5.0, // Adjust the blur radius
                spreadRadius: 5, // Adjust the spread radius
                offset: Offset(0, 3), // Adjust the shadow offset
              ),
            ],
          ),
          // Adjust the radius as needed
          child: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            selectedItemColor: redbtm,
            backgroundColor: bottomtacolor,
            onTap: _selectPage,
            currentIndex: _selectedPageIndex,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SvgPicture.asset(
                    "assets/svg/homebtn.svg",
                    color: (_selectedPageIndex == 0) ? redbtm : null,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SvgPicture.asset(
                    "assets/svg/packagebtm.svg",
                    color: (_selectedPageIndex == 1) ? redbtm : null,
                  ),
                ),
                label: 'Package ',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SvgPicture.asset(
                    "assets/svg/memberbtm.svg",
                    color: (_selectedPageIndex == 2) ? redbtm : null,
                  ),
                ),
                label: 'Member',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SvgPicture.asset(
                    "assets/svg/userpinbtn.svg",
                    color: (_selectedPageIndex == 3) ? redbtm : null,
                  ),
                ),
                label: 'User Pin ',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SvgPicture.asset(
                    "assets/svg/walletbtm.svg",
                    color: (_selectedPageIndex == 4) ? redbtm : null,
                  ),
                ),
                label: 'Wallet',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
