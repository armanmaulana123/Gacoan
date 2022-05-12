import 'package:flutter/material.dart';
import 'package:gacoan/editProfile_page.dart';
import 'package:gacoan/login_page.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              "Profil Saya",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"),
            ),
          ),
          backgroundColor: Colors.white,
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
                width: sizeWidth * 0.85,
                child: Row(
                  children: [
                    Container(
                      width: sizeWidth * 0.2,
                      height: sizeHeight * 0.2,
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image.asset("assets/images/lluuu.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      width: sizeWidth * 0.5,
                      margin: const EdgeInsets.only(left: 25),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Lulu Anggriani",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: sizeHeight * 0.01,
                            ),
                            Text(
                              "luluanggriani@gmail.com",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  color: Color(0xffb1b1b1)),
                            ),
                            SizedBox(
                              height: sizeHeight * 0.01,
                            ),
                            Text(
                              "+6281234567890",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  color: Color(0xffb1b1b1)),
                            )
                          ]),
                    ),
                    Container(
                      width: sizeWidth * 0.05,
                      child: InkWell(
                        child: Icon(
                          Icons.edit,
                          size: 30,
                          color: Color(0xff00B3D8),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return editProfile();
                          })));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: sizeWidth * 0.85,
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  "Akun",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff00B3D8)),
                ),
              ),
              Container(
                width: sizeWidth * 0.85,
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.description_outlined,
                      size: 35,
                      color: Colors.grey,
                    ),
                    Container(
                      width: sizeWidth * 0.7,
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: sizeWidth * 0.6,
                                  child: Text("Pesanan",
                                      style: TextStyle(
                                          fontFamily: "Poppins", fontSize: 16)),
                                ),
                                Container(
                                  width: sizeWidth * 0.1,
                                  child: Text(
                                    ">",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 30,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: sizeWidth * 0.7,
                            height: 1,
                            child: Container(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: sizeWidth * 0.85,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_city_outlined,
                      size: 35,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: sizeWidth * 0.6,
                                  child: Text("Alamat",
                                      style: TextStyle(
                                          fontFamily: "Poppins", fontSize: 16)),
                                ),
                                Container(
                                  width: sizeWidth * 0.1,
                                  child: Text(">",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 30,
                                        color: Colors.grey,
                                      ),
                                      textAlign: TextAlign.right),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: sizeWidth * 0.7,
                            height: 1,
                            child: Container(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: sizeWidth * 0.85,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.card_membership_outlined,
                      size: 35,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: sizeWidth * 0.6,
                                  child: Text("Voucher Saya",
                                      style: TextStyle(
                                          fontFamily: "Poppins", fontSize: 16)),
                                ),
                                Container(
                                  width: sizeWidth * 0.1,
                                  child: Text(
                                    ">",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 30,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: sizeWidth * 0.7,
                            height: 1,
                            child: Container(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: sizeWidth * 0.85,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.help_center_outlined,
                      size: 35,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: sizeWidth * 0.6,
                                  child: Text("Bantuan",
                                      style: TextStyle(
                                          fontFamily: "Poppins", fontSize: 16)),
                                ),
                                Container(
                                  width: sizeWidth * 0.1,
                                  child: Text(
                                    ">",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 30,
                                      color: Colors.grey,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: sizeWidth * 0.7,
                            height: 1,
                            child: Container(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: sizeWidth * 0.85,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout_outlined,
                      size: 35,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) {
                                  return LoginPage();
                                })));
                              },
                              child: Container(
                                  child: Row(
                                children: [
                                  Container(
                                    width: sizeWidth * 0.6,
                                    child: Text("Keluar",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16)),
                                  ),
                                  Container(
                                    width: sizeWidth * 0.1,
                                    child: Text(">",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 30,
                                          color: Colors.grey,
                                        ),
                                        textAlign: TextAlign.right),
                                  )
                                ],
                              ))),
                          SizedBox(
                            width: sizeWidth * 0.7,
                            height: 1,
                            child: Container(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: sizeWidth * 0.85,
                margin: EdgeInsets.only(top: 35),
                child: Text(
                  "Info Lainnya",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff00B3D8)),
                ),
              ),
              Container(
                width: sizeWidth * 0.85,
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.payment_outlined,
                      size: 35,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: sizeWidth * 0.6,
                                  child: Text("Cara Pembayaran",
                                      style: TextStyle(
                                          fontFamily: "Poppins", fontSize: 16)),
                                ),
                                Container(
                                  width: sizeWidth * 0.1,
                                  child: Text(">",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 30,
                                        color: Colors.grey,
                                      ),
                                      textAlign: TextAlign.right),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: sizeWidth * 0.7,
                            height: 1,
                            child: Container(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: sizeWidth * 0.85,
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_rate_outlined,
                      size: 35,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: sizeWidth * 0.6,
                                  child: Text("Nilai Kami",
                                      style: TextStyle(
                                          fontFamily: "Poppins", fontSize: 16)),
                                ),
                                Container(
                                  width: sizeWidth * 0.1,
                                  child: Text(">",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 30,
                                        color: Colors.grey,
                                      ),
                                      textAlign: TextAlign.right),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: sizeWidth * 0.7,
                            height: 1,
                            child: Container(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sizeHeight * 0.15,
              )
            ])));
  }
}
