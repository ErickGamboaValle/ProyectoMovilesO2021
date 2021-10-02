import 'package:flutter/material.dart';
import 'package:proyecto_final/home_page_alumns.dart';
import 'package:proyecto_final/login_page.dart';
import 'package:proyecto_final/user_profile.dart';
import 'package:proyecto_final/user_summary.dart';

import 'home_page_teacher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return loginpage();
    //return userProfile();
    //return homePageTeacher();
    return userSummary();
  }
}
