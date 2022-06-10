import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class voucher extends StatefulWidget {
  @override
  _voucherState createState() => _voucherState();
}

class _voucherState extends State<voucher> {
  var list_item = [];

  void initState() {
    super.initState();
    getDataVoucher();
  }

  getDataVoucher() {
    var colPesanan = FirebaseFirestore.instance.collection('voucher');
    colPesanan.get().then((value) {
      setState(() {
        list_item = value.docs.map((e) {
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
          Container(
            padding: EdgeInsets.only(
                top: 15, left: sizeWidth * 0.05, right: sizeWidth * 0.05),
            child: Row(children: [
              Container(
                child: Text(
                  "All",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      color: Color(0xff00B3D8)),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: sizeWidth * 0.05),
                  child: Text("Tersedia",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          color: Color(0xffb1b1b1)))),
              Container(
                  padding: EdgeInsets.only(left: sizeWidth * 0.05),
                  child: Text("Terpakai",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          color: Color(0xffb1b1b1))))
            ]),
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
              child: ListView.builder(
                  itemCount: list_item.length,
                  itemBuilder: (_, int index) {
                    var item = list_item[index];
                    return Container(
                      padding: EdgeInsets.only(
                          top: 15,
                          left: sizeWidth * 0.05,
                          right: sizeWidth * 0.05),
                      child: Container(
                        width: sizeWidth * 0.9,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch, // add this
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
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
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    item['tagline'],
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Color(0xffEC008D)),
                                  ),
                                  trailing: ElevatedButton(
                                      onPressed: () {}, child: Text("Pakai")),
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
    );
  }
}