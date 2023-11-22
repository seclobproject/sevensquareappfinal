import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../navigation/app_drawer.dart';
import '../../resources/color.dart';
import '../../services/home_service.dart';
import '../../support/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  bool _isLoading = true;
  var profilepageapi;

  var userid;


  Future profilepage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = (prefs.getString('userid') ?? "");
    print("userid....$userid");
    var response = await HomeService.GetProfile();
    log.i('Profile page. $response');

    setState(() {
      profilepageapi = response;
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initLoad();
  }

  Future _initLoad() async {
    await Future.wait(
      [
        profilepage()
      ],
    );
    _isLoading = false;
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: sevensgbg,
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      drawer: appdrawer(),

      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          :SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
                    },
                    child: SvgPicture.asset(
                      'assets/svg/drawrwhite.svg',
                      width: 17,
                      height: 17,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) =>  notification()),
                          // );
                        },
                        child: Center(
                          child: Stack(
                            children: [
                              Icon(
                                Icons.notifications_none_outlined,
                                color: bg1,
                                size: 26,
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(top: 3, left: 13),
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Center(
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.amber),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Text("Hello",style: TextStyle(color: yellow,fontSize: 32,fontWeight: FontWeight.w800),),
            Text(profilepageapi['name'],style: TextStyle(color: bg1,fontSize: 18,fontWeight: FontWeight.w400),),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Wallet",style: TextStyle(color: bg1,fontSize: 18,fontWeight: FontWeight.w600),)),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 100,
                width: 444,
                decoration: BoxDecoration(
                  color: bottomtacolor,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Wallet Amount",style: TextStyle(color: bg1),),
                              Text("Unrealized Amount",style: TextStyle(color: greenbg,fontSize: 10),),
                            ],
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("₹1000",style: TextStyle(color: bg1,fontSize: 18,fontWeight: FontWeight.w700),),
                              Align(

                                  child: Text("₹500",style: TextStyle(color: greenbg,fontSize: 18,fontWeight: FontWeight.w700,),)),
                            ],
                          )),


                      



                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 100,
                width: 444,
                decoration: BoxDecoration(
                    color: bottomtacolor,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Verification pending",style: TextStyle(color: redbtm,fontSize: 17,fontWeight: FontWeight.w600),),
                              Icon(Icons.access_time,color: redbtm,size: 17,),
                              Container(
                                height: 30,
                                width: 65,
                                decoration: BoxDecoration(
                                    color: redbtm,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Center(child: Text("Verify Now",style: TextStyle(color: bg1,fontSize: 8),)),
                              )
                            ],
                          )),

                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset('assets/logo/graph2.png',
              height: 400,
              ),
            )
          ],
        ),
      ),

    );
  }
}
