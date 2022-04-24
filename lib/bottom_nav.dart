import 'package:flutter/material.dart';

import 'package:gacoan/home.dart';
import 'package:gacoan/order_page.dart';
import 'package:gacoan/profile_page.dart';
import 'package:gacoan/riwayat_page.dart';
import 'package:gacoan/tersimpan_page.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  final List<Widget> body = [
    const home(),
    riwayat(),
    order(),
    tersimpan(),
    profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontap,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.grey,
                size: 30,
              ),
              label: '',
              activeIcon: Icon(Icons.home, color: Color(0xff00B3D8), size: 30)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.schedule_outlined,
                color: Colors.grey,
                size: 30,
              ),
              label: '',
              activeIcon:
                  Icon(Icons.schedule, color: Color(0xff00B3D8), size: 30)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.description_outlined,
                color: Colors.grey,
                size: 30,
              ),
              label: '',
              activeIcon:
                  Icon(Icons.description, color: Color(0xff00B3D8), size: 30)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_border_outlined,
                color: Colors.grey,
                size: 30,
              ),
              label: '',
              activeIcon: Icon(Icons.bookmark_border,
                  color: Color(0xff00B3D8), size: 30)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: Colors.grey,
                size: 30,
              ),
              label: '',
              activeIcon:
                  Icon(Icons.person, color: Color(0xff00B3D8), size: 30))
        ],
      ),
    );
  }

  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
