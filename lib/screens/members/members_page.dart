import 'package:flutter/material.dart';
import 'package:sevensquare/screens/members/widgets/add_members.dart';

import '../../resources/color.dart';

class memberspage extends StatefulWidget {
  const memberspage({super.key});

  @override
  State<memberspage> createState() => _memberspageState();
}

class _memberspageState extends State<memberspage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: sevensgbg,

      appBar: AppBar(
        backgroundColor: sevensgbg,
        title: Text("Member",style: TextStyle(color: bg1,fontSize: 18),),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 444,
                    height: 125,
                    // margin: EdgeInsets.all(10),
                    child: Column(
                      children: [


                        SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(

                            children: [
                              Text("Name",style: TextStyle(fontSize: 10,color: bg1,),),
                              SizedBox(width: 80,),
                              Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                              SizedBox(width: 5,),
                              Text("₹10000",style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),


                              SizedBox(width: 50,),

                              Container(
                                height: 18,
                                width: 75,
                                decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(child: Text("Users List",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600),)),
                              ),

                            ],
                          ),
                        ),

                        SizedBox(height: 5,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(

                            children: [
                              Text("Sponsor ID",style: TextStyle(fontSize: 10,color: bg1,),),
                              SizedBox(width: 54,),
                              Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                              SizedBox(width: 5,),
                              Text("₹10000",style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),
                              SizedBox(width: 50,),

                              Container(
                                height: 18,
                                width: 75,
                                decoration: BoxDecoration(
                                    border: Border.all(color: yellow),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(child: Text("Accepted",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: bg1),)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(

                            children: [
                              Text("Phone Number",style: TextStyle(fontSize: 10,color: bg1,),),
                              SizedBox(width: 35,),
                              Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                              SizedBox(width: 5,),
                              Text("₹10000",style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),


                            ],
                          ),
                        ),

                        SizedBox(height: 5,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(

                            children: [
                              Text("Package ",style: TextStyle(fontSize: 10,color: bg1,),),
                              SizedBox(width: 65,),
                              Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                              SizedBox(width: 5,),
                              Text("₹10000",style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),

                              SizedBox(width: 28,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text("November 09 10:30 PM",style: TextStyle(fontSize: 7,color: textgrey1),)),
                              )
                            ],
                          ),
                        ),


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
            }),
          ),

        ],
      ),

      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add),
        backgroundColor: yellow,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const addmembers()),
          );
        },
      ),

    );
  }
}
