import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:proyecto_final/quizz/resultpage.dart';

class getjson extends StatelessWidget {
  String langname;
  getjson(this.langname);
  String? assettoload;

  @override
  Widget build(BuildContext context) {
    assettoload = "assets/quizz/$langname.json";
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload!, cache: false),
      builder: (context, snapshot) {
        List? mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return const Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          //print(mydata);
          return quizpage(mydata: mydata, langname: langname);
        }
      },
    );
  }
}

class quizpage extends StatefulWidget {
  final List mydata;
  String langname;
  quizpage({Key? key, required this.mydata, required this.langname}) : super(key: key);
  @override
  _quizpageState createState() => _quizpageState(mydata, langname);
}

class _quizpageState extends State<quizpage> {
  final List mydata;
  String langname;
  _quizpageState(this.mydata, this.langname);

  Color colortoshow = const Color(0xFFFFCDD2);
  Color right = Colors.green.shade200;
  Color wrong = Colors.black;
  int marks = 0;
  int i = 0;
  bool disableAnswer = false;
  // extra varibale to iterate
  int j = 1;
  int timer = 30;
  String showtimer = "30";
  var random_array;

  Map<String, Color> btncolor = {
    "a": const Color(0xFFFFCDD2),
    "b": const Color(0xFFFFCDD2),
    "c": const Color(0xFFFFCDD2),
    "d": const Color(0xFFFFCDD2),
  };

  bool canceltimer = false;

  genrandomarray() {
    var distinctIds = [];
    var rand = new Random();
    for (int i = 0; i < 10; i++) {
      distinctIds.add(i);
      //distinctIds.add(rand.nextInt(10));
      //random_array = distinctIds.toSet().toList();
      random_array = distinctIds;
      if (random_array.length < 10) {
        //print(i);
        continue;
      } else {
        break;
      }
    }
    print(random_array);
  }

  @override
  void initState() {
    starttimer();
    genrandomarray();
    super.initState();
  }

  // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  //String langname = langname;
  void nextquestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (j < 10) {
        i = random_array[j];
        j++;
      } else {
        print(answers.toString());
        print(langname);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(marks: marks, answers: answers, langname: langname),
        ));
      }
      btncolor["a"] = const Color(0xFFFFCDD2);
      btncolor["b"] = const Color(0xFFFFCDD2);
      btncolor["c"] = const Color(0xFFFFCDD2);
      btncolor["d"] = const Color(0xFFFFCDD2);
      disableAnswer = false;
    });
    starttimer();
  }

  var answers = [];
  void checkanswer(String k) {
    answers.add(mydata[2][i.toString()]);
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + 10;
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
      canceltimer = true;
      disableAnswer = true;
    });
    Timer(Duration(seconds: 2), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  Future<bool> redirectTo() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("You Can't Go Back At This Stage."),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    //Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ok',
                  ),
                )
              ],
            ));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return redirectTo();
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.transparent,
                Color(0xFFFFCDD2),
                Colors.black,
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    mydata[0][i.toString()],
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Quando",
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: AbsorbPointer(
                  absorbing: disableAnswer,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        choicebutton('a'),
                        choicebutton('b'),
                        choicebutton('c'),
                        choicebutton('d'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Center(
                    child: Text(
                      showtimer,
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
