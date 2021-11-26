// ignore_for_file: file_names

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as Pw;
import 'package:flutter/material.dart';

class gradesExport extends StatefulWidget {
  @override
  State<gradesExport> createState() => _gradesExportState();
}

Future<Map<String, dynamic>?> _getExams() async {
  final _cFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  try {
    var grades = await _cFirestore
        .collection("UserProfile")
        .doc(auth.currentUser!.uid)
        .get();
    return grades.get("Grades");
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future<Map<String, dynamic>?> _getAnswers() async {
  final _cFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  try {
    var answers = await _cFirestore
        .collection("UserProfile")
        .doc(auth.currentUser!.uid)
        .get();
    return answers.get("Answers");
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future<Map<String, dynamic>?> _getRealAnswers() async {
  final _cFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  try {
    var answers = await _cFirestore
        .collection("examsHome")
        .doc(auth.currentUser!.uid)
        .get();
    return answers.get("Answers");
  } catch (e) {
    print(e.toString());
    return null;
  }
}

class _gradesExportState extends State<gradesExport> {
  final _cFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> _generatePdfPage() async {
    final pdfDoc = Pw.Document(
      title: "Respuestas del quizz: ${widget.key}",
    );

    //final _coverImage = Pw.MemoryImage(await _downloadFile(widget.img!));
    //cambiar coverImage por los datos de la collection de Firebase

    var gradeList = await _getExams();
    var answerList = await _getAnswers();

    Pw.Page _customPdfContent = Pw.Page(
      build: (Pw.Context context) {
        return Pw.Container(
          child: Pw.ListView(
            children: <Pw.Widget>[
              Pw.Text("Your Grades: \n", style: Pw.TextStyle(fontSize: 25)),
              Pw.ListView.builder(
                itemCount: gradeList!.length,
                itemBuilder: (Pw.Context context, int index) {
                  return Pw.Padding(
                    padding: Pw.EdgeInsets.only(top: 8, bottom: 8),
                    child: Pw.Text(
                        "${gradeList.keys.toList()[index]} : ${gradeList.values.toList()[index]}"),
                  );
                },
              ),
              Pw.SizedBox(height: 20),
              Pw.Text("Your Answers: \n ", style: Pw.TextStyle(fontSize: 25)),
              Pw.Text("${answerList.toString()}"),
            ],
          ),
        );
      },
    );

    pdfDoc.addPage(_customPdfContent);
    // Genera archivo pdf y lo guarda
    String path = (await getExternalStorageDirectory())!.path;
    File file = File("$path/Grade${gradeList}.pdf");
    await file.writeAsBytes(await pdfDoc.save());
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Grades preview",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFFFCDD2),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
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
        child: FutureBuilder(
          future: _generatePdfPage(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("Error al crear el Documento"));
            } else if (snapshot.hasData) {
              final pdfController = PdfController(
                document: PdfDocument.openFile("${snapshot.data}"),
              );
              return PdfView(controller: pdfController);
            } else {
              return const Text("Renderizando archivo");
            }
          },
        ),
      ),
    );
  }
}
