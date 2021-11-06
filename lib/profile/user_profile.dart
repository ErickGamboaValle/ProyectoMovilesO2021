// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_final/home/homePage.dart';
import 'package:proyecto_final/login/bloc/login_bloc.dart';
import 'package:proyecto_final/profile/bloc/update_bloc.dart';

class userProfile extends StatefulWidget {
  userProfile({Key? key}) : super(key: key);

  @override
  _userProfileState createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  var _formKey = GlobalKey<FormState>();

  final FirebaseAuth auth = FirebaseAuth.instance;
  File? _img;
  late UpdateBloc _updateBloc;

  //pick image
  Future<File?> _getImage() async {
    final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxHeight: 720,
        maxWidth: 720,
        imageQuality: 85);

    if (pickedImage != null) {
      return File(pickedImage.path);
    } else {
      return null;
    }
  }

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homePage()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.history,
                  color: Colors.black,
                ),
                onPressed: () {
                  // do something
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
          body: Container(
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
            child: BlocProvider(
              create: (context) {
                _updateBloc = UpdateBloc();
                return _updateBloc;
              },
              child: BlocListener<UpdateBloc, UpdateState>(
                listener: (context, state) {
                  if (state is UpdatedState) Navigator.of(context).pop();
                },
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.all(24),
                    children: [
                      Container(
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            ////////////////////////////////////////////////////////////////////////////////////////////
                            CircleAvatar(
                                maxRadius: 84,
                                backgroundColor: Color(0xFFFFCDD2),
                                child: _img != null
                                    ? Container(
                                        width: 300.0,
                                        height: 300.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(_img!))),
                                      )
                                    : Container(
                                        width: 300.0,
                                        height: 300.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "${auth.currentUser!.photoURL}"))),
                                      )),
                            ////////////////////////////////////////////////////////////////////////////////////////////
                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: MediaQuery.of(context).size.width * 0.25,
                              child: CircleAvatar(
                                maxRadius: 24,
                                backgroundColor: Colors.black,
                                child: IconButton(
                                  tooltip: "Tomar Foto",
                                  color: Color(0xFFFFCDD2),
                                  onPressed: () async {
                                    _img = await _getImage();
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.cameraRetro,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //add the user info
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _updateBloc.add(
                              //TODO:
                              UploadImage(data: {
                                "User UID": auth.currentUser!.uid,
                                "User Name": auth.currentUser!.displayName,
                                "Email": auth.currentUser!.email,
                              }, img: _img),
                            );

                            Navigator.of(context).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFFCDD2)),
                        child: const Text(
                          'Update Image',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 40.0),
                            Text("${auth.currentUser!.displayName}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 10.0),
                            Text("Email: ${auth.currentUser!.email}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
