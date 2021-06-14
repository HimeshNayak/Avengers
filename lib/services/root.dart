import 'package:flutter/material.dart';
import '../services/authMethods.dart';
import '../screens/homePage.dart';

class Root extends StatelessWidget {
  // This widget is the root of your application.
  final AuthMethods auth;
  Root({@required this.auth});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avengers Rexora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(auth: auth),
    );
  }
}
