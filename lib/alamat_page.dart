import 'package:flutter/material.dart';
import 'package:gacoan/detailAlamat_page.dart';

class alamatPage extends StatefulWidget {
  @override
  _alamatPageState createState() => _alamatPageState();
}

class _alamatPageState extends State<alamatPage> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Alamat",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff00B3D8)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          color: Color(0xffe1e1e1),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 12),
                width: sizeWidth * 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.white),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return detailAlamatPage();
                    })));
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: sizeWidth * 0.9,
                        child: Row(
                          children: [
                            Container(
                                width: sizeWidth * 0.8,
                                child: Row(children: [
                                  Text("Lulu Anggriani",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("[Utama]",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            color: Color(0xff00B3D8))),
                                  )
                                ])),
                            Container(
                              width: sizeWidth * 0.1,
                              child: Text("uhuy"),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7),
                        width: sizeWidth * 0.9,
                        child: Text("(+62) 812-3456-7890",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 7, bottom: 18),
                          width: sizeWidth * 0.9,
                          child: Row(children: [
                            Container(
                              width: sizeWidth * 0.8,
                              child: Text(
                                  "Gang Sumatra I No.5 RT.99/RW.99 Kec.Sumbersari Kab.Jember Jawa Timur",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 15,
                                  )),
                            ),
                            Container(
                              width: sizeWidth * 0.1,
                              child: Icon(
                                Icons.location_pin,
                                size: 30,
                                color: Color(0xff00B3D8),
                              ),
                            ),
                          ]))
                    ],
                  ),
                ),
              )
            ],
          )),
        ));
  }
}