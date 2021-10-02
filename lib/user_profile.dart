// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';

class userProfile extends StatefulWidget {
  userProfile({Key? key}) : super(key: key);

  @override
  _userProfileState createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFCDD2),
          title: Text("Your profile", style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.history,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 5, right: 5),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.transparent,
              Color(0xFFFFCDD2),
              Colors.black,
            ],
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300.0,
                  height: 300.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: const AssetImage('assets/kendalljenner.jpg'))),
                ),
                SizedBox(height: 30),
                const Text("Kendall Jenner",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 30.0),
                Text("Email: kjenner@icloud.com",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    )),
                Text("Phone: 3321309901",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    )),
                Text("Birthdate: October 23, 1997",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    )),
                Text("Gender: Female",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
