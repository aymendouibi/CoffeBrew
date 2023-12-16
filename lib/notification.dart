import 'package:flutter/material.dart';
import 'package:obor/coffe.dart';
import 'package:obor/const.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class MyNotf extends StatelessWidget {
  MyNotf({super.key});
  var newCoffeList = coffeeList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkPurple,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('Under Maintenance',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 10,
              ),
              CircularProgressIndicator()
            ]));
  }
}
