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
    return  Scaffold(

      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        title: Text("User Pin",style: TextStyle(color: bg1,fontSize: 18),),
      ),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(child: Text("User pin",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)),
                ),

                Container(
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(child: Text("Activated Pin",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),

          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Column(
                      children: [
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
        ],
      ),
    );
  }
}
