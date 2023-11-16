import 'package:flutter/material.dart';

import '../../resources/color.dart';

class userpin extends StatefulWidget {
  const userpin({super.key});

  @override
  State<userpin> createState() => _userpinState();
}

class _userpinState extends State<userpin> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: sevensgbg,
          appBar: AppBar(
            backgroundColor: sevensgbg,
            iconTheme: IconThemeData(
              color:bg1, //change your color here
            ),
            centerTitle: true,
            title: Text("Activated Pin",style: TextStyle(color: bg1,fontSize: 16),),

            elevation: 0,
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: yellow,

                tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("User pin",style: TextStyle(color: bg1),),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Activated Pin",style: TextStyle(color: bg1),),
                ),
              ),

            ]),
          ),
          body: TabBarView(
              children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Align(
                              alignment:Alignment.topLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text('krishnakumar',style: TextStyle(fontSize: 12,color: bg1),),

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
                              )),

                          Divider(thickness: 1,)
                        ],
                      ),
                    );
                  }),
            ),

            Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Name",style: TextStyle(color: blackgray),),
                    ),
                    SizedBox(width: 106,),
                    Text(":",style: TextStyle(color: bg1),),
                    SizedBox(width: 10,),

                    Text("Krishnakumar",style: TextStyle(color: bg1),),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Email",style: TextStyle(color: blackgray),),
                    ),
                    SizedBox(width: 110,),
                    Text(":",style: TextStyle(color: bg1),),
                    SizedBox(width: 10,),

                    Text("Seclobclt@gmail.com",style: TextStyle(color: bg1),),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Seclobclt@gmail.com",style: TextStyle(color: blackgray),),
                    ),

                    Text(":",style: TextStyle(color: bg1),),
                    SizedBox(width: 10,),

                    Text("+99995444111",style: TextStyle(color: bg1),),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Profession",style: TextStyle(color: blackgray),),
                    ),
                    SizedBox(width: 75,),
                    Text(":",style: TextStyle(color: bg1),),
                    SizedBox(width: 120,),

                    Container(
                      height: 15,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: yellow),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Center(child: Text("Activated ",style: TextStyle(color: bg1,fontSize: 8),)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("District",style: TextStyle(color: blackgray),),
                    ),
                    SizedBox(width: 97,),
                    Text(":",style: TextStyle(color: bg1),),
                    SizedBox(width: 10,),

                    Text("Krishnakumar",style: TextStyle(color: bg1),),
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

          ]),
        )
    );
  }
}
