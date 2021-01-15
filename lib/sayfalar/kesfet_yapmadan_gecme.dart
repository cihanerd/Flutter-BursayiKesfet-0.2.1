import 'package:flutter/material.dart';

class KesfetYapmadanGecme extends StatefulWidget {
  @override
  _KesfetYapmadanGecmeState createState() => _KesfetYapmadanGecmeState();
}

class _KesfetYapmadanGecmeState extends State<KesfetYapmadanGecme> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 32.0, left: 16.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Yapmadan geçme",
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
          padding: EdgeInsets.only(top: 32.0, left: 16.0),
          child: Row(
            children: <Widget>[
              Text(
                "Eski kaplıcada banyo yapmadan dönme",
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.0),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 55.0, bottom: 42.0, left: 16.0, right: 16.0),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/yapmadanGecme.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 10.0, top: 240),
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
