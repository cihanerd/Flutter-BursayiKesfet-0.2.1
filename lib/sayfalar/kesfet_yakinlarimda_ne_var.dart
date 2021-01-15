import 'package:flutter/material.dart';

class KesfetYakinlarimdaNevar extends StatefulWidget {
  @override
  _KesfetYakinlarimdaNevarState createState() =>
      _KesfetYakinlarimdaNevarState();
}

class _KesfetYakinlarimdaNevarState extends State<KesfetYakinlarimdaNevar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Row(
            children: <Widget>[
              Text(
                "Yakınlarımda Ne Var?",
                style: TextStyle(fontSize: 24.0),
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
                  top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/yakinimdakiler.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
