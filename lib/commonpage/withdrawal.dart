import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sevensquare/commonpage/withdrawalrequst.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../resources/color.dart';
import '../services/wallet_service.dart';
import '../support/logger.dart';


class withdrawal extends StatefulWidget {
  const withdrawal({super.key});

  @override
  State<withdrawal> createState() => _withdrawalState();
}

class _withdrawalState extends State<withdrawal> {

  String dropdownvalue = 'Accepted';

  var items =  ['Accepted','Pending','Rejected'];

  var userid;
  var walletlist;
  bool _isLoading = true;

  Future _getwallet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await WalletService.wallets();
    log.i('Wallet list.. $response');
    print(walletlist);

    setState(() {
      walletlist = response;
    });
  }



  Future _initLoad() async {
    await Future.wait(
      [
        _getwallet()
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
        iconTheme: IconThemeData(
          color:bg1, //change your color here
        ),
        centerTitle: true,
        title: Text("Withdrawal",style: TextStyle(color: bg1,fontSize: 16),),

      ),

      body: _isLoading
          ?  Center(
        child:  SvgPicture.asset(
          'assets/svg/opsmsg.svg',
          height: 300,
        ),
      )
          :Column(
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
                            Text(walletlist['earning'].toString(),style: TextStyle(color: bg1,fontSize: 18,fontWeight: FontWeight.w700),),
                            
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
            onTap: () {
              // Check if earning is greater than 0 before navigating
              if (int.parse(walletlist['earning'].toString()) > 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const withdrawalrequst()),
                );
              } else {

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Cannot request withdrawal, earnings are 0.'),
                ));

                print("Cannot request withdrawal, earnings are 0.");
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                width: 400,
                decoration: BoxDecoration(
                  color: yellow,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    "Request withdrawal money ",
                    style: TextStyle(color: sevensgbg, fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
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
                      items: items.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(color: Colors.grey, fontSize: 10), // Set text color to black
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
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
                // Text("View all",style: TextStyle(color: yellow,fontWeight: FontWeight.w400,fontSize: 12)),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(thickness: 0.1,color: bg1,),
          ),


          Expanded(
            child: ListView.builder(
                itemCount: walletlist['transactionHistory'].length,
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
                            Text(walletlist['transactionHistory'][index]['amount'].toString(),style: TextStyle(fontSize: 10,color: bg1,fontWeight: FontWeight.w800),),
                            Text("₹100",style: TextStyle(fontSize: 10,color: bg1,fontWeight: FontWeight.w800),),
                            Text("₹900",style: TextStyle(fontSize: 10,color: bg1,fontWeight: FontWeight.w800),),
                           Container(
                             height: 18,
                             width: 50,
                             decoration: BoxDecoration(
                               color: greendark,
                               borderRadius: BorderRadius.circular(5),
                             ),
                             child: Center(child: Text(walletlist['transactionHistory'][index]['status'],style: TextStyle(fontSize: 10,color: bg1),)),
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


