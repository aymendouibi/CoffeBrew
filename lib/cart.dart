import 'package:flutter/material.dart';
import 'package:obor/coffe.dart';
import 'package:obor/const.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key});
  var newCoffeList = coffeeList;
  double price = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurple,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
        child: Column(children: [
          Text('Cart',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                price = price + newCoffeList[index].price;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    background: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const ColoredBox(
                        color: Colors.red,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    child: Container(
                      height: Get.height * 0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff362C36)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                newCoffeList[index].image,
                                width: Get.width * 0.2,
                                height: Get.height * 0.12,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  newCoffeList[index].title,
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text("${newCoffeList[index].price} \$",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Spacer(),
                            ItemCount(
                              color: Color(0xffEFE3C8),
                              initialValue: 0,
                              minValue: 0,
                              maxValue: 10,
                              decimalPlaces: 0,
                              buttonSizeHeight: 30,
                              buttonSizeWidth: 30,
                              onChanged: (value) {
                                // Handle counter value changes
                                print('Selected value: $value');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          MySeparator(
            color: const Color.fromARGB(204, 255, 255, 255),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Grand Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('199 \$',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Color(0xffEFE3C8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              'PAY NOW',
              style: GoogleFonts.lato(color: darkPurple),
            ),
          ),
        ]),
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
