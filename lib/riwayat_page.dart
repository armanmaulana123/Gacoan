import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class riwayat extends StatefulWidget {
  @override
  _riwayatState createState() => _riwayatState();
}

class _riwayatState extends State<riwayat> with SingleTickerProviderStateMixin {
  late TabController _tabBarRiwayat;
  var list_item = [];
  var list_item2 = [];

  void initState() {
    _tabBarRiwayat = TabController(length: 2, vsync: this);
    super.initState();
    getDataRiwayat();
    getDataProses();
  }

  @override
  void dispose() {
    super.dispose();
    _tabBarRiwayat.dispose();
  }

  getDataRiwayat() {
    var colRiwayat = FirebaseFirestore.instance.collection('riwayat');
    colRiwayat.get().then((value) {
      setState(() {
        list_item = value.docs.map((e) {
          return {
            'nama': e['nama'],
            'keterangan': e['keterangan'],
            'tanggal': e['tanggal'],
            'gambar': e['gambar']
          };
        }).toList();
      });
    });
  }

  getDataProses() {
    var colProses = FirebaseFirestore.instance.collection('proses');
    colProses.get().then((value) {
      setState(() {
        list_item2 = value.docs.map((e) {
          return {
            'nama': e['nama'],
            'keterangan': e['keterangan'],
            'tanggal': e['tanggal'],
            'jumlah': e['jumlah'],
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
                  margin: EdgeInsets.only(left: 25, top: 20, right: 25),
                  child: Row(
                    children: [
                      Container(
                        width: sizeWidth * 0.4,
                        alignment: Alignment.centerLeft,
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
                        width: sizeWidth * 0.4,
                        margin: EdgeInsets.only(top: 5),
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(2222))
                                .then((date) {
                              setState(() {
                                var _dateTime = date!;
                              });
                            });
                          },
                          child: Text(
                            "Tanggal",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    width: sizeWidth * 0.6,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 25, top: 5),
                    child: TabBar(
                      controller: _tabBarRiwayat,
                      labelColor: Color(0xff00B3D8),
                      unselectedLabelColor: Color(0xffB1B1B1),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      labelPadding: EdgeInsets.symmetric(horizontal: 2),
                      tabs: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Tab(
                            text: "Riwayat",
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Tab(
                            text: 'Dalam Proses',
                          ),
                        )
                      ],
                    )),
              ),
              Expanded(
                  child: TabBarView(
                controller: _tabBarRiwayat,
                children: [
                  Container(
                    width: sizeWidth * 0.85,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                                                        BorderRadius.circular(
                                                            25.0)),
                                                child: Image.asset(
                                                    "assets/images/${item['gambar']}.jpg"),
                                              ),
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: sizeWidth * 0.6,
                                                      margin: EdgeInsets.only(
                                                          left:
                                                              sizeWidth * 0.07),
                                                      child: Text(
                                                        item['nama'],
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xff3E4957),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: sizeHeight * 0.01,
                                                    ),
                                                    Container(
                                                      width: sizeWidth * 0.6,
                                                      margin: EdgeInsets.only(
                                                          left:
                                                              sizeWidth * 0.07),
                                                      child: Text(
                                                        item['keterangan'],
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xff3E4957),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: sizeHeight * 0.01,
                                                    ),
                                                    Container(
                                                      width: sizeWidth * 0.6,
                                                      margin: EdgeInsets.only(
                                                          left:
                                                              sizeWidth * 0.07),
                                                      child: Text(
                                                        item['tanggal'],
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff959595),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  );
                                }))
                      ],
                    ),
                  ),
                  Container(
                    width: sizeWidth * 0.85,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ListView.builder(
                                itemCount: list_item2.length,
                                itemBuilder: (_, int index) {
                                  var item = list_item2[index];
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
                                                        BorderRadius.circular(
                                                            25.0)),
                                                child: Image.asset(
                                                    "assets/images/${item['gambar']}.jpg"),
                                              ),
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: sizeWidth * 0.5,
                                                      margin: EdgeInsets.only(
                                                          left:
                                                              sizeWidth * 0.07),
                                                      child: Text(
                                                        item['nama'],
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xff3E4957),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: sizeHeight * 0.01,
                                                    ),
                                                    Container(
                                                      width: sizeWidth * 0.5,
                                                      margin: EdgeInsets.only(
                                                          left:
                                                              sizeWidth * 0.07),
                                                      child: Text(
                                                        item['keterangan'],
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xff3E4957),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: sizeHeight * 0.01,
                                                    ),
                                                    Container(
                                                      width: sizeWidth * 0.5,
                                                      margin: EdgeInsets.only(
                                                          left:
                                                              sizeWidth * 0.07),
                                                      child: Text(
                                                        item['tanggal'],
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff959595),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: sizeWidth * 0.1,
                                                child: Text(
                                                  'x${item['jumlah']}',
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 18,
                                                      color: Color(0xff3E4957)),
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  );
                                }))
                      ],
                    ),
                  ),
                ],
              ))
            ])));
  }
}
