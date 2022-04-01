import 'dart:html';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      backgroundColor: Colors.grey[50],
      elevation: 0,
      centerTitle: true,
      toolbarHeight: sizeHeight * 0.08,
      title: Image(
        image: AssetImage("assets/images/logo.png"),
        width: sizeWidth * 0.5,
        height: sizeHeight * 0.06,
      ),
      leading: Center(
        child: Container(
          width: sizeWidth * 0.1,
          height: sizeHeight * 0.1,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/baphomet.jpg"),
          ),
        ),
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
      ],
      leadingWidth: sizeWidth * 0.2,
    );

    final bodyHeight = sizeHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: myAppBar,
      body: Container(
        height: bodyHeight,
        width: sizeWidth,
        padding:
            EdgeInsets.only(left: sizeWidth * 0.05, right: sizeWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: bodyHeight * 0.02,
            ),
            Container(
              child: Text(
                "Hello Mate",
                style: TextStyle(
                    color: Color(0xffEC008D),
                    fontSize: 18,
                    fontFamily: "Poppins"),
              ),
            ),
            Container(
              child: Text(
                "Lebih Hemat Pakai Voucher",
                style: TextStyle(
                    color: Color(0xff3E4957),
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InkWell(
                  // onTap: () => print("ciao"),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        child: Image.asset("assets/images/mie_iblis.jpg",
                            // width: 300,
                            height: bodyHeight * 0.15,
                            fit: BoxFit.cover),
                      ),
                      ListTile(
                        title: Text(
                          'Mie Iblis',
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Hanya Rp. 4000',
                          style: TextStyle(
                              fontFamily: "Poppins", color: Color(0xffEC008D)),
                        ),
                        trailing: ElevatedButton(
                            onPressed: () {}, child: Text("Ambil")),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: bodyHeight * 0.02,
            ),
            Container(
              child: Text(
                "Outlets Kami",
                style: TextStyle(
                    color: Color(0xff00B3D8),
                    fontSize: 18,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: bodyHeight * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text(
                    "Malang",
                    style: TextStyle(
                        color: Color(0xff3E4957),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    "Semarang",
                    style: TextStyle(
                        color: Color(0xff3E4957),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    "Cirebon",
                    style: TextStyle(
                        color: Color(0xff3E4957),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: bodyHeight * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text(
                    "Surabaya",
                    style: TextStyle(
                        color: Color(0xff3E4957),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    "Solo",
                    style: TextStyle(
                        color: Color(0xff3E4957),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    "Bali",
                    style: TextStyle(
                        color: Color(0xff3E4957),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: bodyHeight * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text(
                    "Yogyakarta",
                    style: TextStyle(
                        color: Color(0xff3E4957),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    "Bandung",
                    style: TextStyle(
                        color: Color(0xff3E4957),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    "Jember",
                    style: TextStyle(
                        color: Color(0xff3E4957),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: bodyHeight * 0.02,
            ),
            Container(
                child: Row(
              children: [
                Text(
                  "Popular",
                  style: TextStyle(
                      color: Color(0xff00B3D8),
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xff00B3D8),
                ),
                SizedBox(
                  width: sizeWidth * 0.44,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.grey,
                          fontSize: 14),
                    ))
              ],
            )),
            SizedBox(
              height: bodyHeight * 0.02,
            ),
            Container(
              width: sizeWidth * 0.88,
              height: bodyHeight * 0.1,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("assets/images/mie_iblis.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.8), BlendMode.dstATop))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Aneka Mie",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w800,
                          fontSize: 14),
                    ),
                    Text(
                      "Mie Angel - Mie Iblis - Mie Setan",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: bodyHeight * 0.02,
            ),
            Container(
              width: sizeWidth * 0.88,
              height: bodyHeight * 0.1,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage("assets/images/mie_iblis.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.8), BlendMode.dstATop))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Aneka Mie",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w800,
                          fontSize: 14),
                    ),
                    Text(
                      "Mie Angel - Mie Iblis - Mie Setan",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              Icons.home,
              color: Color(0xff00B3D8),
              size: 30,
            ),
            Icon(
              Icons.schedule_outlined,
              color: Colors.grey,
              size: 30,
            ),
            Icon(
              Icons.description_outlined,
              color: Colors.grey,
              size: 30,
            ),
            Icon(
              Icons.bookmark_added_outlined,
              color: Colors.grey,
              size: 30,
            ),
            Icon(
              Icons.person_outline,
              color: Colors.grey,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
