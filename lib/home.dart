// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:obor/coffe.dart';
import 'package:obor/const.dart';
import 'package:obor/details.dart';
import 'package:get/get.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkPurple,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('coffe',
                style: TextStyle(
                    color: mainColor.withOpacity(0.5),
                    fontSize: 30,
                    height: 1)),
            Text(
              'Brew',
              style: TextStyle(color: mainColor, fontSize: 43, height: 1),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF171017), // Your specified color
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Color(0xffEFE3C8)
                          .withOpacity(0.5), // Color of the search icon
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                            color: Color(0xffEFE3C8)
                                .withOpacity(0.5)), // Text color
                        decoration: InputDecoration(
                          hintText: 'Browse Your Favorite Coffe',
                          hintStyle: TextStyle(
                              color: Color(0xffEFE3C8)
                                  .withOpacity(0.5)), // Hint text color
                          border: InputBorder.none, // Remove the default border
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: coffeeList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (1 / 1.2),
                  crossAxisCount: 2,
                  crossAxisSpacing: 11.0,
                  mainAxisSpacing: 15.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CoffeeItem(coffee: coffeeList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeItem extends StatelessWidget {
  final Coffee coffee;

  CoffeeItem({required this.coffee});

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
                                  Icons.add,
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
