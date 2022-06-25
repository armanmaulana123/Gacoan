import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class tersimpan extends StatefulWidget {
  @override
  _tersimpanState createState() => _tersimpanState();
}

class _tersimpanState extends State<tersimpan> {
  var list_item = [];

  void initState() {
    super.initState();
    getDataTersimpan();
  }

  getDataTersimpan() {
    var colTersimpan = FirebaseFirestore.instance.collection('tersimpan');
    colTersimpan.get().then((value) {
      setState(() {
        list_item = value.docs.map((e) {
          return {
            'nama': e['nama'],
            'keterangan': e['keterangan'],
            'harga': e['harga'],
            'rating': e['rating'],
            'gambar': e['gambar']
          };
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              "Tersimpan",
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
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 20, left: 35, bottom: 35),
                child: Text(
                  "Menu Yang Anda Simpan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: list_item.length,
                      itemBuilder: (_, int index) {
                        var item = list_item[index];
                        return Column(
                          children: [
                            SizedBox(
                                width: sizeWidth * 0.87,
                                height: 2,
                                child: Container(
                                  color: Color(0xffb1b1b1),
                                )),
                            Container(
                                width: sizeWidth * 0.87,
                                child: Row(
                                  children: [
                                    Container(
                                      width: sizeWidth * 0.2,
                                      height: sizeHeight * 0.2,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0)),
                                      child: Image.asset(
                                          "assets/images/${item['gambar']}.jpg"),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: sizeWidth * 0.5,
                                            margin: EdgeInsets.only(
                                                left: sizeWidth * 0.07),
                                            child: Text(
                                              item['nama'],
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff3E4957),
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          SizedBox(
                                            height: sizeHeight * 0.01,
                                          ),
                                          Container(
                                            width: sizeWidth * 0.5,
                                            margin: EdgeInsets.only(
                                                left: sizeWidth * 0.07),
                                            child: Text(
                                              item['keterangan'],
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff3E4957),
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          SizedBox(
                                            height: sizeHeight * 0.01,
                                          ),
                                          Container(
                                            width: sizeWidth * 0.5,
                                            margin: EdgeInsets.only(
                                                left: sizeWidth * 0.07),
                                            child: Text(
                                              'Rp. ${item['harga']}',
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 14,
                                                color: Color(0xff959595),
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: sizeWidth * 0.1,
                                        child: Column(children: [
                                          Text(
                                            item['rating'],
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 18,
                                                color: Color(0xff3E4957)),
                                          ),
                                          SizedBox(
                                            height: sizeHeight * 0.03,
                                          ),
                                          Text(
                                            'X',
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 18,
                                                color: Color(0xff3E4957)),
                                          ),
                                        ]))
                                  ],
                                )),
                          ],
                        );
                      })),
            ])));
  }
}
