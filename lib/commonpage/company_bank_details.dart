import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/color.dart';

class companybankdetails extends StatefulWidget {
  const companybankdetails({super.key});

  @override
  State<companybankdetails> createState() => _companybankdetailsState();
}

class _companybankdetailsState extends State<companybankdetails> {

  bool _isLoading = true;

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
        title: Text("Company Bank Details",style: TextStyle(color: bg1,fontSize: 16),),

      ),
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 444,

              child:Center(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Bank Name",style: TextStyle(color: bg1),),
                        SizedBox(height: 10,),
                        Text("SEVEN SQUARES GROUP",style: TextStyle(color: bg1,fontSize: 16),),
                        SizedBox(height: 10,),
                        Text("A/C Number",style: TextStyle(color: bg1),),
                        SizedBox(height: 10,),
                        Text("30570200000269",style: TextStyle(color: bg1,fontSize: 16),),
                        SizedBox(height: 10,),
                        Text("IFSC Code",style: TextStyle(color: bg1),),
                        Text("BARB0WCALIC",style: TextStyle(color: bg1,fontSize: 16),),
                        SizedBox(height: 10,),
                        Text("QR Code",style: TextStyle(color: bg1),),
                        SizedBox(height: 10,),

                        Image.asset('assets/logo/imgqr.jpg',
                        height: 150,
                        )




                      ],

                    ),
                  )),
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
