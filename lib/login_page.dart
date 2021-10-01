// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  Widget _Email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFFFFEBEE),
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Enter your Email',
              hintStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _Password() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFFFFEBEE),
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Enter your Password',
              hintStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /*****************************Imagen*****************************/
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/loginBackground.jpg"),
                fit: BoxFit.cover),
          ),
          /*****************************Login*****************************/
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Welcome back!",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 30.0),
                  _Email(),
                  SizedBox(height: 30.0),
                  _Password(),
                  SizedBox(height: 30.0),
                  Container(
                    child: RaisedButton(
                      elevation: 5,
                      onPressed: () => print("Login Button"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Color(0xFFFFCDD2),
                      child: Text("Login",
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          )),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Column(
                    children: const <Widget>[
                      Text(
                        '- OR -',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text('Sign in with',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          )),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Row(
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
                        child: IconButton(
                          onPressed: () {
                            print(
                                "hola google"); //falta implementar el login de google
                          },
                          icon: Image.asset('assets/googleLogin.png'),
                        ),
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
                          icon: Image.asset('assets/appleLogin.png'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
