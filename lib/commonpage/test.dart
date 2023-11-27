import 'package:flutter/material.dart';
import 'package:sevensquare/resources/color.dart';



class DiscountCalculator extends StatefulWidget {
  @override
  _DiscountCalculatorState createState() => _DiscountCalculatorState();
}

class _DiscountCalculatorState extends State<DiscountCalculator> {
  TextEditingController amountController = TextEditingController();
  TextEditingController discountedPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sevensgbg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: amountController,
                autocorrect: true,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  updateDiscountedPrice();
                },
                decoration: InputDecoration(
                  hintText: 'Enter your Amount',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
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
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
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
