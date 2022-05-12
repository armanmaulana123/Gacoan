// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gacoan/bottom_nav.dart';
import 'package:gacoan/editProfile_page.dart';
import 'package:gacoan/first_page.dart';
import 'package:gacoan/listMenu_page.dart';
import 'package:gacoan/profile_page.dart';

void main() {
  return runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNav(),
    );
  }
}

class pesanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: listMenu(),
    );
  }
}
