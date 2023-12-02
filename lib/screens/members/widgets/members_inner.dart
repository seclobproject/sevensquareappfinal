import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/color.dart';
import '../../../services/members_service.dart';
import '../../../support/logger.dart';

class membersinner extends StatefulWidget {
   membersinner({super.key,required this.id});

   String? id;

  @override
  State<membersinner> createState() => _membersinnerState();
}

class _membersinnerState extends State<membersinner> {
  String userId='';


  bool _isLoading = true;
  var bannerinnerpage;

  Future _bannerinner() async {
    _isLoading=true;
    setState(() {
    });
    bannerinnerpage=null;

    var response = await MembersService.memberslistinginner(userId);
    log.i('Product inner service. $response');
    setState(() {
      _isLoading = false;
      bannerinnerpage = response.data;
      print("ProductInnerpage....$bannerinnerpage");
    });
  }



  @override
  void initState() {
    userId=widget.id ??'';
    super.initState();
    _bannerinner();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sevensgbg,

      appBar: AppBar(
        backgroundColor: sevensgbg,
        iconTheme: IconThemeData(
          color:bg1, //change your color here
        ),
        centerTitle: true,
        title: Text("Members Inner",style: TextStyle(color: bg1,fontSize: 16),),

      ),

      body:_isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : bannerinnerpage['members'].isEmpty
          ?  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/nouser.png',
              height: 100,
            ),
            SizedBox(height: 10,),
            Text("No User Found !",style: TextStyle(color: bg1,fontSize: 20,fontWeight: FontWeight.w700),)
          ],
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: bannerinnerpage['members'].length,
                itemBuilder: (BuildContext context, int index) {
                  return  InkWell(
                    onTap: (){
                      userId=bannerinnerpage['members'][index]['_id'];
                      _bannerinner();
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20),
                      child: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Container(
                          width: 444,
                          // height: 125,
                          // margin: EdgeInsets.all(10),
                          child: Column(
                            children: [


                              SizedBox(height: 20,),

                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20),
                                child: Row(

                                  children: [
                                    Text('Name',style: TextStyle(fontSize: 10,color: bg1,),),
                                    SizedBox(width: 80,),
                                    Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                                    SizedBox(width: 5,),
                                    Container(
                                        width: 52,

                                        child: Text(bannerinnerpage['members'][index]['name'],style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),)),


                                    SizedBox(width: 50,),

                                    Container(
                                      height: 18,
                                      width: 75,
                                      decoration: BoxDecoration(
                                          color: yellow,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(child: Text(bannerinnerpage['members'][index]['userStatus'],style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),)),
                                    ),

                                  ],
                                ),
                              ),

                              SizedBox(height: 5,),

                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20),
                                child: Row(

                                  children: [
                                    Text("Sponsor ID",style: TextStyle(fontSize: 10,color: bg1,),),
                                    SizedBox(width: 54,),
                                    Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                                    SizedBox(width: 5,),
                                    Container(
                                        width: 120,
                                        child: Text(bannerinnerpage['members'][index]['ownSponserId'],
                                          style: TextStyle(color: bg1,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 11),
                                          overflow: TextOverflow.ellipsis, // Add this line
                                          maxLines: 1,
                                        )),
                                    SizedBox(width: 50,),

                                    // Container(
                                    //   height: 18,
                                    //   width: 75,
                                    //   decoration: BoxDecoration(
                                    //       border: Border.all(color: yellow),
                                    //       borderRadius: BorderRadius.circular(5)
                                    //   ),
                                    //   child: Center(child: Text(bannerinnerpage['members'][index]['userStatus'],style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: bg1),)),
                                    // ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),

                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20),
                                child: Row(

                                  children: [
                                    Text("Phone Number",style: TextStyle(fontSize: 10,color: bg1,),),
                                    SizedBox(width: 35,),
                                    Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                                    SizedBox(width: 5,),
                                    Text(bannerinnerpage['members'][index]['phone'].toString(),style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),


                                  ],
                                ),
                              ),

                              SizedBox(height: 5,),



                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20),
                                child: Row(

                                  children: [
                                    Text("Email ",style: TextStyle(fontSize: 10,color: bg1,),),
                                    SizedBox(width: 79,),
                                    Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                                    SizedBox(width: 5,),
                                    Text(bannerinnerpage['members'][index]['email'],style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),

                                    SizedBox(width: 28,),

                                  ],
                                ),
                              ),

                              SizedBox(height: 5,),

                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20),
                                child: Row(

                                  children: [
                                    Text("Package",style: TextStyle(fontSize: 10,color: bg1,),),
                                    SizedBox(width: 67,),
                                    Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                                    SizedBox(width: 5,),
                                    Text(bannerinnerpage['members'][index]['packageAmount'].toString(),style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),

                                    SizedBox(width: 28,),

                                  ],
                                ),
                              ),

                              SizedBox(height: 5,),

                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20),
                                child: Row(

                                  children: [
                                    Text("Address ",style: TextStyle(fontSize: 10,color: bg1,),),
                                    SizedBox(width: 65,),
                                    Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                                    SizedBox(width: 5,),
                                    Text(bannerinnerpage['members'][index]['address'],style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),

                                    SizedBox(width: 28,),
                                    // Padding(
                                    //   padding:  EdgeInsets.symmetric(horizontal: 10),
                                    //   child: Align(
                                    //       alignment: Alignment.bottomRight,
                                    //       child: Text("November 09 10:30 PM",style: TextStyle(fontSize: 7,color: textgrey1),)),
                                    // )
                                  ],
                                ),
                              ),

                              SizedBox(height: 20,),



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
                      ),
                    ),
                  );
                }),
          ),

        ],
      ),


    );
  }
}


