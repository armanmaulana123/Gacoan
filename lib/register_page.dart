import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gacoan/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var nama = '';
  var email = '';
  var telepon = '';
  var pass = '';

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: sizeWidth * 0.45,
              height: sizeHeight * 0.2,
              child: Image(
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: sizeWidth * 0.4,
              child: Text(
                "Buat Akun",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  color: Color(0xff00B3D8),
                ),
              ),
            ),
            SizedBox(
              height: sizeHeight * 0.05,
            ),
            Container(
              width: sizeWidth,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              height: sizeHeight * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Color(0xff00B3D8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Nama",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      style: TextStyle(height: sizeHeight * 0.0005),
                      showCursor: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        // enabledBorder: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onChanged: (v) {
                        nama = v;
                      },
                    ),
                  ),
                  Container(
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      controller: _emailController,
                      style: TextStyle(height: sizeHeight * 0.0005),
                      showCursor: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        // enabledBorder: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onChanged: (v) {
                        email = v;
                      },
                    ),
                  ),
                  Container(
                    child: Text(
                      "No. Telepon",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      style: TextStyle(height: sizeHeight * 0.0005),
                      showCursor: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        // enabledBorder: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onChanged: (v) {
                        telepon = v;
                      },
                    ),
                  ),
                  Container(
                    child: Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: _passwordController,
                      style: TextStyle(height: sizeHeight * 0.0005),
                      showCursor: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        // enabledBorder: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      onChanged: (v) {
                        pass = v;
                      },
                    ),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.02,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () async {
                        var collection =
                            FirebaseFirestore.instance.collection('akun');
                        var res = await collection.add({
                          'nama': nama,
                          'email': email,
                          'telepon': telepon,
                          'password': pass
                        });

                        print(res);
                        _doSignUp();
                      },
                      child: Text(
                        "Daftar",
                        style: TextStyle(color: Color(0xff00B3D8)),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        primary: Colors.white,
                        side: BorderSide(
                          color: Color(0xff00B3D8),
                        ),
                        minimumSize: Size.fromHeight(50),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "Sudah Memiliki Akun?",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: ((context) {
                              return LoginPage();
                            })));
                          },
                          child: Text(
                            "Masuk",
                            style: TextStyle(
                              color: Color(0xffEC008D),
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _doSignUp() async {
    try {
      var email = _emailController.text;
      var passs = _passwordController.text;

      print('sedang daftar');
      var res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: passs,
      );

      print('Hasil Daftar : ');
      print(res);

      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text("Registrasi Berhasil, Silakan Login"),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return LoginPage();
      }));
    } catch (e) {
      print('exception daftar');
      print(e.runtimeType);
      if (e is FirebaseAuthException) {
        print(e);
        print(e.message);
      }

      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text("Email atau Password Salah"),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
