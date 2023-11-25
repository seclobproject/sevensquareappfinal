import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/color.dart';
import '../../services/userpin_service.dart';
import '../../support/logger.dart';

class userpin extends StatefulWidget {
  const userpin({super.key});

  @override
  State<userpin> createState() => _userpinState();
}

class _userpinState extends State<userpin> {


  var userpinlist;
  bool _isLoading = true;
  var userid;




  Future _userpin() async {
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
        _userpin(),
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
        body:   _isLoading
            ?  Center(
          child: SvgPicture.asset(
            'assets/svg/opsmsg.svg',
            height: 300,
          ),
        )
            : TabBarView(
          children: [
            // First tab content
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
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
                                    Container(
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
                                    Container(
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
                      );
                    },
                  ),
                ),
              ],
            ),
            // Second tab content
            Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 40),
                      child: Text("Name",style: TextStyle(color: blackgray,fontSize: 12),),
                    ),

                    Text(":  ",style: TextStyle(color: bg1),),


                    Text("Krishnakumar",style: TextStyle(color: bg1,fontSize: 12),),
                    Expanded(child: SizedBox()),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 18,
                        width: 65,
                        decoration: BoxDecoration(
                            border: Border.all(color: yellow),
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Center(child: Text("Activated ",style: TextStyle(color: bg1,fontSize: 8),)),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 42),
                      child: Text("Email",style: TextStyle(color: blackgray,fontSize: 12),),
                    ),

                    Text(":  ",style: TextStyle(color: bg1),),


                    Text("Seclobclt@gmail.com",style: TextStyle(color: bg1,fontSize: 12),),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 38),
                      child: Text("Phone",style: TextStyle(color: blackgray,fontSize: 12),),
                    ),

                    Text(":  ",style: TextStyle(color: bg1),),


                    Text("+99995444111",style: TextStyle(color: bg1,fontSize: 12),),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 12),
                      child: Text("Profession",style: TextStyle(color: blackgray,fontSize: 12),),
                    ),

                    Text(":  ",style: TextStyle(color: bg1),),

                    Text("Teacher",style: TextStyle(color: bg1,fontSize: 12),),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 32),
                      child: Text("District",style: TextStyle(color: blackgray,fontSize: 12),),
                    ),

                    Text(":  ",style: TextStyle(color: bg1),),


                    Text("Krishnakumar",style: TextStyle(color: bg1,fontSize: 12),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    thickness: 0.5,
                    color: bg1,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


