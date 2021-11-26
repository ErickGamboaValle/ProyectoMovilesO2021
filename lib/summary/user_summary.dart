// ignore_for_file: prefer_const_constructors, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/PDF/grade_export.dart';
import 'package:proyecto_final/profile/user_profile.dart';
import 'package:proyecto_final/summary/bloc/summary_bloc.dart';

import '../home/homePage.dart';

class userSummary extends StatefulWidget {
  userSummary({Key? key}) : super(key: key);

  @override
  _userSummaryState createState() => _userSummaryState();
}

class _userSummaryState extends State<userSummary> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => SummaryBloc()..add(RequestDataEvent()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFFFCDD2),
            title: Text("Grades", style: TextStyle(color: Colors.black)),
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
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Ir al perfil del usuario
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => userProfile()),
                  );
                },
              ),
            ],
          ),
          body:
              //Background
              Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: const [
                  Colors.transparent,
                  Color(0xFFFFCDD2),
                  Colors.black,
                ],
              ),
            ),
            //Elements
            child: BlocConsumer<SummaryBloc, SummaryState>(
              listener: (context, state) {
                if (state is NoDataState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("No se encontraron datos..."),
                  ));
                }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ExistingDataState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: ListView.builder(
                      itemCount: state.gradresList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            selected: true,
                            selectedTileColor: Color(0xFFFFCDD2),
                            leading: CircleAvatar(
                              child: Image(
                                  image: AssetImage("assets/images/check.png")),
                              backgroundColor: Colors.transparent,
                            ),
                            title: Center(
                              child: Text(
                                "${state.gradresList.keys.toList()[index]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            subtitle: Center(
                              child: Text(
                                "Grade: ${state.gradresList.values.toList()[index]}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return Center(
                  child: Text(
                    "No hay datos que mostrar aun...",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.download, color: Colors.black),
            backgroundColor: Color(0xFFFFCDD2),
            onPressed: () => {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => (gradesExport()),
                ),
              ),
            },
          ),
        ),
      ),
    );
  }
}
