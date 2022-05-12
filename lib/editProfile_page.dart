import 'package:flutter/material.dart';

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Profil",
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
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
                width: sizeWidth * 0.8,
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Container(
                      width: sizeWidth * 0.25,
                      height: sizeHeight * 0.25,
                      child: CircleAvatar(
                        child: ClipOval(
                            child: Image.asset("assets/images/lluuu.jpg")),
                      ),
                    ),
                    InkWell(
                      child: Text(
                        "Ubah Foto",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffEC008D)),
                      ),
                    )
                  ],
                ),
              ),
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
                        decoration:
                            InputDecoration(labelText: 'Lulu Anggriani'),
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
                      child: Text("Email",
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
                        decoration: InputDecoration(
                            labelText: 'luluanggriani@gmail.com'),
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
                      child: Text("Telepon",
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
                        decoration:
                            InputDecoration(labelText: '+6281234567890'),
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
                      child: Text("Password",
                          style: TextStyle(
                            color: Color(0xff3E4957),
                            fontFamily: "Poppins",
                            fontSize: 15,
                          )),
                    ),
                    Expanded(
                        child: Container(
                      width: 10.0,
                      margin: EdgeInsets.only(left: 25),
                      child: TextField(
                        decoration: InputDecoration(labelText: '********'),
                      ),
                    )),
                  ],
                ),
              ),
              InkWell(
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
