import 'package:flutter/material.dart';
import 'package:obor/coffe.dart';
import 'package:obor/const.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:obor/details.dart';
import 'package:obor/home.dart';

class MyFav extends StatelessWidget {
  MyFav({super.key});
  var newCoffeList = coffeeList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurple,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
        child: Column(children: [
          Text('Favorite',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (1 / 1.2),
                crossAxisCount: 2,
                crossAxisSpacing: 11.0,
                mainAxisSpacing: 15.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return FavItem(coffee: coffeeList[index]);
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class FavItem extends StatelessWidget {
  final Coffee coffee;

  FavItem({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(MyDetails(coffee: coffee));
      },
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: Color(0xff362C36),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(children: [
                      Image.asset(
                        coffee.image,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(15)),
                        child: Container(
                          width: 44,
                          color: Color(0xff362C36),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18,
                                ),
                                Text(coffee.rating.toStringAsFixed(1)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(height: 10),
                  Text(coffee.title,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: Color(0xff463D46),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: Text(
                            '${coffee.price.toStringAsFixed(1)}\$',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                              color: Color(0xffEFE3C8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: darkPurple,
                                ),
                              )),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
