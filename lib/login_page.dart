// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
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
                              print(
                                  "hola google"); //falta implementar el login de google
                            },
                            icon: Image.asset('assets/googlepink.png'),
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
                          print(
                              "hola apple"); //falta implementar el login de apple
                        },
                        icon: Image.asset('assets/applepink.png'),
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
