import 'package:flutter/material.dart';

import '../resources/color.dart';
import 'bankdetails.dart';

class banketailslist extends StatefulWidget {
  const banketailslist({super.key});

  @override
  State<banketailslist> createState() => _banketailslistState();
}

class _banketailslistState extends State<banketailslist> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        iconTheme: IconThemeData(
          color:bg1, //change your color here
        ),
        centerTitle: true,
        title: Text("Bank Details Show",style: TextStyle(color: bg1,fontSize: 16),),

      ),
      body: Column(
        children: [

          Padding(
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
                            width: 120,

                            child: Text("name",
                              overflow: TextOverflow.ellipsis,style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11,),)),
                        SizedBox(width: 50,),



                      ],
                    ),
                  ),

                  SizedBox(height: 5,),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Row(

                      children: [
                        Text("A/c No",style: TextStyle(fontSize: 10,color: bg1,),),
                        SizedBox(width: 74,),
                        Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                        SizedBox(width: 5,),
                        Container(
                            width: 150,
                            child: Text("sponser",
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
                        Text("IFSC Code",style: TextStyle(fontSize: 10,color: bg1,),),
                        SizedBox(width: 57,),
                        Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                        SizedBox(width: 5,),


                        Center(child: Text("status",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w600,color: yellow),)),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Row(

                      children: [
                        Text("Bank",style: TextStyle(fontSize: 10,color: bg1,),),
                        SizedBox(width: 84,),
                        Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                        SizedBox(width: 5,),
                        Text("phone",style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),


                      ],
                    ),
                  ),

                  SizedBox(height: 5,),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Row(

                      children: [
                        Text("Adhar Number ",style: TextStyle(fontSize: 10,color: bg1,),),
                        SizedBox(width: 35,),
                        Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                        SizedBox(width: 5,),
                        Text("email",style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),

                        SizedBox(width: 28,),

                      ],
                    ),
                  ),

                  SizedBox(height: 5,),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Row(

                      children: [
                        Text("Pan Card Number",style: TextStyle(fontSize: 10,color: bg1,),),
                        SizedBox(width: 22,),
                        Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                        SizedBox(width: 5,),
                        Text('packageamount',style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11),),

                        SizedBox(width: 28,),

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

        ],
      ),



      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add),
        backgroundColor: yellow,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => bankaccount()),
          );
        },
      ),


    );
  }
}
