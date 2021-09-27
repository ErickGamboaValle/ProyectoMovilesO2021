// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /*****************************Imagen*****************************/
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/wp6707078.jpg"), fit: BoxFit.cover),
          ),
          /*****************************Texto*****************************/
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login or sign in",
                  style: GoogleFonts.blinker(
                      color: Color(0xFFEAA4A4),
                      fontSize: 30,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 25,
                ),
                /*****************************Botones*****************************/
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
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
                          child: IconButton(
                            onPressed: () {
                              print("hola google");
                            },
                            icon: Image.asset('assets/icon_google.png'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFEAA4A4),
                      ),
                    ),
                    SizedBox(
                      width: 20,
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
                      child: IconButton(
                        onPressed: () {
                          print("hola apple");
                        },
                        icon: Image.asset('assets/icon_apple.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
