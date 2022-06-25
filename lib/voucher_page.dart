import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class voucher extends StatefulWidget {
  @override
  _voucherState createState() => _voucherState();
}

class _voucherState extends State<voucher> with SingleTickerProviderStateMixin {
  late TabController _tabBarVoucher;
  var list_item1 = [];
  var list_item2 = [];
  var list_item3 = [];

  void initState() {
    _tabBarVoucher = TabController(length: 3, vsync: this);
    super.initState();
    getDataVoucher1();
    getDataVoucher2();
    getDataVoucher3();
  }

  @override
  void dispose() {
    super.dispose();
    _tabBarVoucher.dispose();
  }

  getDataVoucher1() {
    var colPesanan1 = FirebaseFirestore.instance.collection('voucher1');
    colPesanan1.get().then((value) {
      setState(() {
        list_item1 = value.docs.map((e) {
          return {
            'nama': e['nama'],
            'tagline': e['tagline'],
            'gambar': e['gambar']
          };
        }).toList();
      });
    });
  }

  getDataVoucher2() {
    var colPesanan2 = FirebaseFirestore.instance.collection('voucher2');
    colPesanan2.get().then((value) {
      setState(() {
        list_item2 = value.docs.map((e) {
          return {
            'nama': e['nama'],
            'tagline': e['tagline'],
            'gambar': e['gambar']
          };
        }).toList();
      });
    });
  }

  getDataVoucher3() {
    var colPesanan3 = FirebaseFirestore.instance.collection('voucher3');
    colPesanan3.get().then((value) {
      setState(() {
        list_item3 = value.docs.map((e) {
          return {
            'nama': e['nama'],
            'tagline': e['tagline'],
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
          title: Text(
            "Voucher",
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff00B3D8)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: sizeHeight * 0.015,
                  child: Container(
                    color: Color(0xffe1e1e1),
                  )),
              Container(
                width: sizeWidth * 1,
                padding: EdgeInsets.only(
                    top: 15, left: sizeWidth * 0.05, right: sizeWidth * 0.05),
                child: Text(
                  "Promo Yang Anda Miliki",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3E4957)),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    width: sizeWidth * 0.6,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 25, top: 5),
                    child: TabBar(
                      controller: _tabBarVoucher,
                      labelColor: Color(0xff00B3D8),
                      unselectedLabelColor: Color(0xffB1B1B1),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      labelPadding: EdgeInsets.symmetric(horizontal: 2),
                      tabs: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Tab(
                            text: "All",
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Tab(
                            text: 'Tersedia',
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Tab(
                            text: 'Terpakai',
                          ),
                        ),
                      ],
                    )),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 15, left: sizeWidth * 0.05, right: sizeWidth * 0.05),
                child: SizedBox(
                  height: sizeHeight * 0.002,
                  child: Container(
                    color: Color(0xffe1e1e1),
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(controller: _tabBarVoucher, children: [
                Container(
                  width: sizeWidth * 0.85,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: list_item1.length,
                              itemBuilder: (_, int index) {
                                var item = list_item1[index];
                                return Container(
                                  padding: EdgeInsets.only(
                                      top: 15,
                                      left: sizeWidth * 0.05,
                                      right: sizeWidth * 0.05),
                                  child: Container(
                                    width: sizeWidth * 0.9,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .stretch, // add this
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                              child: Image.asset(
                                                  "assets/images/${item['gambar']}.jpg",
                                                  // width: 300,
                                                  height: sizeHeight * 0.15,
                                                  fit: BoxFit.cover),
                                            ),
                                            ListTile(
                                              title: Text(
                                                item['nama'],
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Text(
                                                item['tagline'],
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    color: Color(0xffEC008D)),
                                              ),
                                              trailing: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text("Pakai")),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })),
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
                                return Container(
                                  padding: EdgeInsets.only(
                                      top: 15,
                                      left: sizeWidth * 0.05,
                                      right: sizeWidth * 0.05),
                                  child: Container(
                                    width: sizeWidth * 0.9,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .stretch, // add this
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                              child: Image.asset(
                                                  "assets/images/${item['gambar']}.jpg",
                                                  // width: 300,
                                                  height: sizeHeight * 0.15,
                                                  fit: BoxFit.cover),
                                            ),
                                            ListTile(
                                              title: Text(
                                                item['nama'],
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Text(
                                                item['tagline'],
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    color: Color(0xffEC008D)),
                                              ),
                                              trailing: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text("Pakai")),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })),
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
                              itemCount: list_item3.length,
                              itemBuilder: (_, int index) {
                                var item = list_item3[index];
                                return Container(
                                  padding: EdgeInsets.only(
                                      top: 15,
                                      left: sizeWidth * 0.05,
                                      right: sizeWidth * 0.05),
                                  child: Container(
                                    width: sizeWidth * 0.9,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .stretch, // add this
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                              child: Image.asset(
                                                  "assets/images/${item['gambar']}.jpg",
                                                  // width: 300,
                                                  height: sizeHeight * 0.15,
                                                  fit: BoxFit.cover),
                                            ),
                                            ListTile(
                                              title: Text(
                                                item['nama'],
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Text(
                                                item['tagline'],
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    color: Color(0xffEC008D)),
                                              ),
                                              trailing: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text("Hapus")),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })),
                    ],
                  ),
                )
              ]))
            ]));
  }
}
