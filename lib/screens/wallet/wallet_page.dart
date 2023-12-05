import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/packageService.dart';
import '../../services/wallet_service.dart';
import '../../support/logger.dart';

class wallet extends StatefulWidget {
  const wallet({super.key});

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  var userid;
  var walletlist;
  var walletlisttransation;
  bool _isLoading = true;
  // List<int> unrealisedEarning = [];
  List<dynamic> unrealisedEarning = [];
  double totalUnrealisedAmount = 0.0;

  Future _getwallet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await WalletService.wallets();
    log.i('Wallet list.. $response');
    print(walletlist);

    // setState(() {
    //   walletlist = response;
    //   unrealisedEarning = (walletlist['unrealisedEarning'] as List<dynamic>).map((e) => e as int).toList();
    //   totalUnrealisedAmount = unrealisedEarning.fold(0, (sum, amount) => sum + amount).toDouble();
    // });

    setState(() {
      walletlist = response;

      if (walletlist['unrealisedEarning'] is List) {
        unrealisedEarning = List<dynamic>.from(walletlist['unrealisedEarning']);
      }

      totalUnrealisedAmount = unrealisedEarning.fold(0, (sum, amount) {
        if (amount is int) {
          return sum + amount.toDouble();
        } else if (amount is double) {
          return sum + amount;
        }
        return sum;
      });
    });


  }

  Future _getwallettransation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await WalletService.walletstransation();
    log.i('Wallet Transation list.. $response');
    print(walletlisttransation);

    setState(() {
      walletlisttransation = response;
    });
  }


    Future _initLoad() async {
    await Future.wait([
      _getwallettransation(),
      _getwallet()

    ]);
    _isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _initLoad();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sevensgbg,
        title: Text("Wallet", style: TextStyle(color: bg1, fontSize: 18)),
      ),
      backgroundColor: sevensgbg,
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator()
      )
          :Column(

        children: [
          walletlist['userStatus']== "approved" ?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 444,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: blackgray,
                        width: 1,
                      ),
                      color: walletinner,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
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
                                Text("Total Wallet Amount", style: TextStyle(color: bg1)),
                                Text("Unrealized Amount", style: TextStyle(color: greenbg, fontSize: 10)),
                              ],
                            )),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(walletlist['earning'].toString(),
                                    style: TextStyle(color: bg1, fontSize: 18, fontWeight: FontWeight.w700)),
                                Align(
                                  child: Text("₹${totalUnrealisedAmount.toStringAsFixed(2)}",
                                      style: TextStyle(color: greenbg, fontSize: 18, fontWeight: FontWeight.w700)),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Please meet the criteria to access the unrealized amount in your wallet.",
                              style: TextStyle(fontSize: 12, color: bg1),
                            )),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recent Transaction", style: TextStyle(color: bg1, fontWeight: FontWeight.w700)),
                      // Text("View all", style: TextStyle(color: yellow, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(thickness: 0.1, color: bg1),
                ),
              ],
            ),
          ):Padding(
            padding: const EdgeInsets.symmetric(vertical: 150),
            child: Center(
              child:  Column(
                children: [
                  SvgPicture.asset(
                    'assets/svg/noactivation.svg',
                    height: 200,
                  ),
                  SizedBox(height: 10,),

                  Text("Activation\nPending..!!",
                    style: TextStyle(color: bg1,fontSize: 25,fontWeight: FontWeight.w700),)
                ],
              ),
            ),
          ),


          Expanded(

            child: ListView.builder(
                itemCount: walletlisttransation['result'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: yellow, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                Text( walletlisttransation['result'][index]['transaction']['name'],
                                    style: TextStyle(color: bg1, fontSize: 10)),
                                Text("sponserName", style: TextStyle(color: bg1, fontSize: 10)),
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(walletlisttransation['result'][index]['transaction']['amount'].toString(),
                                  style: TextStyle(color: bg1, fontSize: 12, fontWeight: FontWeight.w800)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(walletlisttransation['result'][index]['formattedDate'], style: TextStyle(fontSize: 9, color: bg1)),
                            Container(
                              height: 20,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: yellow,
                                  borderRadius: BorderRadius.all(Radius.circular(5))),
                              child: Center(
                                  child: Text(walletlisttransation['result'][index]['transaction']['status'],
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                            )
                          ],
                        ),
                        Divider(thickness: 0.1, color: bg1),
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


