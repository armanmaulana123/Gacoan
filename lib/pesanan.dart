import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gacoan/bottom_nav.dart';

class pesanan extends StatefulWidget {
  @override
  _pesananState createState() => _pesananState();
}

class _pesananState extends State<pesanan> with SingleTickerProviderStateMixin {
  late TabController _tabBarMenu;
  var list_item1 = [];
  var list_item2 = [];
  var list_item3 = [];
  var list_item4 = [];

  void initState() {
    _tabBarMenu = TabController(length: 4, vsync: this);
    super.initState();
    getDataMenu1();
    getDataMenu2();
    getDataMenu3();
    getDataMenu4();
  }

  void _showSimpleDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Text(
                "Pesanan Berhasil Dibuat",
                style: TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return BottomNav();
                  })));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text("Ok",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: Colors.black)),
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _tabBarMenu.dispose();
  }

  getDataMenu1() {
    var colMenu1 = FirebaseFirestore.instance.collection('menu1');
    colMenu1.get().then((value) {
      setState(() {
        list_item1 = value.docs.map((e) {
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

  getDataMenu2() {
    var colMenu2 = FirebaseFirestore.instance.collection('menu2');
    colMenu2.get().then((value) {
      setState(() {
        list_item2 = value.docs.map((e) {
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

  getDataMenu3() {
    var colMenu3 = FirebaseFirestore.instance.collection('menu3');
    colMenu3.get().then((value) {
      setState(() {
        list_item3 = value.docs.map((e) {
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

  getDataMenu4() {
    var colMenu4 = FirebaseFirestore.instance.collection('menu4');
    colMenu4.get().then((value) {
      setState(() {
        list_item4 = value.docs.map((e) {
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
    final _appBar = AppBar(
      backgroundColor: Colors.grey[50],
      elevation: 0,
      toolbarHeight: sizeHeight * 0.08,
      title: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Lokasi Anda",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  color: Color(0xffEC008D)),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Jalan Sumatera Gg. 5,...",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  color: Color(0xff3E4957)),
            ),
          ),
        ],
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Color(0xff00B3D8)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return BottomNav();
          })));
        },
      ),
      actions: [
        Container(
          height: sizeHeight * 0.1,
          width: sizeWidth * 0.2,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              size: 36,
            ),
            color: Color(0xffb1b1b1),
          ),
        ),
        Container(
          height: sizeHeight * 0.1,
          width: sizeWidth * 0.2,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark_border_outlined,
              size: 36,
            ),
            color: Color(0xffb1b1b1),
          ),
        )
      ],
    );
    return Scaffold(
        appBar: _appBar,
        body: Column(children: [
          Center(
            child: Container(
              width: sizeWidth * 0.87,
              color: Color(0xffEAEAEA),
              margin: EdgeInsets.only(top: 5, bottom: 25),
              child: Row(
                children: [
                  IconButton(
                      icon:
                          Icon(Icons.search_outlined, color: Color(0xffBDBDBD)),
                      onPressed: () {}),
                  Text(
                    "Cari Menu Favorite Anda...",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        color: Color(0xffbdbdbd)),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
              width: sizeWidth * 0.87,
              height: 2,
              child: Container(
                color: Color(0xffb1b1b1),
              )),
          Container(
            width: sizeWidth * 0.87,
            margin: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Container(
                  width: sizeWidth * 0.6,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Rekomendasi Untuk Kamu",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff3E4957)),
                  ),
                ),
                Container(
                  width: sizeWidth * 0.27,
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Lihat Semua",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        color: Color(0xffEC008D)),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                width: sizeWidth * 0.87,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 25, top: 5),
                child: TabBar(
                  controller: _tabBarMenu,
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
                        text: 'Mie',
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Tab(
                        text: 'Gorengan',
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Tab(
                        text: 'Minuman',
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
              child: TabBarView(controller: _tabBarMenu, children: [
            Container(
              width: sizeWidth * 0.85,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: list_item1.length,
                            itemBuilder: (_, int index) {
                              var item = list_item1[index];
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
                                                  width: sizeWidth * 0.40,
                                                  margin: EdgeInsets.only(
                                                      left: sizeWidth * 0.05),
                                                  child: Text(
                                                    item['nama'],
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff3E4957),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: sizeHeight * 0.005,
                                                ),
                                                Container(
                                                  width: sizeWidth * 0.40,
                                                  margin: EdgeInsets.only(
                                                      left: sizeWidth * 0.05),
                                                  child: Text(
                                                    item['keterangan'],
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff3E4957),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: sizeHeight * 0.005,
                                                ),
                                                Container(
                                                  width: sizeWidth * 0.40,
                                                  margin: EdgeInsets.only(
                                                      left: sizeWidth * 0.05),
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
                                              width: sizeWidth * 0.22,
                                              child: Column(children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      item['rating'],
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xff3E4957)),
                                                    ),
                                                    Container(
                                                      child: IconButton(
                                                        onPressed: () async {
                                                          var collection =
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'tersimpan');
                                                          var res =
                                                              await collection
                                                                  .add({
                                                            'nama':
                                                                item['nama'],
                                                            'harga':
                                                                item['harga'],
                                                            'keterangan': item[
                                                                'keterangan'],
                                                            'rating':
                                                                item['rating'],
                                                            'gambar':
                                                                item['gambar']
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .bookmark_border_outlined,
                                                          size: 25,
                                                        ),
                                                        color:
                                                            Color(0xffb1b1b1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .white)),
                                                    onPressed: () async {
                                                      var collection =
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'pesanan');
                                                      var res =
                                                          await collection.add({
                                                        'nama': item['nama'],
                                                        'harga': item['harga'],
                                                        'keterangan':
                                                            item['keterangan'],
                                                        'rating':
                                                            item['rating'],
                                                        'gambar': item['gambar']
                                                      });
                                                    },
                                                    child: Text(
                                                      "+",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xff3E4957)),
                                                    ),
                                                  ),
                                                ),
                                              ]))
                                        ],
                                      )),
                                ],
                              );
                            })),
                  ]),
            ),
            Container(
              width: sizeWidth * 0.85,
              margin: EdgeInsets.only(top: 10),
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
                                                  width: sizeWidth * 0.40,
                                                  margin: EdgeInsets.only(
                                                      left: sizeWidth * 0.05),
                                                  child: Text(
                                                    item['nama'],
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff3E4957),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: sizeHeight * 0.005,
                                                ),
                                                Container(
                                                  width: sizeWidth * 0.40,
                                                  margin: EdgeInsets.only(
                                                      left: sizeWidth * 0.05),
                                                  child: Text(
                                                    item['keterangan'],
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff3E4957),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: sizeHeight * 0.005,
                                                ),
                                                Container(
                                                  width: sizeWidth * 0.40,
                                                  margin: EdgeInsets.only(
                                                      left: sizeWidth * 0.05),
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
                                              width: sizeWidth * 0.22,
                                              child: Column(children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      item['rating'],
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xff3E4957)),
                                                    ),
                                                    Container(
                                                      child: IconButton(
                                                        onPressed: () async {
                                                          var collection =
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'tersimpan');
                                                          var res =
                                                              await collection
                                                                  .add({
                                                            'nama':
                                                                item['nama'],
                                                            'harga':
                                                                item['harga'],
                                                            'keterangan': item[
                                                                'keterangan'],
                                                            'rating':
                                                                item['rating'],
                                                            'gambar':
                                                                item['gambar']
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .bookmark_border_outlined,
                                                          size: 25,
                                                        ),
                                                        color:
                                                            Color(0xffb1b1b1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .white)),
                                                    onPressed: () async {
                                                      var collection =
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'pesanan');
                                                      var res =
                                                          await collection.add({
                                                        'nama': item['nama'],
                                                        'harga': item['harga'],
                                                        'keterangan':
                                                            item['keterangan'],
                                                        'rating':
                                                            item['rating'],
                                                        'gambar': item['gambar']
                                                      });
                                                    },
                                                    child: Text(
                                                      "+",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xff3E4957)),
                                                    ),
                                                  ),
                                                ),
                                              ]))
                                        ],
                                      )),
                                ],
                              );
                            })),
                  ]),
            ),
            Container(
              width: sizeWidth * 0.85,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: list_item3.length,
                            itemBuilder: (_, int index) {
                              var item = list_item3[index];
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
                                                  width: sizeWidth * 0.40,
                                                  margin: EdgeInsets.only(
                                                      left: sizeWidth * 0.05),
                                                  child: Text(
                                                    item['nama'],
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff3E4957),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: sizeHeight * 0.005,
                                                ),
                                                Container(
                                                  width: sizeWidth * 0.40,
                                                  margin: EdgeInsets.only(
                                                      left: sizeWidth * 0.05),
                                                  child: Text(
                                                    item['keterangan'],
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff3E4957),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: sizeHeight * 0.005,
                                                ),
                                                Container(
                                                  width: sizeWidth * 0.40,
                                                  margin: EdgeInsets.only(
                                                      left: sizeWidth * 0.05),
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
                                              width: sizeWidth * 0.22,
                                              child: Column(children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      item['rating'],
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xff3E4957)),
                                                    ),
                                                    Container(
                                                      child: IconButton(
                                                        onPressed: () async {
                                                          var collection =
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'tersimpan');
                                                          var res =
                                                              await collection
                                                                  .add({
                                                            'nama':
                                                                item['nama'],
                                                            'harga':
                                                                item['harga'],
                                                            'keterangan': item[
                                                                'keterangan'],
                                                            'rating':
                                                                item['rating'],
                                                            'gambar':
                                                                item['gambar']
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .bookmark_border_outlined,
                                                          size: 25,
                                                        ),
                                                        color:
                                                            Color(0xffb1b1b1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .white)),
                                                    onPressed: () async {
                                                      var collection =
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'pesanan');
                                                      var res =
                                                          await collection.add({
                                                        'nama': item['nama'],
                                                        'harga': item['harga'],
                                                        'keterangan':
                                                            item['keterangan'],
                                                        'rating':
                                                            item['rating'],
                                                        'gambar': item['gambar']
                                                      });
                                                    },
                                                    child: Text(
                                                      "+",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xff3E4957)),
                                                    ),
                                                  ),
                                                ),
                                              ]))
                                        ],
                                      )),
                                ],
                              );
                            })),
                  ]),
            ),
            Container(
              width: sizeWidth * 0.85,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: list_item4.length,
                            itemBuilder: (_, int index) {
                              var item = list_item4[index];
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
                                                  width: sizeWidth * 0.40,
                                                  margin: EdgeInsets.only(
                                                      left: sizeWidth * 0.05),
                                                  child: Text(
                                                    item['nama'],
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff3E4957),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: sizeHeight * 0.005,
                                                ),
                                                Container(
                                                  width: sizeWidth * 0.40,
                                                  margin: EdgeInsets.only(
                                                      left: sizeWidth * 0.05),
                                                  child: Text(
                                                    item['keterangan'],
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xff3E4957),
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: sizeHeight * 0.005,
                                                ),
                                                Container(
                                                  width: sizeWidth * 0.40,
                                                  margin: EdgeInsets.only(
                                                      left: sizeWidth * 0.05),
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
                                              width: sizeWidth * 0.22,
                                              child: Column(children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      item['rating'],
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 18,
                                                          color: Color(
                                                              0xff3E4957)),
                                                    ),
                                                    Container(
                                                      child: IconButton(
                                                        onPressed: () async {
                                                          var collection =
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'tersimpan');
                                                          var res =
                                                              await collection
                                                                  .add({
                                                            'nama':
                                                                item['nama'],
                                                            'harga':
                                                                item['harga'],
                                                            'keterangan': item[
                                                                'keterangan'],
                                                            'rating':
                                                                item['rating'],
                                                            'gambar':
                                                                item['gambar']
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .bookmark_border_outlined,
                                                          size: 25,
                                                        ),
                                                        color:
                                                            Color(0xffb1b1b1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .white)),
                                                    onPressed: () async {
                                                      var collection =
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'pesanan');
                                                      var res =
                                                          await collection.add({
                                                        'nama': item['nama'],
                                                        'harga': item['harga'],
                                                        'keterangan':
                                                            item['keterangan'],
                                                        'rating':
                                                            item['rating'],
                                                        'gambar': item['gambar']
                                                      });
                                                    },
                                                    child: Text(
                                                      "+",
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xff3E4957)),
                                                    ),
                                                  ),
                                                ),
                                              ]))
                                        ],
                                      )),
                                ],
                              );
                            })),
                  ]),
            ),
          ])),
          Container(
            width: sizeWidth * 0.87,
            child: ElevatedButton(
                onPressed: () {
                  _showSimpleDialog(context);
                },
                child: Text("Buat Pesanan",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          )
        ]));
  }
}
