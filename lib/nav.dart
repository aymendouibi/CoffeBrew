import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obor/cart.dart';
import 'package:obor/const.dart';
import 'package:obor/fav.dart';
import 'package:obor/home.dart';
import 'package:obor/notification.dart';

class BottomNavBar extends StatelessWidget {
  final icons = [
    Icons.home_rounded,
    Icons.shopping_cart_rounded,
    Icons.favorite,
    Icons.notifications_rounded,
  ];

  final List<String> labels = [
    'Home',
    'Cart',
    'Favorite',
    'Notification',
  ];

  final RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _buildPage(currentIndex.value),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: currentIndex.value,
          onTap: (index) {
            currentIndex.value = index;
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: darkPurple,
          selectedItemColor: Colors.white, // Change this color as needed
          unselectedItemColor: Color(0xff746763),
          showSelectedLabels: false,
          showUnselectedLabels: false,

          items: List.generate(icons.length, (index) {
            return BottomNavigationBarItem(
              icon:
                  _buildGlowingIcon(icons[index], currentIndex.value == index),
              label: labels[index],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return MyHome();
      // Add cases for other screens here
      case 1:
        return MyCart();
      case 2:
        return MyFav();
      case 3:
        return MyNotf();
      default:
        return Container();
    }
  }

  Widget _buildGlowingIcon(IconData iconData, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.white.withOpacity(0.05),
                  blurRadius: 9,
                  spreadRadius: 8,
                ),
              ]
            : [],
      ),
      child: Icon(
        iconData,
        size: 28,
      ),
    );
  }
}


// Add other screen widgets similarly
