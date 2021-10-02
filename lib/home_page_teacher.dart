// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homePageTeacher extends StatefulWidget {
  homePageTeacher({Key? key}) : super(key: key);

  @override
  _homePageTeacherState createState() => _homePageTeacherState();
}

class _homePageTeacherState extends State<homePageTeacher> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFCDD2),
          title: Text("Welcome, NAME", style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () {
                // Ir al perfil del usuario
              },
            ),
            IconButton(
              icon: Icon(
                Icons.history,
                color: Colors.black,
              ),
              onPressed: () {
                // Regresar al home
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: const [
              Colors.transparent,
              Color(0xFFFFCDD2),
              Colors.black,
            ],
          )),
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
                trailing: CircleAvatar(
                  child: Icon(
                    Icons.arrow_forward,
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.black),
          backgroundColor: Color(0xFFFFCDD2),
          onPressed: () {},
        ),
      ),
    );
  }
}
