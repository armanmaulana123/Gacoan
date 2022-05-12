// import 'dart:html';
import 'package:flutter/material.dart';

class riwayat extends StatelessWidget {
  late DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              "Riwayat",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: sizeHeight * 0.015,
                  child: Container(
                    color: Color(0xffe1e1e1),
                  )),
              Container(
                width: sizeWidth * 0.87,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Pesanan Anda",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                width: sizeWidth * 0.87,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 20, bottom: 45),
                child: Row(
                  children: [
                    Text(
                      "Riwayat",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color(0xff00B3D8),
                          fontSize: 15),
                    ),
                    SizedBox(
                      width: sizeWidth * 0.03,
                    ),
                    Text(
                      "Dalam Proses",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color(0xffb1b1b1),
                          fontSize: 15),
                    ),
                    SizedBox(
                      width: sizeWidth * 0.03,
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime(2222))
                              .then((date) {
                            setState(() {
                              _dateTime = date!;
                            });
                          });
                        },
                        child: Text(
                          "Pilih Tanggal",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                  width: sizeWidth * 0.85,
                  height: 2,
                  child: Container(
                    color: Color(0xffb1b1b1),
                  )),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 200),
                  child: Column(children: [
                    Text(
                      "Belum ada riwayat pemesanan",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ])),
            ],
          ),
        ));
  }

  void setState(Null Function() param0) {}
}
