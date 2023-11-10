import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resources/color.dart';

class wallet extends StatefulWidget {
  const wallet({super.key});

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: sevensgbg,
        title: Text("User Pin",style: TextStyle(color: bg1,fontSize: 18),),
      ),

      backgroundColor: sevensgbg,

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 150,
              width: 444,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: blackgray,
                    width: 1,
                  ),
                  color: walletinner,
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

                    SizedBox(height: 15,),

                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Please meet the criteria to access the unrealized amount in your wallet.",
                          style: TextStyle(fontSize: 12,color: bg1),)),

                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 25,),
          
          
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Transaction",
                  style: TextStyle(color: bg1,fontWeight: FontWeight.w700),),
                Text("View all",style: TextStyle(color: yellow,fontWeight: FontWeight.w400)),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(thickness: 0.1,color: bg1,),
          ),


          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical:5,horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(

                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: yellow,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Image.asset(
                                "assets/logo/trnss.png",
                                height: 20,
                                width: 20,
                              ),
                            ),

                            SizedBox(width: 10,),



                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Referral Id ",style: TextStyle(color:bg1,fontSize: 10),),
                                Text("Name",style: TextStyle(color:bg1,fontSize: 10),),
                              ],
                            ),
                            Expanded(child: SizedBox()),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text("₹500",style: TextStyle(
                                  color:bg1,fontSize: 12,fontWeight: FontWeight.w800),),
                            ),

                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("26 October 2023 10:30 PM",style: TextStyle(fontSize: 8,color: bg1),),

                        Divider(thickness: 0.1,color: bg1,),

                      ],
                    ),
                  );
                }),
          ),


        ],
      ),

    );
  }
}

