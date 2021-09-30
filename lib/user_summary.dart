import 'package:flutter/material.dart';

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
          title: Text("Resumen del usuario"),
          backgroundColor: Colors.pink[200],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          //aqui va la imagen de fondo
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage("assets/wp6707020.jpg"), fit: BoxFit.cover),
          // ),
          //aqui se van a mostrar todos los examenes del usuario
          child: ListView(
            children: [Text("Resumen del usuario")],
          ),
        ),
      ),
    );
  }
}
