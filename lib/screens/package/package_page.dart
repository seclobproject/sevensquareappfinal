import 'package:flutter/material.dart';

import '../../resources/color.dart';

class package extends StatefulWidget {
  const package({super.key});

  @override
  State<package> createState() => _packageState();
}

class _packageState extends State<package> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        title: Text("Package",style: TextStyle(color: bg1,fontSize: 18),),
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 444,
              height: 125,
              // margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Package Name',style: TextStyle(fontSize: 11,color: Colors.white),),
                        SizedBox(width: 15,),
                        Text('Amount',style: TextStyle(fontSize: 11,color: Colors.white),),
                        SizedBox(width: 15,),
                        Text('Amount Ex.GST',style: TextStyle(fontSize: 11,color: Colors.white),),
                        SizedBox(width: 15,),
                        Text('Type',style: TextStyle(fontSize: 11,color: Colors.white),),
                      ],
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
                        Text("Package 01",style: TextStyle(fontSize: 10,color: bg1,),),
                        Text("₹10000",style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),
                        Text("₹800",style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),
                        Text("Staff",style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),
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
                            Text("10",style: TextStyle(color: bg1,fontSize: 10,fontWeight: FontWeight.w600)),
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
                            Text("10",style: TextStyle(color: bg1,fontSize: 10,fontWeight: FontWeight.w600)),
                          ],
                        )),
                  ),   
                
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text("November 09 10:30 PM",style: TextStyle(fontSize: 10,color: textgrey1),)),
                  )
                
                
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



        ],
      ),

    );
  }
}
