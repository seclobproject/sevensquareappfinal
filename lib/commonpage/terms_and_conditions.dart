import 'package:flutter/material.dart';

import '../resources/color.dart';

class terms extends StatefulWidget {
  const terms({super.key});

  @override
  State<terms> createState() => _termsState();
}

class _termsState extends State<terms> {
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
        title: Text("Terms And Condition",style: TextStyle(color: bg1,fontSize: 16),),

      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 350,

              child: Text(
                "Welcome to Seven Square! By using our services, you agree to comply with and be bound by the following terms and conditions of use. Seven Square provides a platform where users can earn rewards, incentives, or commissions by participating in marketing activities, completing tasks, or referring new users. Users are required to provide accurate information, and any fraudulent or misleading activities may result in immediate termination of the account and forfeiture of earnings. Seven Square reserves the right to modify, suspend, or terminate services, including rewards or earning structures, at any time without prior notice. Users are responsible for maintaining the confidentiality of their account credentials and for all activities that occur under their account. By using our app, users agree that Seven Square is not liable for any loss, damages, or interruptions in service, and that participation in earning activities is at the user's own risk.",
                style: TextStyle(
                  color: Colors.white,
                ),
                softWrap: true, // Enable text wrapping
              ),
            ),
          ),
        ],
      ),

    );
  }
}
