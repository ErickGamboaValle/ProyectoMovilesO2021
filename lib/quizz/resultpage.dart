import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/home/homePage.dart';

class resultpage extends StatefulWidget {
  int marks;
  var answers = [];
  String langname;
  resultpage(
      {Key? key,
      required this.marks,
      required this.answers,
      required this.langname})
      : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  _resultpageState createState() => _resultpageState(marks, answers, langname);
}

class _resultpageState extends State<resultpage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<String> images = ["assets/images/bad.png", "assets/images/good.png"];

  late String message;
  late String image;

  @override
  void initState() {
    if (marks < 60) {
      image = images[0];
      message = "You Should Try Hard...";
    } else {
      image = images[1];
      message = "You Did Very Well...";
    }
    super.initState();
  }

  String langname;
  int marks;
  var answers = [];

  _resultpageState(this.marks, this.answers, this.langname);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFCDD2),
          title:
              Text("$langname Result", style: TextStyle(color: Colors.black)),
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
          /*child: BlocProvider(
              create: (context) {
                _updateBloc = UpdateBloc();
                return _updateBloc;
              },
              child: BlocListener<UpdateBloc, UpdateState>(
                listener: (context, state) {
                  if (state is UpdatedState) Navigator.of(context).pop();
                },*/
          child: Form(
            //key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(24),
              children: [
                Container(
                  child: Stack(alignment: Alignment.topCenter, children: [
                    ////////////////////////////////////////////////////////////////////////////////////////////
                    CircleAvatar(
                        maxRadius: 84,
                        backgroundColor: Color(0xFFFFCDD2),
                        child: Container(
                          width: 300.0,
                          height: 300.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: AssetImage(image))),
                        ))
                  ]),
                  ////////////////////////////////////////////////////////////////////////////////////////////
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 40.0),
                        Text("GRADE: $marks",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10.0),
                        Text("$message",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                            )),
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  elevation: 5,
                  onPressed: () async {
                    print(langname);
                    print(answers);
                    print(marks);
                    print("${auth.currentUser!.uid}");

                    await FirebaseFirestore.instance
                        .collection("UserProfile")
                        .doc("${auth.currentUser!.uid}")
                        .update({
                      "Grades.$langname": marks,
                      "Answers.$langname": answers,
                    });

                    /*
                        .update({
                      "Grades": {langname: marks},
                      "Answers": {langname: answers},
                    });*/
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => homePage(),
                    ));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Color(0xFFFFCDD2),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
