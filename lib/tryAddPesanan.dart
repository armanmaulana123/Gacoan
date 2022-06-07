import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addPesanan extends StatefulWidget {
  @override
  _addPesananState createState() => _addPesananState();
}

class _addPesananState extends State<addPesanan> {
  var nama = '';
  var harga = '';

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Tambah Pesanan",
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
        body: SingleChildScrollView(
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
                margin: EdgeInsets.only(left: 35, right: 35, top: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: sizeWidth * 0.2,
                      margin: EdgeInsets.only(top: 20),
                      child: Text("Nama",
                          style: TextStyle(
                            color: Color(0xff3E4957),
                            fontFamily: "Poppins",
                            fontSize: 15,
                          )),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 25),
                      child: TextField(
                        decoration: InputDecoration(labelText: 'nama menu'),
                        onChanged: (v) {
                          nama = v;
                        },
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35, top: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: sizeWidth * 0.2,
                      margin: EdgeInsets.only(top: 20),
                      child: Text("Harga",
                          style: TextStyle(
                            color: Color(0xff3E4957),
                            fontFamily: "Poppins",
                            fontSize: 15,
                          )),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 25),
                      child: TextField(
                        decoration: InputDecoration(labelText: 'harga menu'),
                        onChanged: (v) {
                          harga = v;
                        },
                      ),
                    ))
                  ],
                ),
              ),
              InkWell(
                  onTap: () async {
                    var collection =
                        FirebaseFirestore.instance.collection('pesanan');
                    var res =
                        await collection.add({'nama': nama, 'harga': harga});
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 35, right: 35),
                    width: sizeWidth * 10.0,
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          color: Color(0xffEC008D)),
                      textAlign: TextAlign.right,
                    ),
                  ))
            ])));
  }
}
