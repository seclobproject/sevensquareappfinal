import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../resources/color.dart';
import '../../../services/userpin_service.dart';
import '../../../support/logger.dart';
import '../../userpin/widgets/add_activatedpin.dart';
import '../../userpin/widgets/add_userpin.dart';

class userpinlisting extends StatefulWidget {
  const userpinlisting({super.key});

  @override
  State<userpinlisting> createState() => _userpinlistingState();
}

class _userpinlistingState extends State<userpinlisting> {


  var userpinlist;
  var activatedpinlist;
  bool _isLoading = true;
  var userid;


  Future userpin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await UserpinService.userpinlisting();
    log.i('user pin listing done. $response');
    setState(() {
      userpinlist = response.data;
    });
  }


  Future _initLoad() async {
    await Future.wait(
      [
        userpin(),
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
    return  Scaffold(
      backgroundColor: sevensgbg,
      body:   _isLoading
          ?  Center(
        child:CircularProgressIndicator()
      )
          :Column(
        children: [
      Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: 444,
        height: 125,
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total pins left",
                    style: TextStyle(fontSize: 14, color: bg1),
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  addactivatedpin()),
                      );
                    },
                    child: Container(
                      height: 18,
                      width: 75,
                      decoration: BoxDecoration(
                          color:yellow, borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Activate Pin",
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Versions of the Lorem ipsum text have been\nused in typesetting at least since the 1960s,\n",
                      style: TextStyle(fontSize: 10, color: bg1),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  adduserpin()),
                      );
                    },
                    child: Container(
                      height: 18,
                      width: 75,
                      decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Add user',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: bottomtacolor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Counts :",
                    style: TextStyle(fontSize: 14, color: bg1, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 10),
                  Text(
                    userpinlist['pinCount'].toString(),
                    style: TextStyle(fontSize: 16, color: greenbg),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: bottomtacolor, // Replace with your color
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
    ),
        ],
      ),
    );
  }
}
