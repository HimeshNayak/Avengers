import 'package:flutter/material.dart';
import '../services/root.dart';
import '../services/authMethods.dart';

class LoginPage extends StatefulWidget {
  final AuthMethods auth;
  LoginPage({@required this.auth});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  void toggleIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text('Login with Google'),
                    ),
                  ),
                  onPressed: () {
                    toggleIsLoading();
                    widget.auth.signInWithGoogle().whenComplete(() {
                      toggleIsLoading();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Root(auth: widget.auth)),
                          (route) => false);
                    });
                  },
                ),
              ],
            ),
            Visibility(
              visible: isLoading,
              child: Container(
                child: Center(child: CircularProgressIndicator()),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Colors.black45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
