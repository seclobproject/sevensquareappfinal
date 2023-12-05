import 'package:flutter/material.dart';



class MyDropdown extends StatefulWidget {
  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = 'Option 1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Select an option:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          DropdownButton<String>(
            value: selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
            items: ['Option 1', 'Option 2', 'Option 3']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24.0,
            elevation: 16,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Perform some action with the selected value
              print('Selected value: $selectedValue');
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
