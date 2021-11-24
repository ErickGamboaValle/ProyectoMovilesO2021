// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFCDD2),
          title: Text("Welcome!", style: TextStyle(color: Colors.black)),
          actions: <Widget>[
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
            IconButton(
              icon: Icon(
                Icons.history,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => userSummary()),
                );
              },
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) => SummaryBloc()..add(RequestDataEvent()),
          //Background
          child: Container(
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
                                "${state.gradresList}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
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
        ),
        /*floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.black),
          backgroundColor: Color(0xFFFFCDD2),
          onPressed: () {},
        ), */
      ),
    );
  }
}
