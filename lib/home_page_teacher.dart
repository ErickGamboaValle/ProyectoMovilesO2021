// ignore_for_file: prefer_const_constructors
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
          backgroundColor: Colors.pink[200],
          title: Text("Bienvenido profesor"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          //aqui va la imagen de fondo
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/wp6707078.jpg"), fit: BoxFit.cover),
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
                selectedTileColor: Colors.grey[300],
                leading: CircleAvatar(
                  //aqui va la imagen de Java
                  child: Text(
                    "img Java",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                ),
                title: Center(
                  child: Text(
                    "Java",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                trailing: CircleAvatar(
                  child: Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.pink[200],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //python
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                selected: true,
                selectedTileColor: Colors.grey[300],
                leading: CircleAvatar(
                  //aqui va la imagen del python
                  child: Text(
                    "img Python",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                ),
                title: Center(
                  child: Text(
                    "Python",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                trailing: CircleAvatar(
                  child: Icon(
                    Icons.access_alarm,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.pink[200],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //linux
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                selected: true,
                selectedTileColor: Colors.grey[300],
                leading: CircleAvatar(
                  //aqui va la imagen de linux
                  child: Text(
                    "img Linux",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                ),
                title: Center(
                  child: Text(
                    "Linux",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                trailing: CircleAvatar(
                  child: Icon(
                    Icons.adb,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.pink[200],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.pink[200],
          onPressed: () {},
        ),
      ),
    );
  }
}
