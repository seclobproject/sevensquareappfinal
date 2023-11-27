import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sevensquare/screens/userpin/widgets/add_activatedpin.dart';
import 'package:sevensquare/screens/userpin/widgets/add_userpin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/color.dart';
import '../../services/userpin_service.dart';
import '../../support/logger.dart';
import '../members/widgets/activepin_listing.dart';
import '../members/widgets/userpin_listing.dart';

class userpin extends StatefulWidget {
  const userpin({super.key});

  @override
  State<userpin> createState() => _userpinState();
}

class _userpinState extends State<userpin> {

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: sevensgbg, // Replace with your color
        appBar: AppBar(
          backgroundColor: sevensgbg, // Replace with your color
          iconTheme: IconThemeData(
            color: Colors.black, // Replace with your color
          ),
          centerTitle: true,
          title: Text(
            "Activated Pin",
            style: TextStyle(color: bg1, fontSize: 16),
          ),
          elevation: 0,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.yellow, // Replace with your color
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("User pin", style: TextStyle(color: bg1)),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Activated Pin", style: TextStyle(color: bg1)),
                ),
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            // First tab content
            userpinlisting(),
            // Second tab content
            activepinlisting(),
          ],
        ),
      ),
    );
  }
}


