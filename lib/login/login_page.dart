// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_final/home/homePage.dart';
import 'package:proyecto_final/login/bloc/login_bloc.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'dart:io' show Platform;

class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  // inicializar instacia de login bloc
  // para poder agregar eventos al bloc
  // al presionar los botones de login
  late LoginBloc _loginBloc;

  //static final bool isIOS = (_operatingSystem == "ios");

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  Widget _Email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFFFFEBEE),
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Enter your Email',
              hintStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _Password() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFFFFEBEE),
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Enter your Password',
              hintStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /*****************************Imagen*****************************/
        body: BlocProvider(
          create: (context) {
            _loginBloc = LoginBloc();
            return _loginBloc;
          },
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginErrorState) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text("${state.error}:\n${state.code}"),
                    );
                  },
                );
              }
            },
            builder: (context, state) {
              if (state is LoginSuccessState) {
                return homePage();
              }
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/loginBackground.jpg"),
                      fit: BoxFit.cover),
                ),
                /*****************************Login*****************************/
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 500.0),
                        Text("Welcome back!",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold)),

                        //_Email(),

                        //_Password(),

                        /*Container(
                          child: RaisedButton(
                            elevation: 5,
                            onPressed: () => print("Login Button"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Color(0xFFFFCDD2),
                            child: Text("Login",
                                style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 1.5,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                )),
                          ),
                        ),*/

                        Column(
                          children: const <Widget>[
                            /*Text(
                              '- OR -',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),*/
                            SizedBox(height: 30.0),
                            Text('Sign in with',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                )),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 59,
                              height: 48,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFEAA4A4)),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  // invocar al login de firebase con el bloc
                                  // recodar configurar pantallad Oauth en google Cloud
                                  print("google");
                                  // agregar evento al login bloc
                                  _loginBloc.add(LoginWithGoogleEvent());
                                },
                                icon: Image.asset(
                                    'assets/images/googleLogin.png'),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'or',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFEAA4A4),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 59,
                              height: 48,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFEAA4A4)),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () async {
                                  final credential = await SignInWithApple
                                      .getAppleIDCredential(
                                    scopes: [
                                      AppleIDAuthorizationScopes.email,
                                      AppleIDAuthorizationScopes.fullName,
                                    ],
                                    webAuthenticationOptions:
                                        WebAuthenticationOptions(
                                      // TODO: Set the `clientId` and `redirectUri` arguments to the values you entered in the Apple Developer portal during the setup
                                      clientId:
                                          'com.aboutyou.dart_packages.sign_in_with_apple.example',
                                      redirectUri: Uri.parse(
                                        'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
                                      ),
                                    ),
                                    // TODO: Remove these if you have no need for them
                                    nonce: 'example-nonce',
                                    state: 'example-state',
                                  );

                                  print(credential);

                                  // This is the endpoint that will convert an authorization code obtained
                                  // via Sign in with Apple into a session in your system

                                  final signInWithAppleEndpoint = Uri(
                                    scheme: 'https',
                                    host:
                                        'flutter-sign-in-with-apple-example.glitch.me',
                                    path: '/sign_in_with_apple',
                                    queryParameters: <String, String>{
                                      'code': credential.authorizationCode,
                                      if (credential.givenName != null)
                                        'firstName': credential.givenName!,
                                      if (credential.familyName != null)
                                        'lastName': credential.familyName!,
                                      'useBundleId': 'true',
                                      /*
                                          Platform.isIOS || Platform.isMacOS
                                              ? 'true'
                                              : 'false',*/
                                      if (credential.state != null)
                                        'state': credential.state!,
                                    },
                                  );

                                  final session = await http.Client().post(
                                    signInWithAppleEndpoint,
                                  );

                                  // If we got this far, a session based on the Apple ID credential has been created in your system,
                                  // and you can now set this as the app's session
                                  print(session);
                                },
                                icon:
                                    Image.asset('assets/images/appleLogin.png'),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
