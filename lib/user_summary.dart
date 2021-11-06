// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proyecto_final/profile/user_profile.dart';

import 'home/homePage.dart';

class userSummary extends StatefulWidget {
  userSummary({Key? key}) : super(key: key);

  @override
  _userSummaryState createState() => _userSummaryState();
}

class _userSummaryState extends State<userSummary> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFCDD2),
          title: Text(
            "Grades",
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () {
                // Ir al perfil de usuario
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => userProfile()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onPressed: () {
                // Regresar al Home
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homePage()),
                );
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          //aqui va la imagen de fondo
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.transparent,
                Color(0xFFFFCDD2),
                Colors.black,
              ],
            ),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              //JAVA
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                selected: true,
                selectedTileColor: Color(0xFFFFCDD2),
                leading: CircleAvatar(
                  //aqui va la imagen de Java
                  child: Image.asset('assets/py.png'),
                  backgroundColor: Colors.transparent,
                ),
                title: Center(
                  child: Text(
                    "Python",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    "Grade: 83",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                trailing: CircleAvatar(
                  child: Icon(
                    Icons.file_download,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
