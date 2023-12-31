import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/color.dart';
import '../../services/packageService.dart';
import '../../services/userpin_service.dart';
import '../../support/logger.dart';

class package extends StatefulWidget {
  const package({super.key});

  @override
  State<package> createState() => _packageState();
}

class _packageState extends State<package> {


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
    return  Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        title: Text("Package",style: TextStyle(color: bg1,fontSize: 18),),
      ),
      body:_isLoading
          ? Center(
        child:CircularProgressIndicator()
      )
          :  Column(
        children: [
          package['userStatus']== "approved" ?
          Expanded(
            child: ListView.builder(
                itemCount: package['results'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Container(
                      width: 444,

                      // margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: yellow,
                                borderRadius: BorderRadius.all(Radius.circular(10
                                ))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Package Name',style: TextStyle(fontSize: 11,color: Colors.black),),
                                    SizedBox(width: 15,),
                                    Text('Amount',style: TextStyle(fontSize: 11,color: Colors.black),),
                                    SizedBox(width: 15,),
                                    Text('Amount Ex.GST',style: TextStyle(fontSize: 11,color:Colors.black),),
                                    SizedBox(width: 15,),
                                    Text('Type',style: TextStyle(fontSize: 11,color:Colors.black),),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              color: bg1,
                              thickness: 0.1,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(package['results'][index]['packageName'],style: TextStyle(fontSize: 10,color: bg1,),),
                                Text(package['results'][index]['amount'].toString(),style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),
                                Text(package['results'][index]['amountExGST'].toString(),style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),
                                Text(package['results'][index]['schemeType'],style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),
                              ],
                            ),
                          ),

                          SizedBox(height: 10,),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Text("Users' Count",style: TextStyle(color: textgrey1,fontSize: 10)),
                                    SizedBox(width: 30,),
                                    Text(":",style: TextStyle(color: textgrey1,fontSize: 10)),
                                    SizedBox(width: 10,),
                                    Text(package['results'][index]['usersCount'].toString(),style: TextStyle(color: bg1,fontSize: 10,fontWeight: FontWeight.w600)),
                                  ],
                                )),
                          ),
                          SizedBox(height: 5,),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    Text("Addon Users",style: TextStyle(color: textgrey1,fontSize: 10)),
                                    SizedBox(width: 30,),
                                    Text(":",style: TextStyle(color: textgrey1,fontSize: 10)),
                                    SizedBox(width: 10,),
                                    Text(package['results'][index]['addOnUsers'].toString(),style: TextStyle(color: bg1,fontSize: 10,fontWeight: FontWeight.w600)),
                                  ],
                                )),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text("November 09 10:30 PM",style: TextStyle(fontSize: 10,color: textgrey1),)),
                          ),
                          SizedBox(height: 10,),


                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: bottomtacolor,
                          border: Border.all(
                            color: blackgray,
                            width: 1,
                          )),

                    ),
                  );
                }),
          ):
          package['userStatus'] == "pending" ?

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 150),
            child: Center(
              child:  Column(
                children: [
                  SvgPicture.asset(
                    'assets/svg/noactivation.svg',
                    height: 200,
                  ),
                  SizedBox(height: 10,),

                  Text("Activation\nPending..!!",
                    style: TextStyle(color: bg1,fontSize: 25,fontWeight: FontWeight.w700),)
                ],
              ),
            ),
          ) :


          Padding(
            padding: const EdgeInsets.symmetric(vertical: 150),
            child: Center(
              child: SvgPicture.asset(
                'assets/svg/opsmsg.svg',
                height: 250,
              ),
            ),
          ),

        ],
      ),

    );
  }
}
