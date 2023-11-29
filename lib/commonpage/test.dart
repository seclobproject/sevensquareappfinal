import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/userpin_service.dart';
import '../support/logger.dart';

class testing extends StatefulWidget {
  const testing({super.key});

  @override
  State<testing> createState() => _testState();
}

class _testState extends State<testing> {

  var userid;
  var activatedpinlists;

  Future _Activatedpin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString('userid');
    var response = await UserpinService.activatedpinlisting();
    log.i('user pin listing done. $response');
    setState(() {
      activatedpinlists = response;

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _Activatedpin();
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(

        children: [
          Expanded(
            child: ListView.builder(
                itemCount: activatedpinlists['activatedPins'].length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: const Icon(Icons.list),
                      trailing: const Text(
                        "GFG",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text(activatedpinlists['activatedPins'][index]['name']));
                }),
          ),
        ],
      ),
    );
  }
}


