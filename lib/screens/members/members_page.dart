import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sevensquare/screens/members/widgets/add_members.dart';
import 'package:sevensquare/screens/members/widgets/members_inner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../resources/color.dart';
import '../../services/members_service.dart';
import '../../services/userpin_service.dart';
import '../../support/logger.dart';

class memberspage extends StatefulWidget {
  const memberspage({super.key});

  @override
  State<memberspage> createState() => _memberspageState();
}

class _memberspageState extends State<memberspage> {


  var memberslisting;
  bool _isLoading = true;
  var userid;
  var activatedpinlist;




  Future _membersListig() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await MembersService.memberslisting();
    log.i('members listing done. $response');
    memberslisting = response.data;
    setState(() {

      print(memberslisting['userStatus']);
    });
  }


  Future _initLoad() async {
    await Future.wait(
      [
        _membersListig(),

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
        title: Text("Member", style: TextStyle(color: bg1, fontSize: 18)),
      ),
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : (memberslisting['userStatus'] == "pending" && memberslisting['result'].isEmpty)
          ? Center(
        child: Column(
          children: [
            SizedBox(height: 150,),
            SvgPicture.asset(
              'assets/svg/noactivation.svg',
              height: 200,
            ),
            SizedBox(height: 10,),

            Text("Activation\nPending..!!",
              style: TextStyle(color: bg1,fontSize: 25,fontWeight: FontWeight.w700),)
          ],
        ),
      )
          : (memberslisting['userStatus'] == "pending")
          ? Center(
        child: Text(
          "User status is pending.",
          style: TextStyle(color: Colors.red),
        ),
      )
          : (memberslisting['result'].isEmpty)
          ? Center(
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
              itemCount: memberslisting['result'].length,
              itemBuilder: (BuildContext context, int index) {
                return membersLiting(
                  id: memberslisting['result'][index]['_id'],
                  name: memberslisting['result'][index]['name'],
                  sponser: memberslisting['result'][index]['sponserId'],
                  phone: memberslisting['result'][index]['phone'].toString(),
                  status: memberslisting['result'][index]['userStatus'],
                  packageamount: memberslisting['result'][index]['packageAmount'].toString(),
                  email: memberslisting['result'][index]['email'],
                  address: memberslisting['result'][index]['address'],
                );
              },
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add),
        backgroundColor: yellow,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMembers()),
          );
        },
      ),
    );








  }
}

class membersLiting extends StatelessWidget {
  const membersLiting({
    required this.name,
    required this.sponser,
    required this.phone,
    required this.status,
    // required this.package,
    required this.id,
    required this.email,
    required this.packageamount,
    required this.address,
    super.key,

  });

  final String name;
  final String sponser;
  final String phone;
  final String status;
  // final String package;
  final String id;
  final String email;
  final String packageamount;
  final String address;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => membersinner(id: id,)),
        );

      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
                    Text("Name",style: TextStyle(fontSize: 10,color: bg1,),),
                    SizedBox(width: 80,),
                    Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                    SizedBox(width: 5,),
                    Container(
                        width: 52,

                        child: Text(name,style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),)),
                    SizedBox(width: 50,),

                    Container(
                      height: 18,
                      width: 65,
                      decoration: BoxDecoration(
                          border: Border.all(color: yellow),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(child: Text(status,style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: bg1),)),
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
                        width: 150,
                        child: Text(sponser,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: bg1,fontWeight: FontWeight.w600,
                            fontSize: 11),

                        )),
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
                    Text(phone,style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),


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
                    Text(email,style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),

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
                    Text(packageamount,style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),

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
                    Text(address,style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),

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
    );
  }
}




