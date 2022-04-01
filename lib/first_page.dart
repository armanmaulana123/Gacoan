import 'package:flutter/material.dart';
import 'package:gacoan/login_page.dart';
import 'package:gacoan/register_page.dart';

class firstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: sizeHeight * 0.15,
            ),
            Container(
              width: sizeWidth * 0.5,
              height: sizeHeight * 0.2,
              child: Image(
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.contain,
              ),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("images/baphomet.jpg"),
              //     fit: BoxFit.contain,
              //   ),
              // ),
            ),
            Container(
              height: sizeHeight * 0.3,
              width: sizeWidth * 0.5,
              child: Text(
                "Pesan Mie Gacoan Lebih Mudah Tanpa Ribet.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  color: Color(0xff34495e),
                ),
              ),
            ),
            // SizedBox(
            //   height: 170,
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return loginPage();
                  }));
                },
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  primary: Color(0xff00B3D8),
                  minimumSize: Size.fromHeight(50),
                ),
              ),
            ),
            SizedBox(
              height: sizeHeight * 0.02,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return registerPage();
                  }));
                },
                child: Text(
                  "Daftar",
                  style: TextStyle(color: Color(0xff00B3D8)),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  primary: Colors.white,
                  side: BorderSide(
                    color: Color(0xff00B3D8),
                  ),
                  minimumSize: Size.fromHeight(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
