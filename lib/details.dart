import 'package:flutter/material.dart';
import 'package:obor/coffe.dart';
import 'package:obor/const.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDetails extends StatelessWidget {
  Coffee coffee;
  MyDetails({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurple,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Stack(
              children: [
                Image.asset(
                  coffee.image,
                  height: Get.height * 0.45,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                            color: darkPurple.withOpacity(0.5),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_back_rounded),
                            )),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            coffee.title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                coffee.shortDesc,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 18,
              ),
              Text(coffee.rating.toStringAsFixed(1)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            coffee.description,
            style: TextStyle(fontSize: 15),
          ),
          Spacer(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('price'),
                  Text('${coffee.price} \$',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Expanded(
                child: SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.snackbar(
                          'We are out of Coffe', 'Try Drinking something else');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffEFE3C8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'BUY NOW',
                      style: GoogleFonts.lato(color: darkPurple),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      )),
    );
  }
}
