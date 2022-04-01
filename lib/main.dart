import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gacoan/first_page.dart';

void main() {
  return runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: firstPage(),
    );
  }
}
