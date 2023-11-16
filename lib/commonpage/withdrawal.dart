import 'package:flutter/material.dart';
import 'package:sevensquare/commonpage/withdrawalrequst.dart';

import '../resources/color.dart';

class withdrawal extends StatefulWidget {
  const withdrawal({super.key});

  @override
  State<withdrawal> createState() => _withdrawalState();
}

class _withdrawalState extends State<withdrawal> {

  String dropdownvalue = 'Apple';

  var items =  ['Apple','Banana','Grapes','Orange','watermelon','Pineapple'];

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
        title: Text("Withdrawal",style: TextStyle(color: bg1,fontSize: 16),),

      ),

      body: Column(
        children: [

          SizedBox(height: 20,),

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

                          ],
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("₹1000",style: TextStyle(color: bg1,fontSize: 18,fontWeight: FontWeight.w700),),
                            
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
          
          
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const withdrawalrequst()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                width: 400,
                decoration: BoxDecoration(
                  color: yellow,
                    borderRadius:BorderRadius.all(Radius.circular(10)) ),
                child: Center(
                    child: Text("Request withdrawal money ",style: TextStyle(color: sevensgbg,fontWeight: FontWeight.w600,fontSize: 12),)),
              ),
            ),
          ),

          SizedBox(height: 25,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(color: blackgray), // Set the border color
                  borderRadius: BorderRadius.circular(5), // Set border radius if desired
                ),
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: DropdownButton(

                      elevation: 0,
                      value: dropdownvalue,

                      icon: Icon(Icons.keyboard_arrow_down),

                      items:items.map((String items) {
                        return DropdownMenuItem(
                            value: items,
                            child: Text(items,style: TextStyle(color: bg1,fontSize: 10),)
                        );
                      }
                      ).toList(),

                      onChanged: (String? newValue){
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },

                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 10,),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Transaction",
                  style: TextStyle(color: bg1,fontWeight: FontWeight.w700,fontSize: 14),),
                Text("View all",style: TextStyle(color: yellow,fontWeight: FontWeight.w400,fontSize: 12)),
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
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Amount",style: TextStyle(fontSize: 10,color: blackgray),),
                           Text("TDS Amount",style: TextStyle(fontSize: 10,color: blackgray),),
                           Text("Total Amount",style: TextStyle(fontSize: 10,color: blackgray),),
                           Text("Status",style: TextStyle(fontSize: 10,color: blackgray),),

                         ],
                       ),

                        Divider(thickness: 0.1,color: bg1,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("₹1000",style: TextStyle(fontSize: 10,color: bg1,fontWeight: FontWeight.w800),),
                            Text("₹100",style: TextStyle(fontSize: 10,color: bg1,fontWeight: FontWeight.w800),),
                            Text("₹900",style: TextStyle(fontSize: 10,color: bg1,fontWeight: FontWeight.w800),),
                           Container(
                             height: 18,
                             width: 50,
                             decoration: BoxDecoration(
                               color: greendark,
                               borderRadius: BorderRadius.circular(5),
                             ),
                             child: Center(child: Text("Accepted",style: TextStyle(fontSize: 10,color: bg1),)),
                           )

                          ],
                        ),



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

