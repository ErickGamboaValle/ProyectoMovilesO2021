// ignore_for_file: prefer_const_constructors, file_names
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/auth/bloc/auth_bloc.dart';
import 'package:proyecto_final/home/bloc/home_bloc.dart';
import 'package:proyecto_final/profile/user_profile.dart';
import 'package:proyecto_final/user_summary.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(SignOutAuthEvent());
              },
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) => HomeBloc()..add(RequestDataEvent()),
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
            child: BlocConsumer<HomeBloc, HomeState>(
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
                      itemCount: state.examsList.length,
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
                                  image: NetworkImage(
                                      "${state.examsList[index]["image"]}")),
                              backgroundColor: Colors.transparent,
                            ),
                            title: Center(
                              child: Text(
                                "${state.examsList[index]["name"]}",
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
                //////////////////////////////////////////////////////////////////////////
                /*return ListView(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          /////////////////////////////////////////////////////////////////////
                          ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            selected: true,
                            selectedTileColor: Color(0xFFFFCDD2),
                            leading: CircleAvatar(
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
                          //////////////////////////////////////////////////////////////////////
                        ],
                      ); */
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
