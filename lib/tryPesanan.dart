import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gacoan/tryAddPesanan.dart';

class pesanann extends StatefulWidget {
  @override
  _pesanannState createState() => _pesanannState();
}

class _pesanannState extends State<pesanann> {
  var list_item = [];

  void initState() {
    super.initState();
    getData();
  }

  getData() {
    var colPesanan = FirebaseFirestore.instance.collection('pesanan');
    colPesanan.get().then((value) {
      setState(() {
        list_item = value.docs.map((e) {
          return {'nama': e['nama'], 'harga': e['harga']};
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
              "Pesanan",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return addPesanan();
                  })));
                },
                icon: Icon(
                  Icons.add,
                  color: Color(0xff00B3D8),
                ))
          ],
          backgroundColor: Colors.white,
        ),
        body: Container(
            child: Column(
          children: [
            Container(
                width: sizeWidth * 0.9,
                margin: EdgeInsets.only(top: 35),
                child: Text(
                  "Daftar Pesanan",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                )),
            Expanded(
                child: ListView.builder(
                    itemCount: list_item.length,
                    itemBuilder: (_, int index) {
                      var item = list_item[index];
                      return ListTile(
                        title: Text(item['nama']),
                        subtitle: Text(item['harga']),
                      );
                    })),
          ],
        )));
  }
}
