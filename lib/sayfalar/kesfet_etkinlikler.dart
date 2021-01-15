import 'package:flutter/material.dart';

class KesfetEtkinlikler extends StatefulWidget {
  @override
  _KesfetEtkinliklerState createState() => _KesfetEtkinliklerState();
}

class _KesfetEtkinliklerState extends State<KesfetEtkinlikler> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(bottom: 28.0, left: 16.0, top: 28.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Etkinlikler",
                style: TextStyle(fontSize: 24.0),
              ),
              GestureDetector(
                child: Text(
                  "detay...",
                  style: TextStyle(color: Colors.lightBlue, fontSize: 16),
                ),
                onTap: () {
                  print("basıldı");
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60.0, left: 16.0),
          child: Row(
            children: <Widget>[
              Text(
                "Bursa'daki tüm etkinlikler",
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 90.0, left: 16.0, right: 16.0, bottom: 30.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset('assets/images/etkinlik.png'),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 25,
              height: 40,
              width: 40,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(3, 2),
                        blurRadius: 15,
                        spreadRadius: 0.02,
                      ),
                    ]),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "26\nAralık",
                        style:
                            TextStyle(color: Color.fromRGBO(3, 144, 156, 100)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 280),
          child: Text(
            "Venedik Taciri",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 16.0, top: 310, bottom: 40, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    'assets/icons/Calendar.png',
                    scale: 62,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Text(
                    "26 Aralık 2020",
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(Icons.watch_later_outlined, size: 13),
                  SizedBox(
                    width: 2.0,
                  ),
                  Text(
                    "Saat 20:00",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              SizedBox(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/Location.png',
                      color: Colors.black,
                      scale: 62,
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Text(
                      "Tayyare Kültür Merkezi",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 10.0, top: 345),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/likeKesfet.png',
                    ),
                    onPressed: () => {},
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    icon: Image.asset('assets/icons/todoKesfet.png'),
                    onPressed: () => {},
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                      icon: Image.asset('assets/icons/shoppingCart.png'),
                      onPressed: () => {}),
                ],
              ),
              IconButton(
                icon: Image.asset('assets/icons/shareKesfet.png'),
                onPressed: () => {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
