// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class homepage2 extends StatefulWidget {
  homepage2({Key? key}) : super(key: key);

  @override
  _homepage2State createState() => _homepage2State();
}

class _homepage2State extends State<homepage2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/wp6707078.jpg"), fit: BoxFit.cover),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 59,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFEAA4A4)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Image.asset(
                    'assets/icon_google.png',
                    width: 20,
                    height: 21,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  'or',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFEAA4A4),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Container(
                  width: 59,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFEAA4A4)),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Image.asset(
                    'assets/icon_apple.png',
                    width: 20,
                    height: 21,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
