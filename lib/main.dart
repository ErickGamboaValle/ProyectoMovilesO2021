import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final/home/home_page_alumns.dart';
import 'package:proyecto_final/login/login_page.dart';
import 'package:proyecto_final/splash_screen.dart';
import 'package:proyecto_final/user_profile.dart';
import 'package:proyecto_final/user_summary.dart';
import 'auth/bloc/auth_bloc.dart';
import 'home/home_page_teacher.dart';

void main() async {
  // inicializar firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    BlocProvider(
      create: (context) => AuthBloc()..add(VerifyAuthEvent()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AlreadyAuthState) {
            return homePageTeacher();
          } else if (state is UnAuthState) {
            return loginpage();
          } else {
            return SplashScreen();
          }
        },
      ),
    );
  }
}
