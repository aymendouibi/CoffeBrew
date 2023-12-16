import 'package:flutter/material.dart';
import 'package:obor/const.dart';
import 'package:obor/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:obor/nav.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          textTheme: GoogleFonts.rosarivoTextTheme().apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          useMaterial3: true,
          brightness: Brightness.dark),
      home: SafeArea(child: BottomNavBar()),
    );
  }
}
