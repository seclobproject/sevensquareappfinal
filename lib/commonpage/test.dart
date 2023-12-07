import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';



class myHome extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<myHome> {
  Country? selectedCountry;
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Code Picker Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Set your desired border color here
                  width: 1.0, // Set your desired border width here
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)), // Set your desired border radius here
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    CountryPickerDropdown(
                      initialValue: 'IN',
                      itemBuilder: (Country country) {
                        return Row(
                          children: <Widget>[
                            CountryPickerUtils.getDefaultFlagImage(country),
                            SizedBox(width: 8.0),
                            Text(
                              "+${country.phoneCode}",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        );
                      },
                      onValuePicked: (Country country) {
                        setState(() {
                          selectedCountry = country;
                        });
                      },
                    ),
                    Expanded(
                      child: TextField(
                        autocorrect: true,
                        cursorWidth: 1.0,
                        cursorColor: Colors.black,
                        cursorHeight: 12,
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          setState(() {
                            phone = text;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none, // Remove the underline border
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
