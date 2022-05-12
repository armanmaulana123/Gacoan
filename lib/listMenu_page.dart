import 'package:flutter/material.dart';

class listMenu extends StatefulWidget {
  @override
  _listMenuState createState() => _listMenuState();
}

class _listMenuState extends State<listMenu> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Gtau aku bingung mann"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: sizeHeight * 0.015,
              child: Container(
                color: Color(0xffe1e1e1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
