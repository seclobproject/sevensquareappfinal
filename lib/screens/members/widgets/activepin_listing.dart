import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../resources/color.dart';
import '../../../services/userpin_service.dart';
import '../../../support/logger.dart';

class activepinlisting extends StatefulWidget {
  const activepinlisting({super.key});

  @override
  State<activepinlisting> createState() => _activepinlistingState();
}

class _activepinlistingState extends State<activepinlisting> {


  var userpinlist;
  var activatedpinlists;
  bool _isLoading = true;
  var userid;



  Future _Activatedpin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await UserpinService.activatedpinlisting();
    log.i('user pin listing done. $response');
    setState(() {
      activatedpinlists = response;

    });
  }


  Future _initLoad() async {
    await Future.wait(
      [
        _Activatedpin()
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
    return Scaffold(
      backgroundColor: sevensgbg,
      body:   _isLoading
          ?  Center(
          child:CircularProgressIndicator()
      )
          :Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: activatedpinlists['activatedPins'].length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    width: 444,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20,right: 40),
                              child: Text("Name",style: TextStyle(color: blackgray,fontSize: 12),),
                            ),

                            Text(":  ",style: TextStyle(color: bg1),),


                            Text(activatedpinlists['activatedPins'][0]['name'],style: TextStyle(color: bg1,fontSize: 12),),
                            Expanded(child: SizedBox()),

                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20,right: 42),
                              child: Text("Email",style: TextStyle(color: blackgray,fontSize: 12),),
                            ),

                            Text(":  ",style: TextStyle(color: bg1),),


                            Text(activatedpinlists['activatedPins'][0]['email'],style: TextStyle(color: bg1,fontSize: 12),),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20,right: 38),
                              child: Text("Phone",style: TextStyle(color: blackgray,fontSize: 12),),
                            ),

                            Text(":  ",style: TextStyle(color: bg1),),


                            Text(activatedpinlists['activatedPins'][0]['phone'].toString(),style: TextStyle(color: bg1,fontSize: 12),),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20,right: 12),
                              child: Text("Profession",style: TextStyle(color: blackgray,fontSize: 12),),
                            ),

                            Text(":  ",style: TextStyle(color: bg1),),

                            Text(activatedpinlists['activatedPins'][0]['profession'],style: TextStyle(color: bg1,fontSize: 12),),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20,right: 32),
                              child: Text("District",style: TextStyle(color: blackgray,fontSize: 12),),
                            ),

                            Text(":  ",style: TextStyle(color: bg1),),


                            Text(activatedpinlists['activatedPins'][0]['district'],style: TextStyle(color: bg1,fontSize: 12),),
                          ],
                        ),
                        SizedBox(height: 20,)
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
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}
