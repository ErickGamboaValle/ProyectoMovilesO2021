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
          title: Text("Perfil de usuario"),
          backgroundColor: Colors.pink[200],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          //aqui va la imagen de fondo
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage("assets/wp6707020.jpg"), fit: BoxFit.cover),
          // ),
          //aqui se van a mostrar todos los datos del usuario
          child: ListView(
            children: [
              Text("Perfil del usuario")
            ], //aqui se van a mostrar todos los datos del usuario
          ),
        ),
      ),
    );
  }
}
