import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  File? image;

  void _showSimpleDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Text(
                "Buka Dengan",
                style: TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  aksesCamera();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text("Kamera",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: Colors.black)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  aksesGaleri();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text("Galeri",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        color: Colors.black)),
              )
            ],
          );
        });
  }

  aksesCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? img = await _picker.pickImage(source: ImageSource.camera);

    image = File(img!.path);
    setState(() {});
  }

  aksesGaleri() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? img = await _picker.pickImage(source: ImageSource.gallery);

    image = File(img!.path);
    setState(() {});
  }

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
                width: sizeWidth * 0.8,
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Container(
                      width: sizeWidth * 0.25,
                      height: sizeHeight * 0.25,
                      child: CircleAvatar(
                          child: ClipOval(
                              child: image == null
                                  ? Image.asset("assets/images/lluuu.jpg")
                                  : CircleAvatar(
                                      radius: 50,
                                      child: Image.file(
                                        image!,
                                      )))),
                    ),
                    TextButton(
                      onPressed: () {
                        _showSimpleDialog(context);
                      },
                      child: Text("Ubah Foto",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffEC008D))),
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
                        decoration: InputDecoration(labelText: '****'),
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