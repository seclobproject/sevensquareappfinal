import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../resources/color.dart';
import '../services/bank_service.dart';
import '../support/logger.dart';
import 'bankdetails.dart';

class banketailslist extends StatefulWidget {
  const banketailslist({super.key});

  @override
  State<banketailslist> createState() => _banketailslistState();
}

class _banketailslistState extends State<banketailslist> {


  var userid;
  var bankdetails;
  bool _isLoading = true;

  Future _getbankdetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await BankService.banklistdetails();
    log.i('bank details list.. $response');
    setState(() {
      bankdetails = response;

      print(bankdetails['sts']);
    });
  }


  Future _initLoad() async {
    await Future.wait(
      [
        _getbankdetails()
      ],
    );
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
      body:   _isLoading
          ? Center(
          child:CircularProgressIndicator()
      )
          :Column(
        children: [
          bankdetails['sts'] == "01" ?
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
                        //
                        //     child: Text(bankdetails['bankDetails']['holderName'],
                        //       overflow: TextOverflow.ellipsis,style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11,),)),
                        // SizedBox(width: 50,),

                      child: Text(bankdetails != null &&
                          bankdetails['bankDetails'] != null &&
                          bankdetails['bankDetails']['holderName'] != null &&
                          bankdetails['bankDetails']['holderName'] != null
                          ? bankdetails['bankDetails']['holderName']
                          : "NIL",
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
                            child: Text(bankdetails != null &&
                                bankdetails['bankDetails'] != null &&
                                bankdetails['bankDetails']['accountNum'] != null &&
                                bankdetails['bankDetails']['accountNum'] != null
                                ? bankdetails['bankDetails']['accountNum']
                                : "NIL",
                              overflow: TextOverflow.ellipsis,style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11,),)),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),

                  //accountNum

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Row(

                      children: [
                        Text("IFSC Code",style: TextStyle(fontSize: 10,color: bg1,),),
                        SizedBox(width: 57,),
                        Text(":",style: TextStyle(color: textgrey1,fontSize: 12)),
                        SizedBox(width: 5,),

//ifscCode
                        Center(
                            child:
                            Text(bankdetails != null &&
                                bankdetails['bankDetails'] != null &&
                                bankdetails['bankDetails']['ifscCode'] != null &&
                                bankdetails['bankDetails']['ifscCode'] != null
                                ? bankdetails['bankDetails']['ifscCode']
                                : "NIL",
                              overflow: TextOverflow.ellipsis,style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11,),)),
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
                        Text(bankdetails != null &&
                            bankdetails['bankDetails'] != null &&
                            bankdetails['bankDetails']['bank'] != null &&
                            bankdetails['bankDetails']['bank'] != null
                            ? bankdetails['bankDetails']['bank']
                            : "NIL",
                          overflow: TextOverflow.ellipsis,style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11,),)


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
                        Text(bankdetails != null &&
                            bankdetails['bankDetails'] != null &&
                            bankdetails['bankDetails']['aadhar'] != null &&
                            bankdetails['bankDetails']['aadhar'] != null
                            ? bankdetails['bankDetails']['aadhar']
                            : "NIL",
                          overflow: TextOverflow.ellipsis,style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11,),),

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
                        Text(bankdetails != null &&
                            bankdetails['bankDetails'] != null &&
                            bankdetails['bankDetails']['pan'] != null &&
                            bankdetails['bankDetails']['pan'] != null
                            ? bankdetails['bankDetails']['pan']
                            : "NIL",
                          overflow: TextOverflow.ellipsis,style: TextStyle(color: bg1,fontWeight: FontWeight.w600,fontSize: 11,),),

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
          ):
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 150),
            child: Center(
              child:  Column(
                children: [
                  SizedBox(height: 60,),
                  Image.asset(
                    'assets/logo/nouser.png',
                    height: 150,
                  ),
                  SizedBox(height: 10,),
                  Text("Please add  bank details..!!",
                    style: TextStyle(color: bg1,fontSize: 17,fontWeight: FontWeight.w700),)
                ],
              ),
            ),
          ),

        ],
      ),



      floatingActionButton: (bankdetails != null && bankdetails['sts'] == "00")
          ? FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add),
        backgroundColor: yellow,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => bankaccount()),
          );
        },
      )
          : null,


    );
  }
}
