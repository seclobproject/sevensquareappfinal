import 'package:flutter/material.dart';
import 'package:sevensquare/commonpage/withdrawal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../navigation/bottom_tabs_screen.dart';
import '../resources/color.dart';
import '../services/withdrawal_service.dart';
import '../support/logger.dart';

class withdrawalrequst extends StatefulWidget {
  const withdrawalrequst({super.key});

  @override
  State<withdrawalrequst> createState() => _withdrawalrequstState();
}

class _withdrawalrequstState extends State<withdrawalrequst> {
  TextEditingController amountController = TextEditingController();
  TextEditingController discountedPriceController = TextEditingController();

  var userid;

  Future addammount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');

    var reqData = {
      'amount': discountedPriceController.text, // Use the value from the controller
    };

    var response = await WithdrawalService.withdrawal(reqData);
    log.i('create withdrawal . $response');

    print(response);
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => withdrawal()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sevensgbg,
      appBar: AppBar(
        backgroundColor: sevensgbg,
        iconTheme: IconThemeData(
          color: bg1, //change your color here
        ),
        centerTitle: true,
        title: Text("Withdrawal Request", style: TextStyle(color: bg1, fontSize: 16),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 240,
              width: 444,
              decoration: BoxDecoration(
                border: Border.all(
                  color: blackgray,
                  width: 1,
                ),
                color: walletinner,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Amount", style: TextStyle(color: bg1),)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 40,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: amountController,
                        autocorrect: true,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          updateDiscountedPrice();
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your Amount',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: bg1, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: bg1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 40,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: discountedPriceController,
                        autocorrect: true,

                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Discounted Price',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: bg1, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: bg1),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 25,
                          width: 80,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Center(
                              child: Text("Cancel", style: TextStyle(color: bg1),)),
                        ),
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () {
                            addammount();
                          },
                          child: Container(
                            height: 25,
                            width: 80,
                            decoration: BoxDecoration(
                                color: yellow,
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child: Center(
                                child: Text("Submit", style: TextStyle(color: sevensgbg, fontWeight: FontWeight.w600),)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateDiscountedPrice() {
    if (amountController.text.isNotEmpty) {
      double amount = double.parse(amountController.text);
      double discountedPrice = amount - (0.10 * amount); // 10% discount
      discountedPriceController.text = discountedPrice.toStringAsFixed(2);
    } else {
      discountedPriceController.text = '';
    }
  }
}
