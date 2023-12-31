import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/packageService.dart';
import '../../services/wallet_service.dart';
import '../../support/logger.dart';
import '../services/salary_service.dart';

class salarysccount extends StatefulWidget {
  const salarysccount({super.key});

  @override
  State<salarysccount> createState() => _walletState();
}

class _walletState extends State<salarysccount> {
  var userid;
  var salarylist;
  bool _isLoading = true;

  Future _getwallet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await SalaryService.salary();
    log.i('Salary list.. $response');
    print(salarylist);

    setState(() {
      salarylist = response;
    });
  }

  Future _initLoad() async {
    await Future.wait([_getwallet()]);
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
        iconTheme: IconThemeData(
          color:bg1, //change your color here
        ),
        centerTitle: true,
        title: Text("Salary Account",style: TextStyle(color: bg1,fontSize: 16),),

      ),
      backgroundColor: sevensgbg,
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator()
      )
          :Column(

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
                            Text("Unrealized salary", style: TextStyle(color: bg1)),
                            // Text("Unrealized salary", style: TextStyle(color: greenbg, fontSize: 10)),
                          ],
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(salarylist['unrealisedSalary'].toString(),
                                style: TextStyle(color: greenbg, fontSize: 18, fontWeight: FontWeight.w700,)),
                            // Align(
                            //   child: Text(salarylist['unrealisedSalary'].toString(),
                            //       style: TextStyle(color: greenbg, fontSize: 18, fontWeight: FontWeight.w700)),
                            // ),
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
          ),
          SizedBox(
            height: 25,
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text("Recent Transaction", style: TextStyle(color: bg1, fontWeight: FontWeight.w700)),
          //       // Text("View all", style: TextStyle(color: yellow, fontWeight: FontWeight.w400)),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Divider(thickness: 0.1, color: bg1),
          // ),
          // Expanded(
          //   child: ListView.builder(
          //       itemCount: walletlist['transactionHistory'].length,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Row(
          //                 children: [
          //                   Container(
          //                     height: 30,
          //                     width: 30,
          //                     decoration: BoxDecoration(
          //                         color: yellow, borderRadius: BorderRadius.all(Radius.circular(10))),
          //                     child: Image.asset(
          //                       "assets/logo/trnss.png",
          //                       height: 20,
          //                       width: 20,
          //                     ),
          //                   ),
          //                   SizedBox(width: 10,),
          //                   Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(walletlist['transactionHistory'][0]['referenceID'],
          //                           style: TextStyle(color: bg1, fontSize: 10)),
          //                       Text("Name", style: TextStyle(color: bg1, fontSize: 10)),
          //                     ],
          //                   ),
          //                   Expanded(child: SizedBox()),
          //                   Padding(
          //                     padding: const EdgeInsets.symmetric(horizontal: 20),
          //                     child: Text('\$${walletlist['transactionHistory'][0]['amount'].toString()}',
          //                         style: TextStyle(color: bg1, fontSize: 12, fontWeight: FontWeight.w800)),
          //                   ),
          //                 ],
          //               ),
          //               SizedBox(height: 10,),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text("26 October 2023 10:30 PM", style: TextStyle(fontSize: 8, color: bg1)),
          //                   Container(
          //                     height: 20,
          //                     width: 60,
          //                     decoration: BoxDecoration(
          //                         color: yellow,
          //                         borderRadius: BorderRadius.all(Radius.circular(5))),
          //                     child: Center(
          //                         child: Text(walletlist['transactionHistory'][0]['status'],
          //                             style: TextStyle(
          //                               fontSize: 10,
          //                             ))),
          //                   )
          //                 ],
          //               ),
          //               Divider(thickness: 0.1, color: bg1),
          //             ],
          //           ),
          //         );
          //       }),
          // ),
        ],
      ),
    );
  }
}


